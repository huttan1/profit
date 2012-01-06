<%@ WebHandler Language="C#" Class="UserManual" %>

using Litium.Foundation;
using Litium.Foundation.GUI;
using System;
using System.Diagnostics;
using System.IO;
using System.Web;
using System.Web.Hosting;

using Litium.Studio.UI.Foundation.Common.Constants;

public class UserManual : IHttpHandler, System.Web.SessionState.IReadOnlySessionState
{
	public void ProcessRequest(HttpContext context)
	{
		context.Response.ContentType = "text/plain";

		System.Web.UI.WebControls.Literal dummy = new System.Web.UI.WebControls.Literal();
		
		if (System.IO.File.Exists(HostingEnvironment.MapPath(dummy.ResolveUrl("UserManual.pdf"))))
		{
			context.Response.Redirect(dummy.ResolveUrl("UserManual.pdf"), true);
			return;
		}

		FileVersionInfo version = FileVersionInfo.GetVersionInfo(typeof(Solution).Assembly.Location);
		context.Response.Redirect(string.Format(
			Solution.Instance.SystemStrings[SystemStringConstants.URL_USERMANUAL, FoundationContext.Current.LanguageID], 
			string.Format("{0}.{1}.{2}", version.FileMajorPart, version.FileMinorPart, version.FileBuildPart)
			));
	}

	public bool IsReusable
	{
		get
		{
			return false;
		}
	}

}