<%@ WebHandler Language="C#" Class="Logout" %>

using System;
using System.Web;
using Litium.Foundation.Security;

public class Logout : IHttpHandler, System.Web.SessionState.IRequiresSessionState
{

	public void ProcessRequest(HttpContext context)
	{
        SecurityToken token = Litium.Foundation.Solution.Instance.LoginManager.GetLoggedInToken(context.Session);
        if  (token != null)
		    Litium.Foundation.Solution.Instance.LoginManager.Logout(token);
		context.Session.Clear();
		context.Response.Redirect("Default.aspx", true);
	}

	public bool IsReusable
	{
		get
		{
			return false;
		}
	}

}