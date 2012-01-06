<%@ Application Language="C#" Inherits="Litium.Extensions.GlobalApplication" %>

<script RunAt="server">
	
	/// <summary>
	/// Handles the Start event of the Application control.
	/// </summary>
	/// <remarks>Don't remove the call on base.Application_Start in the method. 
	/// If you remove this method call the foundation will not startup on a correct way.</remarks>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected override void Application_Start(object sender, EventArgs e)
	{
		base.Application_Start(sender, e);
	}

	/// <summary>
	/// Handles the End event of the Application control.
	/// </summary>
	/// <remarks>Don't remove the call on base.Application_End in the method. 
	/// If you remove this method call the foundation will not end correct.</remarks>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected override void Application_End(object sender, EventArgs e)
	{
		base.Application_End(sender, e);
	}

	/// <summary>
	/// Handles the Error event of the Application control.
	/// </summary>
	/// <remarks>Don't remove the call on base.Application_Error in the method. 
	/// If you remove this method call the foundation will catch unhandle errors.</remarks>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected override void Application_Error(object sender, EventArgs e)
	{
		base.Application_Error(sender, e);
	}

	/// <summary>
	/// Handles the BeginRequest event of the Application control.
	/// </summary>
	/// <remarks>Don't remove the call on base.Application_BeginRequest in the method. 
	/// If you remove this method call the foundation will not work correctly.</remarks>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected override void Application_BeginRequest(object sender, EventArgs e)
	{
		base.Application_BeginRequest(sender, e);
	}

	/// <summary>
	/// Handles the OnStart event of the Session control.
	/// </summary>
	/// <remarks>Don't remove the call on base.Session_OnStart in the method. 
	/// If you remove this method call the foundation will not start users session that is needed for application to work.</remarks>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected override void Session_OnStart(object sender, EventArgs e)
	{
		base.Session_OnStart(sender, e);
	}

	/// <summary>
	/// Handles the OnEnd event of the Session control.
	/// </summary>
	/// <remarks>Don't remove the call on base.Session_OnEnd in the method. 
	/// If you remove this method call the foundation will not end sessions on a correct way.</remarks>
	/// <param name="sender">The source of the event.</param>
	/// <param name="e">The <see cref="System.EventArgs"/> instance containing the event data.</param>
	protected override void Session_OnEnd(object sender, EventArgs e)
	{
		base.Session_OnEnd(sender, e);
	}
	
</script>

