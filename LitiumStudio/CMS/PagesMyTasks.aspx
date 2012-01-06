<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesMyTasks, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarTasks" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemUpdate_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemUpdate" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconNootbookMyTask" />
	<Foundation:ModuleString ID="ModuleString16" name="TasksHeader" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
	<div class="lsContentNoScroll">
        <table cellpadding="0" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
            <tr>
                <td valign="top">
                    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
                        <tr>
		                    <td class="lsTablePartHalf">
                                <table cellpadding="0" cellspacing="0" border="0" class="litListWithTreeAreaV2" style="width: 100%;">
			                        <tr>
			                            <th align="left" class="lsListHeader"><img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconWorkingCopy" alt="" /><Foundation:ModuleString ID="ModuleString11" Name="MyPagesWithWorkingCopy" runat="server" /></th>
			                            <th class="lsListHeader" style="width:42px;">&nbsp;</th>
			                        </tr>
			                        <asp:Panel id="c_workingCopiesPanelNone" visible="False" runat="server">
			                            <tr>
			                                <td class="litItalicText" colspan="2"><asp:Label runat="server" id="c_workingCopiesLabelNone"></asp:Label></td>
			                            </tr>
			                        </asp:Panel>
	                                <asp:Repeater ID="c_repeaterPageWithWorkingCopy" Runat="server">
						                <ItemTemplate>
			                                <tr>
                                                <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "PageName")%> (<%# DataBinder.Eval(Container.DataItem, "WebSiteName")%>)</td>
	                                            <td align="center" class="litListContent">
	                                                <a href="<%#ResolveUrl(Litium.Studio.UI.CMS.Pages.Utilities.PagesUtilities.GetEditPage((Litium.Studio.UI.CMS.Pages.Carriers.PageToApproveCarrier)Container.DataItem) + "?CMS_STARTED=true&CMS_SP_ID=" + DataBinder.Eval(Container.DataItem, "PageID"))%>"><img src="Images/transparent.gif" class="litIconPencil" border="0" alt="" /></a><a href="PagesWorkingCopy.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a>
	                                            </td>
			                                </tr>
			                            </ItemTemplate>
				                    </asp:Repeater>
			                    </table>
	                        </td>
		                    <td class="lsTablePartHalf">
			                    <table cellpadding="0" cellspacing="0" border="0" class="litListWithTreeAreaV2" style="width: 100%;">
			                        <tr>
			                            <th align="left" class="lsListHeader"><img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconReadyForPublish" alt="" /><Foundation:ModuleString ID="ModuleString3" Name="PagesToApproveAndPublish" runat="server" /></th>
			                            <th class="lsListHeader" style="width:21px;">&nbsp;</th>
			                        </tr>
			                        <asp:Panel id="c_toApprovePanelNone" visible="False" runat="server">
			                            <tr>
			                                <td class="litItalicText" colspan="2"><asp:Label runat="server" id="c_toApproveLabelNone"></asp:Label></td>
			                            </tr>
			                        </asp:Panel>
	                                <asp:Repeater ID="c_repeaterPageToApprove" Runat="server">
						                <ItemTemplate>
			                                <tr>
                                                <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "PageName")%> (<%# DataBinder.Eval(Container.DataItem, "WebSiteName")%>)</td>
	                                            <td align="center" class="litListContent"><a href="Pages.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>
			                                </tr>
			                            </ItemTemplate>
				                    </asp:Repeater>
				                    <asp:Repeater ID="c_repeaterPageWithWorkingCopyToApprove" Runat="server">
						                <ItemTemplate>
			                                <tr>
                                                <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "PageName")%> (<%# DataBinder.Eval(Container.DataItem, "WebSiteName")%>)</td>
	                                            <td align="center" class="litListContent"><a href="PagesWorkingCopy.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>
			                                 </tr>
			                             </ItemTemplate>
				                    </asp:Repeater>
			                    </table>
                            </td>
	                    </tr>
	                    <tr>
	                        <td class="lsTablePartHalf">
	                            <table cellpadding="0" cellspacing="0" border="0" class="litListWithTreeAreaV2" style="width: 100%;">
			                        <tr>
			                            <th align="left" class="lsListHeader"><img src="<%= Page.ResolveUrl("~/LitiumStudio/Images/Icons_Standard/translation_16px.png")%>" style="vertical-align:middle; margin-right:5px;" alt="" /><Foundation:ModuleString ID="ModuleString4" Name="MyTranslations" runat="server" /></th>
			                            <th class="lsListHeader" style="width:21px;">&nbsp;</th>
			                        </tr>
			                        <asp:Panel id="c_translationsPanelNone" visible="False" runat="server">
			                            <tr>
			                                <td class="litItalicText" colspan="2"><asp:Label runat="server" id="c_translationsLabelNone"></asp:Label></td>
			                            </tr>
			                        </asp:Panel>
			                        <asp:Repeater ID="c_translations" Runat="server">
	                                    <ItemTemplate>
	                                        <tr>
	                                            <td><img id="imgTranslation" style="vertical-align:middle; margin-right:5px;" runat="server"/><asp:Label CssClass="litListContent" id="labelTranslation" runat="server" /></td>
	                                            <td align="center" class="litListContent"><a href="Pages.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "ID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" runat="server" id="imgTranslationLink" border="0" alt="" /></a></td>
	                                        </tr>
	                                    </ItemTemplate>
	                                </asp:Repeater>
			                    </table>
		                    </td>
		                    <td class="lsTablePartHalf">
		                        <asp:Panel id="c_pageResponsibilityPanel" visible="false" runat="server">
	                                <table cellpadding="0" cellspacing="0" border="0" class="litListWithTreeAreaV2" style="width: 100%;">
			                            <tr>
			                                <th align="left" class="lsListHeader"><img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconDocumentPinned" alt="" /><Foundation:ModuleString ID="ModuleString1" Name="MyPageResponsibility" runat="server" /></th>
			                                <th class="lsListHeader" style="width:21px;">&nbsp;</th>
			                            </tr>
			                            <asp:Panel id="c_pageResponsibilityPanelNone" visible="False" runat="server">
			                                <tr>
			                                    <td class="litItalicText" colspan="2"><asp:Label runat="server" id="c_pageResponsibilityLabelNone"></asp:Label></td>
			                                </tr>
			                            </asp:Panel>
			                            <asp:Repeater ID="c_pageResponsibility" Runat="server">
					                        <ItemTemplate>
			                                    <tr>
                                                    <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "PageName")%> (<%# DataBinder.Eval(Container.DataItem, "WebSiteName")%>)</td>
	                                                <td align="center" class="litListContent"><a href="Pages.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>	                            
			                                    </tr>
			                                </ItemTemplate>
				                        </asp:Repeater>  
			                        </table>
			                    </asp:Panel>
		                    </td>
	                    </tr>
	                    <tr>
	                        <td class="lsTablePartHalf">
	                            <table cellpadding="0" cellspacing="0" border="0" class="litListWithTreeAreaV2" style="width: 100%;">
			                        <tr>
			                            <th align="left" class="lsListHeader"><img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconEdit" alt="" /><Foundation:ModuleString ID="ModuleString2" Name="MyNotes" runat="server" /></th>
			                            <th class="lsListHeader" style="width:21px;">&nbsp;</th>
			                        </tr>
			                        <asp:Panel id="c_notesPanelNone" visible="False" runat="server">
			                            <tr>
			                                <td class="litItalicText" colspan="2"><asp:Label runat="server" id="c_notesLabelNone"></asp:Label></td>
			                            </tr>
			                        </asp:Panel>
			                        <asp:Repeater ID="c_notes" Runat="server">
	                                    <ItemTemplate>
	                                        <tr>
	                                            <td><asp:Label CssClass="litListContent" id="labelNote" runat="server" /></td>
	                                            <td align="center" class="litListContent"><a href="PagesMyNotes.aspx"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>
	                                        </tr>
	                                    </ItemTemplate>
	                                </asp:Repeater>
			                    </table>
		                    </td>
		                    <td></td>
		                </tr>
                    </table> 
                </td>
            </tr>
       </table>
    </div>
    
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemUpdate.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>