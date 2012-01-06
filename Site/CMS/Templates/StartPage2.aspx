<%@ Page Language="C#" Inherits="App_Code.Site.CMS.Templates.BaseTemplate" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">	
    <site:Header runat="server" />
	<div id="primary" style="width:960px;" class="grid_6 alpha">
    <div style="width:320px;float:left;">
        <div style="padding:5px;">
            <web:Image Name="Puff1Image" MaxWidth="315" runat="server" />
            <center>
                <b><web:Text Name="Puff1Label" CssClass="PuffLabel" runat="server" /></b>
            </center>
            <br />
                <web:Text Name="Puff1Text" runat="server" />
        </div>
    </div>
        <div style="width:320px;float:left;">
        <div style="padding:5px;">
            <web:Image ID="Image1" Name="Puff2Image" MaxWidth="315" runat="server" />
            <center>
                <b><web:Text ID="Text1" Name="Puff2Label" CssClass="PuffLabel" runat="server" /></b>
            </center>
            <br />
                <web:Text ID="Text2" Name="Puff2Text" runat="server" />
        </div>
    </div>
        <div style="width:320px;float:left;">
            <div style="padding:5px;">
            <web:Image ID="Image2" Name="Puff3Image" MaxWidth="315" runat="server" />
            <center>
                <b><web:Text ID="Text4" Name="Puff3Label" CssClass="PuffLabel" runat="server" /></b>
            </center>
            <br />
                <web:Text ID="Text5" Name="Puff3Text" runat="server" />
            </div>
        </div>       
	</div>	
	
</asp:Content>