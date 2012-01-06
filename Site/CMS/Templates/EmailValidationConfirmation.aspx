<%@ Page Language="C#" CodeFile="EmailValidationConfirmation.aspx.cs" Inherits="EmailValidationConfirmation"%>

<%@ Register TagPrefix="foundation" Namespace="Litium.Foundation.GUI.WebControls" Assembly="Litium.Foundation.GUI" %>
<asp:content id="Content1" contentplaceholderid="Content" runat="Server">

	<h1><web:Text Name="Title" runat="server" /></h1>
	
	<asp:Panel id="c_panelSucess" runat="server" Visible="false">
		<web:Text Name="MessageSucess" runat="server" />
	</asp:Panel>
	<asp:Panel id="c_panelFail" runat="server" Visible="false">
		<web:Text Name="MessageFail" runat="server" />
	</asp:Panel>
    <asp:Panel id="c_panelSecondTime" runat="server" Visible="false">
        <web:Text runat="server" Name="MessageAlreadyActivated" />
    </asp:Panel>	
</asp:content>