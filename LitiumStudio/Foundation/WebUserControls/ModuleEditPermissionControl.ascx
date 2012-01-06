<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControl_ModuleEditPermissionControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
<Telerik:RadAjaxManagerProxy ID="RadAjaxManagerProxy1" runat="server">
	<AjaxSettings>
		<Telerik:AjaxSetting AjaxControlID="MainContent">
			<UpdatedControls>
				<Telerik:AjaxUpdatedControl LoadingPanelID="LoadingPane" ControlID="MainContent" />
			</UpdatedControls>
		</Telerik:AjaxSetting>
	</AjaxSettings>
</Telerik:RadAjaxManagerProxy>
<Telerik:RadAjaxLoadingPanel runat="server" Skin="Windows7" ID="LoadingPane">
</Telerik:RadAjaxLoadingPanel>
<Telerik:RadAjaxPanel runat="server" CssClass="lsContentScroll" ID="MainContent">
	<Foundation:InformationGroup ID="InformationGroup1" runat="server" Width="730px">
	        <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td><fieldset><legend class="litBoldText"><Foundation:SystemString Name="Groups" runat="server" ID="Systemstring4"/>:</legend><img src="../images/transparent.gif" width="10" alt="" /><br />
					    <table border="0" cellspacing="0" cellpadding="0">
						    <tr>
							    <td valign="top"><asp:ListBox Runat="server" ID="c_listBoxGroup" Rows="10" AutoPostBack="True" OnSelectedIndexChanged="SelectGroup_Changed" CssClass="litInputSelect"/></td>
							    <td valign="top" style="padding-left:10px;" class="litText">
								    <asp:Repeater id="c_repeaterGroupPermission" runat="server">
									    <ItemTemplate>
										    <asp:CheckBox ID="CheckBox1" CssClass="litInputCheckbox" runat="server"/><br>
									    </ItemTemplate>
								    </asp:Repeater> 
							    </td>
						    </tr>
					    </table>
				    </fieldset></td>
			    </tr>
		    </table>
	</Foundation:InformationGroup>
</Telerik:RadAjaxPanel>
</div>
