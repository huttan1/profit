<%@ Page Language="C#" MasterPageFile="~/Extensions/Pages/Common/ObjectPostBase1.master" AutoEventWireup="true" CodeFile="ObjectPostEdit.aspx.cs" Inherits="Extensions.Pages.ObjectPostEdit" %>

<asp:Content ContentPlaceHolderID="ToolbarRight" runat="server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
	    <Toolbar:DividerItem ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>	
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ContentPlaceHolderID="LitiumStudioContentHeading" runat="server">
	<img src="<%= ResolveUrl("~/Extensions/Common/Images/object_post.png") %>" alt="" /><Foundation:SystemString Name="Extensions_OP_Settings_Header" runat="server" />:
	<Foundation:SystemString Name="extensions_op_settings_subheader_edit" runat="server"/>
</asp:Content>
<asp:Content ContentPlaceHolderID="ObjectPostNavigation" runat="server"></asp:Content>
<asp:Content ContentPlaceHolderID="MainContent" Runat="Server">	
	<div class="extensions lsContentScroll">
		<div class="litModuleContentTabAreaV2">
			<div class="litModuleContentMainWithPaddingAreaV2">
				<div>
					<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxCreatedDate">
						<Foundation:SystemString Name="extensions_op_created_date" runat="server"/>
					</asp:Label>
					<asp:TextBox id="m_textBoxCreatedDate" Enabled="false" CssClass="litInputText disabled" runat="server" />
				</div>
				<div>
					<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxPostingUserName">
						<Foundation:SystemString Name="extensions_op_posting_user_name" runat="server"/>
					</asp:Label>
					<asp:TextBox id="m_textBoxPostingUserName" Enabled="false" CssClass="litInputText disabled" runat="server" />
				</div>
				<div>
					<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxPostingUserEmail">
						<Foundation:SystemString Name="extensions_op_posting_user_email" runat="server"/>
					</asp:Label>
					<asp:TextBox id="m_textBoxPostingUserEmail" Enabled="false" CssClass="litInputText disabled" runat="server" />
				</div>
				<div>
					<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxPostText">
						<Foundation:SystemString Name="extensions_op_post_text" runat="server"/>
					</asp:Label>
					<asp:TextBox id="m_textBoxPostText" cssclass="litInputText" TextMode="Multiline" Rows="6" runat="server" />
					<asp:RequiredFieldValidator SetFocusOnError="true" ControlToValidate="m_textBoxPostText" CssClass="litErrorMsg" Display="Dynamic" runat="server" ErrorMessage="Obligatoriskt fält" />
				</div>		
				<asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
					<fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="images/transparent.gif" width="5" alt="" /><br />
						<asp:Label id="c_labelMajorError" runat="server"/>
					</fieldset>
				</asp:Panel>
			</div>
		</div>
    </div>
</asp:Content>