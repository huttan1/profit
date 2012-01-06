<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_Relations_SettingsFieldTemplateView, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemEdit" runat="server"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemDelete" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID= "LitiumStudioContentHeading" Runat="Server">
	<Foundation:ModuleString ID="ModuleString1" Name="SettingsFieldTemplateViewHeader" Runat="server"/>&nbsp;"<asp:Label runat="server" ID="c_labelTemplateName" />"
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<div><span class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="TemplateType" Runat="server" />:</span> <asp:Label ID="c_labelType" runat="server" CssClass="litText" /></div>
		<div style="margin-top:5px; margin-bottom:5px;"><span class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="Description" Runat="server" />:</span> <asp:Label ID="c_labelDescription" runat="server" CssClass="litText" /></div>
		<asp:Panel ID="c_panelCotactOptions" Visible="false" runat="server">
		    <div style="height:15px;"></div>
		    <fieldset><legend class="litBoldText"><Foundation:ModuleString ID="ModuleString4" Name="DescriptionSettingsForFields" Runat="server"/></legend><img src="images/transparent.gif" width="5" alt="" /><br />
			    <asp:Label id="c_labelSettingsFirstName" runat="server" />
			    <asp:Label id="c_labelSettingsMiddleName" runat="server" />
			    <asp:Label id="c_labelSettingsLastName" runat="server" />
			    <asp:Label id="c_labelSettingsEmail" runat="server" />
			    <asp:Label id="c_labelSettingsAddress1" runat="server" />
			    <asp:Label id="c_labelSettingsAddress2" runat="server" />
			    <asp:Label id="c_labelSettingsZipCode" runat="server" />
			    <asp:Label id="c_labelSettingsCity" runat="server" />
			    <asp:Label id="c_labelSettingsCountry" runat="server" />
			    <asp:Label id="c_labelSettingsPhoneHome" runat="server" />
			    <asp:Label id="c_labelSettingsPhoneWork" runat="server" />
			    <asp:Label id="c_labelSettingsPhoneMobile" runat="server" />
			    <asp:Label id="c_labelSettingsComments" runat="server" />
			    <asp:Label id="c_labelSettingsCompany" runat="server" />
			    <asp:Label id="c_labelSettingsPicture" runat="server" />
			    <asp:Label id="c_labelSettingsGender" runat="server" />
			    <asp:Label id="c_labelSettingsTitle" runat="server" />
			    <asp:Label id="c_labelSettingsCustomerNr" runat="server" />
			    <asp:Label id="c_labelSettingsBillingAddress" runat="server" />
			    <asp:Label id="c_labelSettingsDeliveryAddress" runat="server" />
			</fieldset>
		</asp:Panel>
		<asp:Panel ID="c_panelGroupOptions" Visible="false" runat="server">
			<asp:Label id="c_labelSettingsGroupDescription" runat="server" />
		</asp:Panel>
		<asp:Panel ID="c_panelOrganizationOptions" Visible="false" runat="server">
			<fieldset><legend class="litBoldText"><Foundation:ModuleString ID="ModuleStrin54" Name="DescriptionSettingsForFields" Runat="server"/></legend><img src="images/transparent.gif" width="5" alt="" /><br />
			    <asp:Label id="c_labelSettingsOrganizationDescription" runat="server" />
			    <asp:Label id="c_labelSettingsOrganizationCustomerNr" runat="server" />
				<asp:Label id="c_labelSettingsOrganizationDeliveryAddress" runat="server" />
			    <asp:Label id="c_labelSettingsOrganizationBillingAddress" runat="server" />
			</fieldset>
		</asp:Panel>
        <asp:Repeater ID="c_repeaterTemplates" runat="server" OnItemDataBound="RepeaterTemplates_ItemDataBound">
            <HeaderTemplate>
                <table cellpadding="0" cellspacing="0" border="0" style="width:950px; margin-top:30px;">
					<tr>
					    <th class="lsListHeader" align="left" style="width:25px;"><Foundation:ModuleString ID="ModuleString5" Name="FieldTemplateFieldIndex" Runat="server"/></th>
					    <th class="lsListHeader" align="left" style="width:25px;"><Foundation:ModuleString ID="ModuleString6" Name="FieldTemplateFieldGroup" Runat="server"/></th>
						<th class="lsListHeader" align="left" style="width:250px;"><Foundation:ModuleString ID="ModuleString8" Name="FieldName" Runat="server"/></th>
						<th class="lsListHeader" align="left" style="width:60px;"><Foundation:ModuleString ID="ModuleString9" Name="FieldType" Runat="server"/></th>
						<th class="lsListHeader" align="left" style="width:100px;"><Foundation:ModuleString ID="ModuleString10" Name="LabelAdminGUIStatus" Runat="server"/></th>
						<th class="lsListHeader" align="left" style="width:130px;"><Foundation:ModuleString ID="ModuleString11" Name="LabelGUIStatus" Runat="server"/></th>
						<th class="lsListHeader" align="left" style="width:130px;"><Foundation:ModuleString ID="ModuleString12" Name="LabelMandatory" Runat="server"/></th>
					</tr>
            </HeaderTemplate>
            <ItemTemplate>
				<tr>
				    <td class="litText" align="left"><asp:Label runat="server" ID="labelFieldSort" /></td>
				    <td class="litText" align="left"><asp:Label runat="server" ID="labelFieldGroup" /></td>
					<td class="litBoldText" align="left"><%#DataBinder.Eval(Container.DataItem, "Name")%></td>
					<td class="litText" align="left"><asp:Label runat="server" ID="labelFieldType" /></td>
					<td class="litText" align="left"><asp:Label runat="server" ID="labelAdminGUIStatus" /></td>
					<td class="litText" align="left"><asp:Label runat="server" ID="labelGUIStatus" /></td>
					<td class="litText" align="left"><asp:Label runat="server" ID="labelMandatory" /></td>
				</tr>
                <asp:Repeater runat="server" ID="c_repeaterDefaultValues" OnItemDataBound="RepeaterDefaultValues_ItemDataBound">
                    <ItemTemplate>
						<tr>
						    <td colspan="2" class="litListContent">&nbsp;</td>
							<td colspan="5" class="litListContent"><img alt="" src="Images/node.gif" />&nbsp;<asp:Label runat="server" ID="labelStandard" /></td>
						</tr>
                    </ItemTemplate>
                </asp:Repeater>
            </ItemTemplate>
            <FooterTemplate>
                </table>
            </FooterTemplate>
        </asp:Repeater>
     </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemEdit.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemBack.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>