<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_AssortmentView, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants"%>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="c_toolbarRight" runat="server">
		<Toolbar:ToolbarItem ID="c_toolbarItemExport" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconExport2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" OnClick="ToolbarItemExport_Click"
			runat="server" />		
	</Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server" >
	<img src="Images/transparent.gif" class="litIconProductCatalog" alt="" />
	<asp:Label runat="server" ID="CatalogHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
	<script src="http://code.jquery.com/jquery-latest.js"></script>
	<div>
		<table border="0" cellspacing="0" cellpadding="0" class="litProductList" width="100%">
			<tr>
				<th runat="server" class="litProductListProduct" style="width: 221px; height: 110px; background: #F9F9F9;" id="c_thCell" valign="top">
				<div class="litCatalogFull litCatalogCentred" style=" width:221px; height: 100px;">
							<asp:Image ID="CatalogImage" runat="server" ImageAlign="Middle" /></div>
				</th>
				<th  class="litProductListDetails" style="width: 70%; vertical-align: top; padding-left: 15px;border-left: 1px solid #CFCDCC; background: #F9F9F9;" >
					<div class="litParagraphText">
						<asp:Label ID="CatalogContainsLabel" runat="server" />
					</div>
				
					<div id="Div1" class="litParagraphText" runat="server">
						<asp:Label ID="NameLabel" runat="server" Font-Bold="true"></asp:Label>
						<asp:Label ID="CatalogNameLabel" runat="server" />
					</div>
				</th>
			    <th>
			        <div class="litCatalogHeaderContainerRight">
				        <div class="litCatalogPaddingTopTen">
					        <asp:ListBox ID="LangaugeListbox" runat="server" CssClass="litInputSelect" Style="width: auto;position: relative; right: 5px;"
						        Rows="1" AutoPostBack="true" OnSelectedIndexChanged="LanguageListbox_OnSelectedIndexChanged">
					        </asp:ListBox>
				        </div>
			        </div>
			    </th>
			</tr>
			</table>
			</div>
		<div class="litCatalogFloatLeft">
			<asp:Repeater ID="ProductGroupRepeater" runat="server">
				<ItemTemplate>
					<div class="litCatalogGroupContainer" onmouseover="$(this).find('span').css('color','#0066cc');" 
						onmouseout="$(this).find('span').css('color','#000000');" onclick="window.location = '<%# string.Concat("Group.aspx?pgid=", Eval("ID")) %>';">
						<div class="litCatalogGroupImageContainer">
							<table class="litCatalogFull">
								<tr class="litCatalogFull">
									<td class="litCatalogFull litCatalogCentred">
										 <asp:Image ID="ProductGroupImage" runat="server" ImageAlign="Middle" />
									</td>
								</tr>
							</table>
						</div>
						<br />
						<div class="litCatalogGroupNameContainer">
							<table class="litCatalogFull">
								<tr class="litCatalogFull">
									<td class="litCatalogFull litCatalogCentred">
										<asp:Label ID="ProductGroupName" runat="server" ForeColor="#000000" Font-Underline="false" style="font-size: 85%;"></asp:Label>
									</td>
								</tr>
							</table>
						</div>
					</div>
				</ItemTemplate>
			</asp:Repeater>
		</div>
</asp:Content>
