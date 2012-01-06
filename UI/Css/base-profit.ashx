﻿<%@ WebHandler Language="C#" Class="Base" %>

using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Text;
using System.Text.RegularExpressions;
using System.Web;

public class Base : IHttpHandler
{
    private static readonly string[] s_mainCssFiles = new[] { "profit-reset.css", "profit-960.css", "profit-main.css", "profit-print.css" };
    private static readonly string[] s_ignoreFiles = new[] { "profit-ie6.css", "960.css", "main.css", "print.css", "reset.css" };
	private static bool s_minifyStyleSheet = true;

	private static DateTime s_lastModified = DateTime.MinValue;
	private static string s_content;

	#region IHttpHandler Members

	public void ProcessRequest(HttpContext context)
	{
		context.Response.ContentType = "text/css";
		context.Response.Cache.SetCacheability(HttpCacheability.Public);

		List<FileInfo> files = s_mainCssFiles.Select(item => new FileInfo(context.Server.MapPath(item))).ToList();
		var dirInfo = new DirectoryInfo(context.Server.MapPath("."));
		if (dirInfo.Exists)
			foreach (FileInfo file in dirInfo.GetFiles("*.css", SearchOption.AllDirectories))
				if (!s_ignoreFiles.Contains(file.Name) && !files.Exists(f => f.FullName.Equals(file.FullName, StringComparison.InvariantCultureIgnoreCase)))
					files.Add(file);

		DateTime lastModified = DateTime.MinValue;
		foreach (FileInfo item in files)
		{
			if (!item.Exists) continue;

			if (lastModified < item.LastWriteTimeUtc)
				lastModified = item.LastWriteTimeUtc;
		}

		if (lastModified != s_lastModified || s_content == null)
		{
			var sb = new StringBuilder();
			foreach (FileInfo item in files)
			{
				if (!item.Exists) continue;
				sb.AppendLine(ReadFileContents(item.FullName));
			}
			s_lastModified = lastModified;
			s_content = s_minifyStyleSheet ? MinifyStylesheets(sb.ToString()) : sb.ToString();
		}

		if (context.Request.Headers["If-None-Match"] != null && context.Request.Headers["If-None-Match"] == s_lastModified.Ticks.ToString())
		{
			context.Response.StatusCode = 304;
			return;
		}

		context.Response.Cache.SetETag(s_lastModified.Ticks.ToString());
		context.Response.Write(s_content ?? ".foo {}");
	}


	public bool IsReusable
	{
		get { return true; }
	}

	#endregion

	private static string ReadFileContents(string filename)
	{
		using (var file = new StreamReader(filename))
			return file.ReadToEnd();
	}

	private static string MinifyStylesheets(string body)
	{
		body = Regex.Replace(body, @"[a-zA-Z]+#", "#");
		body = Regex.Replace(body, @"[\n\r]+\s*", string.Empty);
		body = Regex.Replace(body, @"\s+", " ");
		body = Regex.Replace(body, @"\s?([:,;{}])\s?", "$1");
		body = body.Replace(";}", "}");
		body = Regex.Replace(body, @"([\s:]0)(px|pt|%|em)", "$1");

		// Remove comments from CSS
		body = Regex.Replace(body, @"/\*[\d\D]*?\*/", string.Empty);

		return body;
	}
}
