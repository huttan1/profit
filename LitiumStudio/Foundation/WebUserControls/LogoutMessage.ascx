<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControls_LogoutMessage, Litum.Studio.Web" %>
<script type="text/javascript">
	// <![cdata[ 
	var logoutMessageDialogHasLoggedOut = false;
	function LogoutMessageDialogClose() 
	{
		if (logoutMessageDialogHasLoggedOut)
		{
			if (typeof(SetOnBeforeUnload) == "function")
				SetOnBeforeUnload();
			window.open('<%=Page.ResolveUrl("~" + Litium.Foundation.GUI.Constants.UrlConstants.LOGIN_PAGE) %>', '_self');
		} 
		else 
		{
			MakeHttpRequest('<%=Page.ResolveUrl("~/LitiumStudio/Foundation/SessionKeepAlive.aspx")%>?ts='+new Date(), function(){
				if (http_request.readyState == 4) { 
					if (http_request.status == 200) { 
						if (http_request.responseText == "OK"){
							LogoutMessageDialog.Close();
							window.setTimeout(function() {ShowLogoutWarning(false);}, <%=(1*60*1000)%>)
						} else {
							enableSessionTimeoutsInGui = true;
							ShowLogoutWarning(false);
							ShowLogoutWarning(true);
						}
					} 
				} 
			}, null);
		}
	}

    var enableSessionTimeoutsInGui = <%=EnableSessionTimeoutsInGui %>;
	function ShowLogoutWarning(isTimedOut)
	{
		if (isTimedOut)
		{	
			logoutMessageDialogHasLoggedOut = true;
			document.getElementById("c_logoutMessageDialogContent").innerHTML = document.getElementById("c_logoutMessageDialogContent2").innerHTML;
			document.getElementById("c_buttonLogoutDialogClose").value = document.getElementById("c_logoutMessageDialogButton2").innerHTML;
		}
		else
		{
		    if (!enableSessionTimeoutsInGui) 
		    {
		        LogoutMessageDialogClose();
		    }
		    else 
		    {
			    LogoutMessageDialog.Show();

			    document.getElementById("c_logoutMessageDialogTitle").innerHTML = document.getElementById("c_logoutMessageDialogHeader").innerHTML;
			    document.getElementById("c_logoutMessageDialogContent").innerHTML = document.getElementById("c_logoutMessageDialogContent1").innerHTML;
			    document.getElementById("c_buttonLogoutDialogClose").value = document.getElementById("c_logoutMessageDialogButton1").innerHTML;
    			window.setTimeout(function(){ShowLogoutWarning(true);}, 1.75*60*1000);
    		}
		}
	}
	window.setTimeout(function() {ShowLogoutWarning(false);}, <%=(1*60*1000)%>)
	// ]]> 
</script>
<div id="c_logoutMessageDialogContent1" style="display: none;"><Foundation:SystemString ID="SystemString5" runat="server" Name="LogoutMessageDialogMessage1" /></div>
<div id="c_logoutMessageDialogContent2" style="display: none;"><Foundation:SystemString ID="SystemString4" runat="server" Name="LogoutMessageDialogMessage2" /></div>
<div id="c_logoutMessageDialogHeader" style="display: none;"><Foundation:SystemString ID="SystemString3" runat="server" Name="LogoutMessageDialogHeader" /></div>
<div id="c_logoutMessageDialogButton1" style="display: none;"><Foundation:SystemString ID="SystemString2" runat="server" Name="LogoutMessageDialogButton1" /></div>
<div id="c_logoutMessageDialogButton2" style="display: none;"><Foundation:SystemString ID="SystemString1" runat="server" Name="LogoutMessageDialogButton2" /></div>
<ComponentArt:Dialog Alignment="MiddleCentre" ContentClientTemplateId="ContentClientTemplate"
	ContentCssClass="litModalPopupContent" FooterClientTemplateId="FooterClientTemplate" FooterCssClass="litModalPopupFooter"
	HeaderClientTemplateId="HeaderClientTemplate" ID="LogoutMessageDialog" Modal="true" HeaderCssClass="litModalPopupHeader"
	runat="server" Width="300" Height="300">
	<ClientEvents>
		<OnClose EventHandler="LogoutMessageDialogClose" />
	</ClientEvents>
	<ClientTemplates>
		<ComponentArt:ClientTemplate ID="HeaderClientTemplate">
			<table cellpadding="0" cellspacing="0" width="300" onmousedown="LogoutMessageDialog.StartDrag(event);">
				<tr>
					<td width="6">
						<img style="display: block;" src="~/LitiumStudio/Images/ca_dialog/top_left.gif" />
					</td>
					<td style="background-image: url(~/LitiumStudio/Images/ca_dialog/top.gif);
						padding: 3px; padding-bottom: 0px;">
						<table width="100%" height="100%" cellpadding="0" cellspacing="0">
							<tr>
								<td valign="bottom" class="litHeader3">
									<div id="c_logoutMessageDialogTitle"></div>
								</td>
								<td align="right" valign="middle">
								</td>
							</tr>
						</table>
					</td>
					<td width="30" style="background-image: url(~/LitiumStudio/Images/ca_dialog/top.gif);">
						<img id="Img2" style="display: block; margin-top: 2px;" src="~/LitiumStudio/Images/ca_dialog/close.gif"
							onclick="LogoutMessageDialogClose();">
					</td>
					<td width="6">
						<img id="Img3" style="display: block;" src="~/LitiumStudio/Images/ca_dialog/top_right.gif" />
					</td>
				</tr>
			</table>
		</ComponentArt:ClientTemplate>
		<ComponentArt:ClientTemplate ID="ContentClientTemplate">
			<div class="litModalPopupBody litText" id="c_logoutMessageDialogContent" style="width: 280px; padding: 10px">
			</div>
		</ComponentArt:ClientTemplate>
		<ComponentArt:ClientTemplate ID="FooterClientTemplate">
			<table class="litModalPopupBottom" cellpadding="0" cellspacing="0" width="300">
				<tr>
					<td style="background-repeat: repeat-y; background-image: url(~/LitiumStudio/Images/ca_dialog/left.gif);">
						<img style="display: block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif"
							height="1" width="6" />
					</td>
					<td style="text-align: right; padding-right: 2px; padding-bottom: 3px;">
						<input type="button" id="c_buttonLogoutDialogClose" onclick="LogoutMessageDialogClose();" class="litInputButton"
							value="" />
					</td>
					<td style="background-repeat: repeat-y; background-image: url(~/LitiumStudio/Images/ca_dialog/right.gif);">
						<img style="display: block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif"
							height="1" width="6" />
					</td>
				</tr>
				<tr>
					<td width="6">
						<img style="display: block;" src="~/LitiumStudio/Images/ca_dialog/bottom_left.png" />
					</td>
					<td style="background-image: url(~/LitiumStudio/Images/ca_dialog/bottom.gif);">
						<img style="display: block;" src="~/LitiumStudio/Images/ca_dialog/spacer.gif"
							height="5" width="1" />
					</td>
					<td width="6">
						<img style="display: block; background-repeat: repeat-y;" src="~/LitiumStudio/Images/ca_dialog/bottom_right.png" />
					</td>
				</tr>
			</table>
		</ComponentArt:ClientTemplate>
	</ClientTemplates>
</ComponentArt:Dialog>
