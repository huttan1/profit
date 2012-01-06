<%@ Page Language="C#" AutoEventWireup="false" Inherits="App_Code.Site.CMS.Templates.BaseTemplate" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">

	   <site:Header runat="server" />

	<div id="primary" style="width:960px;" class="grid_6 alpha">
        
            <div style="padding:5px;">
		        <web:Text ID="Text3" Name="Text" runat="server" />
            </div>
        
	</div>
    <site:LinkList runat="server" />
    <site:FileList runat="server" />

</asp:Content>