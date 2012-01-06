<%@ Control Language="C#" AutoEventWireUp="false" CodeFile="~/Site/CMS/Templates/UserControls/Filter.ascx.cs" Inherits="Site.CMS.Templates.UserControls.Filter" %>


        <asp:Repeater ID="headeritems" OnItemDataBound="RepeaterMetadata_ItemDataBound" runat="server">
        <ItemTemplate>
        <asp:Literal ID="HeaderLabel" runat="server" />
        <asp:CheckBoxList ID="subitems"  runat="server" RepeatColumns="2">		
		</asp:CheckBoxList>
        </ItemTemplate>
        </asp:Repeater>
		

		<asp:Button runat="server" OnClick="UpdateFilter" Text="Filter" runat="server" />

		