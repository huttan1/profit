<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesStatus, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarEdit" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemStatusUpdate_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemStatusUpdate" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconGauge" />
	<Foundation:ModuleString ID="ModuleString16" name="StatusHeader" runat="server" /> "<asp:Label runat="Server" ID="c_labelWebsiteName" />"
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
            <tr>
                <td valign="top">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td valign="top" style="padding-right:8px; width:50%;">
                                <div class="litListWithTreeAreaV2">
                                    <table cellpadding="0" cellspacing="0" border="0">
			                            <tr>
			                                <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString3" Name="TotalNumberOfPages" runat="server" /></th>
			                                <td style="width:60px;" class="litListContent"><asp:Label ID="c_labelTotalNumberOfPages" runat="server" /> <Foundation:ModuleString ID="ModuleString9" Name="Items" runat="server" /></td>
			                            </tr>
			                            <tr>
			                                <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString4" Name="PublishedPages" runat="server" /></th>
			                                <td style="width:60px;" class="litListContent"><asp:Label ID="c_labelPublishedPages" runat="server" /> <Foundation:ModuleString ID="ModuleString8" Name="Items" runat="server" /></td>
			                            </tr>
			                            <tr>
			                                <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString5" Name="UnpublishedPages" runat="server" /></th>
			                                <td style="width:60px;" class="litListContent"><asp:Label ID="c_labelUnpublishedPages" runat="server" /> <Foundation:ModuleString ID="ModuleString7" Name="Items" runat="server" /></td>
			                            </tr>
                                    </table>
                                </div>
                            </td>
                            <td valign="top" style="padding-left:7px; width:50%;">
                                <div class="litListWithTreeAreaV2">
                                    <table cellpadding="0" cellspacing="0" border="0">
			                            <tr>
			                                <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString1" Name="PagesInArchive" runat="server" /></th>
			                                <td style="width:60px;" class="litListContent"><asp:Label ID="c_labelPagesInArchive" runat="server" /> <Foundation:ModuleString ID="ModuleString6" Name="Items" runat="server" /></td>
			                            </tr>
			                            <tr>
			                                <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString2" Name="PagesInTrashcan" runat="server" /></th>
			                                <td style="width:60px;" class="litListContent"><asp:Label ID="c_labelPagesInTrashcan" runat="server" /> <Foundation:ModuleString Name="Items" runat="server" /></td>
			                            </tr>
                                    </table>
                                </div>
                            </td>
                        </tr>
                    </table><br /><br />
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
		                    <td valign="top" style="padding-right:8px; width:50%;">
		                        <div class="litListWithTreeAreaV2">
			                        <table cellpadding="0" cellspacing="0" border="0">
			                            <tr>
			                                <th align="left" class="lsListHeader"><img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconPSTimepubl2" alt="" /><Foundation:ModuleString ID="ModuleString11" Name="TimePublishedPages" runat="server" /></th>
			                                <th align="left" class="lsListHeader" colspan="2"><Foundation:ModuleString ID="ModuleString10" Name="WillBePublished" runat="server" /></th>
			                            </tr>
			                             <asp:Repeater ID="c_repeaterTimePublishedPages" Runat="server">
								             <ItemTemplate>
			                                    <tr>
			                                        <td class="litListContent"><%#(Container.DataItem as Litium.Foundation.Modules.CMS.Pages.Page).ShortName%></td>
			                                        <td class="litListContent"><%#(Container.DataItem as Litium.Foundation.Modules.CMS.Pages.Page).StartPublishDateTime.ToString()%></td>
			                                        <td style="width:16px;"><a href="Pages.aspx?CMS_SP_ID=<%#(Container.DataItem as Litium.Foundation.Modules.CMS.Pages.Page).ID.ToString()%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>
			                                    </tr>
			                               </ItemTemplate>
							            </asp:Repeater>
							            <asp:Repeater ID="c_repeaterTimePublishedPagesWithWorkingCopy" Runat="server">
								             <ItemTemplate>
			                                    <tr>
			                                        <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "PageName")%></td>
			                                        <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "WorkingCopyDate")%></td>
			                                        <td style="width:16px;"><a href="PagesWorkingCopy.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>
			                                    </tr>
			                               </ItemTemplate>
							            </asp:Repeater>
			                        </table>
                                </div>
		                    </td>
		                    <td valign="top" style="padding-left:7px; width:50%;">
		                        <div class="litListWithTreeAreaV2">
			                        <table cellpadding="0" cellspacing="0" border="0">
			                            <tr>
			                                <th align="left" class="lsListHeader"><img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconWorkingCopy" alt="" /><Foundation:ModuleString Name="PagesWithWorkingCopy" runat="server" /></th>
			                                <th align="left" class="lsListHeader" colspan="2"><Foundation:ModuleString Name="Created" runat="server" /></th>
			                            </tr>
			                            <asp:Repeater ID="c_repeaterPagesWithWorkingCopy" Runat="server">
								             <ItemTemplate>
			                                    <tr>
			                                        <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "PageName")%></td>
			                                        <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "WorkingCopyDate")%></td>
			                                        <td style="width:16px;"><a href="PagesWorkingCopy.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" alt="" /></a></td>
			                                    </tr>
			                               </ItemTemplate>
							            </asp:Repeater>
			                        </table>
                                </div>
                            </td>
                        </tr>
                    </table><br /><br />
                    <!-- Broken links -->
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
		                    <td valign="top" style="width:100%;">
		                        <div class="litListWithTreeAreaV2">
			                        <table cellpadding="0" cellspacing="0" border="0">
			                            <tr>
			                                <th align="left" class="lsListHeader"><img src="Images/brokenlink.png" style="vertical-align:middle; margin-right:5px;" alt="" /><Foundation:ModuleString ID="ModuleString13" Name="PagesWithBrokenLinks" runat="server" /></th>
			                                <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString12" Name="Info" runat="server" /></th>
			                                <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString14" Name="ContentField" runat="server" /></th>
			                                <th align="right" colspan="2" style="padding-right:5px;"><asp:Button ID="c_buttonStartScan" runat="server" CssClass="litInputButton" CommandName="StartScanCommand" Text="Start scan" /></th>
			                            </tr>
	                                    <asp:Repeater ID="c_repeaterBrokenLinks" Runat="server">
								             <ItemTemplate>
			                                    <tr>
			                                        <td class="litListContent" style="width:250px;"><%# DataBinder.Eval(Container.DataItem, "ShortName")%><asp:Label runat="server" ID="c_labelPageIDScan" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem, "PageID")%>'></asp:Label></td>
			                                        <td class="litListContent"><asp:Label runat="server" ID="c_brokenLinksInfo" Text='<%# DataBinder.Eval(Container.DataItem, "Info")%>'></asp:Label></td>			                                        
			                                        <td class="litListContent"><%# DataBinder.Eval(Container.DataItem, "PropertyName")%></td>
			                                        <td align="right" style="width:120px;">
			                                            <img src="Images/transparent.gif" border="0" alt="" /><asp:Panel ID="c_panelPencil" runat="server" Visible="false"><a href="<%# this.GetEditPage((Guid)DataBinder.Eval(Container.DataItem, "PageID"))%>?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>&CMS_STARTED=true"><img src="Images/transparent.gif" class="litIconPencil" border="0" style="position:relative; top:0px;" /></a></asp:Panel></td>
	                                                <td align="right" style="width:16px;">
	                                                    <img src="Images/transparent.gif" border="0" alt="" /><asp:Panel ID="c_panelScanArrow" runat="server" Visible="false"><a href="Pages.aspx?CMS_SP_ID=<%# DataBinder.Eval(Container.DataItem, "PageID")%>"><img src="Images/transparent.gif" class="litIconNavRightBlue" border="0" /></a></asp:Panel></td>
			                                    </tr>
			                               </ItemTemplate>
							            </asp:Repeater>
			                        </table>
                                </div>
		                    </td>
                        </tr>
                    </table>
                    <br />
                   <br />
		        </td>
	        </tr>
       </table>
    </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemStatusUpdate.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>
