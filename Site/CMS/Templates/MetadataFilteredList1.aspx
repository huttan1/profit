<%@ Page Language="C#" CodeFile="MetadataFilteredList1.aspx.cs" Inherits="Templates_MetadataFilteredList1" %>

<%@ Register TagPrefix="ExtensionsMetadata" Namespace="Litium.Extensions.Metadata.WebControls"
	Assembly="Litium.Extensions" %>
<asp:content id="Content1" contentplaceholderid="Content" runat="Server">

<link rel="Stylesheet" href="<% = ResolveUrl("/Extensions/Common/Styles/pager.css") %>" />

<h1 class="H1header">
    <web:Text Name="Title" runat="server" />
</h1>
<div class="Text MarginSingle">
    <web:Text Name="Introduction" EditorClass="Text MarginSingle" runat="server" />
</div>

<div class="Text MarginSingle">
    <web:Text Name="Text1" EditorClass="Text MarginSingle" runat="server" />
</div>

<web:Image runat="server" Name="Image1" />

<div class="Text MarginSingle">
    <web:Text Name="Text2" EditorClass="Text MarginSingle" runat="server" />
</div>

<asp:Panel runat="server" ID="c_panelPreviousPage" Visible="false">
    <a ID="c_linkUpLink" runat="server">
        <web:WebSiteString Class="Normal" Name="ButtonBack" runat="server" />
    </a>
</asp:Panel>

<div style="clear: both; border-bottom: solid 1px #986522; margin-bottom: 10px;"></div>
    <ExtensionsMetadata:MetadataPageRepeater ID="c_metadataPageRepeater" IncludeStartNode="true"
        UsePageing="true" OnInit="OnInit_MetadataPageRepeater" OnPreRender="OnPreRender_MetadataPageRepeater" runat="server">
        <ItemTemplate>
            <web:PageLink runat="server">
                    <web:ShortName runat="server" />
            </web:PageLink>
        </ItemTemplate>
    </ExtensionsMetadata:MetadataPageRepeater>
    <Plus:Pager runat="server" CssClass="pagination" ID="c_pagerMetadataPageRepeater" PageSize="10" AllwaysShowPrevNextButtons="true"
        ShowFirstAndLastButtons="true" />
</asp:content>
