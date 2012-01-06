<%@ Page Language="C#" CodeFile="ObjectPostNotificationAdmin.aspx.cs" MasterPageFile="~/Extensions/Pages/Common/ObjectPostBase1.master" Inherits="Extensions.Pages.ObjectPostNotificationAdmin" %>

<asp:Content ContentPlaceHolderID="ToolbarRight" runat="server">
	<Toolbar:HorizontalToolbar ID="c_toolbar" ToolbarIndex="0" runat="server">
		<Toolbar:ToolbarItem ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="~/Extensions/Pages/images/transparent.gif" runat="server" />	
	</Toolbar:HorizontalToolbar>
	<Toolbar:DividerItem ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	<div class="extensions litToolbarItem">
		<asp:Label AssociatedControlID="m_dropDownListWebsites" runat="server">
			<Foundation:SystemString Name="extensions_op_settings_website" runat="server"/>
		</asp:Label>
		<asp:DropDownList ID="m_dropDownListWebsites" AutoPostBack="true" CssClass="" OnSelectedIndexChanged="DropDownListWebSites_SelectedIndexChanged" runat="server" />
	</div>
</asp:Content>

<asp:Content ContentPlaceHolderID="LitiumStudioContentHeading" runat="server">
	<img src="<%= ResolveUrl("~/Extensions/Common/Images/object_post.png") %>" alt="" /><Foundation:SystemString Name="Extensions_OP_Settings_Header" runat="server" />:
	<Foundation:SystemString Name="extensions_op_settings_subheader_notification" runat="server"/>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" Runat="server">
    <div class="extensions lsContentScroll">
		<div>
			<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxNotificationSender">
				<Foundation:SystemString Name="extensions_op_settings_notification_sender" runat="server"/>
			</asp:Label>
			<asp:TextBox id="m_textBoxNotificationSender" CssClass="litInputText" runat="server" />
		</div>
		<div>
			<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxNotificationReceiver">
				<Foundation:SystemString Name="extensions_op_settings_notification_receiver" runat="server"/>
			</asp:Label>
			<asp:TextBox id="m_textBoxNotificationReceiver" CssClass="litInputText" runat="server" />
		</div>
		<div>
			<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxNotificationSubject">
				<Foundation:SystemString Name="extensions_op_settings_notification_subject" runat="server"/>
			</asp:Label>
			<asp:TextBox id="m_textBoxNotificationSubject" CssClass="litInputText" runat="server" />
		</div>
		<div>
			<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxNotificationBody">
				<Foundation:SystemString Name="extensions_op_settings_notification_body" runat="server"/>
			</asp:Label>
			<asp:TextBox id="m_textBoxNotificationBody" cssclass="litInputText" TextMode="Multiline" Rows="6" runat="server" />
		</div>
		<div>
			<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxNewPostNotificationSubject">
				<Foundation:SystemString Name="extensions_op_settings_newpost_notification_subject" runat="server"/>
			</asp:Label>
			<asp:TextBox id="m_textBoxNewPostNotificationSubject" CssClass="litInputText" runat="server" />
		</div>
		<div>
			<asp:Label runat="server" CssClass="litBoldText" AssociatedControlID="m_textBoxNewPostNotificationBody">
				<Foundation:SystemString Name="extensions_op_settings_newpost_notification_body" runat="server"/>
			</asp:Label>
			<asp:TextBox id="m_textBoxNewPostNotificationBody" cssclass="litInputText" TextMode="Multiline" Rows="6" runat="server" />
		</div>
	    <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
		    <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="images/transparent.gif" width="5" alt="" /><br />
			    <asp:Label id="c_labelMajorError" runat="server"/>
		    </fieldset>
	    </asp:Panel>
		<asp:Panel id="c_panelOkMessage" visible="False" runat="server"> 
	        <fieldset class="litOkFieldset"><legend class="litOkFieldsetMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconOk" alt="" /><b><Foundation:SystemString Name="Ok" runat="server" /></b></legend><img src="images/transparent.gif" width="5" alt="" /><br />
		        <asp:Label id="c_labelOkMessage" runat="server" />
	        </fieldset>
        </asp:Panel>
    </div>
</asp:Content>