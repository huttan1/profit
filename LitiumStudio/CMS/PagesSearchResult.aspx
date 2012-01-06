<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesSearchResult, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarArchive" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemSearchResultView_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSearchResultView" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconDocumentFind2" />
	<Foundation:ModuleString ID="ModuleString1" name="SearchResult" runat="server" />  <span style="font-weight:normal;"></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
	<div class="lsContentNoScroll">
        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
	        <tr>
		        <td valign="top">
			        <div class="litListWithTreeAreaV2">
			            <asp:Repeater ID="c_repeaterResultPages" Runat="server">
			                <HeaderTemplate>
						        <table border="0" cellspacing="0" cellpadding="0">
							        <tr>
							             <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString11" Name="PageName" runat="server" /></th>
		                                 <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString10" Name="Location" runat="server" /></th>
							             <th align="left" class="lsListHeader" colspan="2"><Foundation:ModuleString ID="ModuleString1" Name="Created" runat="server" /></th>
		                            </tr>
		                     </HeaderTemplate>
				             <ItemTemplate>
                                <tr>
                                    <td class="litListContent"><%#(Container.DataItem as Litium.Foundation.Modules.CMS.Carriers.PageInfoCarrier).ShortName%></td>
                                    <td class="litListContent"><%# this.GetPageLocation((Container.DataItem as Litium.Foundation.Modules.CMS.Carriers.PageInfoCarrier).ID)%></td>
                                    <td class="litListContent"><%#(Container.DataItem as Litium.Foundation.Modules.CMS.Carriers.PageInfoCarrier).CreatedDateTime%></td>
                                    <td style="width:16px;"><a href="<%# this.GetUrlToPage((Container.DataItem as Litium.Foundation.Modules.CMS.Carriers.PageInfoCarrier))%>"><img src="Images/transparent.gif" <%# this.IsLinkVisible((Container.DataItem as Litium.Foundation.Modules.CMS.Carriers.PageInfoCarrier))%> class="litIconNavRightBlue" border="0" alt="" /></a></td>
                                </tr>
                            </ItemTemplate>
			                <FooterTemplate>		
						        </table>
					        </FooterTemplate>	
					    </asp:Repeater>
			        </div>
		        </td>
	        </tr>
        </table>
    
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
	        <tr>
		        <td valign="top">
			        <div class="litListWithTreeAreaV2">
				        <toolbar:List id="c_list" SortAscendingClass="litIconSortAscending" SortDescendingClass="litIconSortDescending" PageSize="100" EnableViewState="True" Runat="server">
					        <HeaderTemplate>
						        <table border="0" cellspacing="0" cellpadding="0">
							        <tr>
								        <th align="left" class="lsListHeader"><toolbar:ListColumn id="c_listColumn1" runat="server" /></th>
								        <th align="left" class="lsListHeader"><toolbar:ListColumn id="c_listColumn2" runat="server" /></th>
							        </tr>
					        </HeaderTemplate>
					        <ItemTemplate>
						        <toolbar:ListRow ID="ListRow1" ColumnCssClass="litListContent" runat="server" />
					        </ItemTemplate>
					        <FooterTemplate>		
						        </table>
					        </FooterTemplate>		
				        </toolbar:List>
			        </div>
				</td>
	        </tr>
        </table>
    </div>
     <script type="text/javascript">
     	var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSearchResultView.ClientID.ToString()); %>");
     	var cancelObject = null;
     	document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
    </script>
</asp:Content>