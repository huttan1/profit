<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_GroupShow, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../../LitiumStudio/Images/icons_modules/businesspeople_24px.png" width="24" height="24" style="vertical-align:middle;" alt="" />&nbsp;
	<asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
		    <toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarDivider" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemEdit" runat="server"/>
		    <toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemDelete" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll"> 
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString3" Name="Description" runat="server"/>:</td>
				    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelGroupDisplayName"/></td>
			    </tr>
			    <tr>
				    <td style="padding-bottom:5px;" class="litBoldText"><Foundation:SystemString ID="SystemString4" Name="Type" runat="server"/>:</td>
				    <td style="padding-bottom:5px;padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelGroupType"/></td>
			    </tr>
			    <tr>
				    <td class="litBoldText"><Foundation:SystemString ID="SystemString5" Name="Active" runat="server"/>:</td>
				    <td style="padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelGroupActive"/></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td><fieldset><legend class="litBoldText"><Foundation:SystemString ID="SystemString6" Name="Members" runat="server"/>:</legend><img src="../images/transparent.gif" width="5" alt="" /><br />
					    <table border="0" cellspacing="0" cellpadding="0">
						    <tr>
							    <td valign="top" class="litText"><asp:Label runat="server" id="c_labelGroupMembers"/></td>
						    </tr>
					    </table>
				    </fieldset></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td><fieldset><legend class="litBoldText"><Foundation:SystemString ID="SystemString7" Name="OverallPermissions" runat="server"/>:</legend><img src="../images/transparent.gif" width="5" alt="" /><br />
					    <table border="0" cellspacing="0" cellpadding="0">
						    <tr>
							    <td valign="top" class="litText"><asp:Label runat="server" id="c_labelSolutionPermissions"/></td>
						    </tr>
					    </table>
				    </fieldset></td>
			    </tr>
		    </table><br />
		    <table border="0" cellspacing="0" cellpadding="0">
			    <tr>
				    <td><fieldset><legend class="litBoldText"><Foundation:SystemString ID="SystemString8" Name="ModulePermissions" runat="server"/>:</legend><img src="../images/transparent.gif" width="10" alt="" /><br />
					    <table border="0" cellspacing="0" cellpadding="0">
						    <tr>
							    <td valign="top"><asp:ListBox Runat="server" ID="c_listBoxModule" Rows="7" AutoPostBack="True" OnSelectedIndexChanged="SelectModule_Changed" CssClass="litInputSelect"/></td>
							    <td valign="top" style="padding-left:10px;" class="litText"><asp:Label runat="server" id="c_labelModulePermissions"/></td>
						    </tr>
					    </table>
				    </fieldset></td>
			    </tr>
		    </table>
    </div>

</asp:Content>