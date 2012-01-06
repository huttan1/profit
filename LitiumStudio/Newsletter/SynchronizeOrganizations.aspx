<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_SynchronizeOrganizations, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" runat="server"/>	
		<toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemSaveAndClose_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSaveAndClose" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
    <img src="Images/transparent.gif" alt="" class="litIconDocumentExchange" /><Foundation:ModuleString ID="ModuleString1" Name="SynchronizeOrganizations" runat="server" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <script type="text/javascript">
    // Adds an item from the grid with existing items to the grid with selected items.
    function addGridItem(rowID)
    {
    }
    
    // Removes an item from the grid with existing items from the grid with selected items.
    function deleteGridItem(rowID)
    {
    }
</script>
    <div class="lsContentScroll">
        <Foundation:InformationGroup ID="InformationGroup1" runat="server" Width="730px">
        <table border="0" cellspacing="0" cellpadding="0" width="500">
	        <tr>
	            <td colspan="2" class="litBoldText" style="padding-bottom: 20px;"><Foundation:ModuleString name="PermissionHeader" runat="server" ID="Modulestring5"/></td>
            </tr>
            <tr>
	            <td>
		           <table border="0" cellspacing="0" cellpadding="0">
                        <tr>
                            <td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="AvailableOrganizations" Runat="server"/>:</td>
                            <td>&nbsp;</td>
                            <td class="litBoldText"><Foundation:ModuleString ID="ModuleString4" Name="SynchronizedOrganizations" Runat="server"/>:</td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <ComponentArt:Grid id="c_gridExistingItems"
                                    CssClass="Grid"
                                    RunningMode="Client"
                                    AutoPostBackOnSelect="true"
                                    OnSelectCommand="Add"
                                    ShowHeader="true"
                                    ShowFooter="true"
                                    ShowSearchBox="true"
                                    SearchOnKeyPress="true"
                                    SearchTextCssClass="SearchText"
                                    SearchBoxPosition="TopLeft"
                                    SearchBoxCssClass="SearchBoxSmall"
                                    AllowMultipleSelect="false"
                                    AllowEditing="false"
                                    HeaderCssClass="GridHeader2" 
                                    DataAreaCssClass="GridDataArea"
                                    KeyboardEnabled="false"
                                    FooterCssClass="GridFooter" 
                                    GroupByCssClass="GroupByCell"
                                    GroupByTextCssClass="GroupByText"
                                    GroupingNotificationText=""
                                    ItemDraggingEnabled="false"
                                    PageSize="10"
                                    PagerStyle="Slider"
                                    PagerPosition="BottomLeft"
                                    PagerInfoPosition="TopRight"
                                    PagerInfoClientTemplateId="c_gridExistingItems_PagerInfoTemplate"
                                    PagerTextCssClass="litContentInfo"
                                    PagerButtonWidth="18"
                                    PagerButtonHeight="18"
                                    SliderHeight="18"
                                    SliderWidth="100" 
                                    SliderGripWidth="9" 
                                    SliderPopupOffsetX="20"
                                    SliderPopupClientTemplateId="c_gridExistingItems_SliderTemplate" 
                                    PreExpandOnGroup="true"
                                    ImagesBaseUrl="../../LitiumStudio/Images/grid/" 
                                    PagerImagesFolderUrl="../../LitiumStudio/Images/grid/pager_thin/"
                                    TreeLineImagesFolderUrl="../../LitiumStudio/Images/grid/lines/" 
                                    TreeLineImageWidth="19" 
                                    TreeLineImageHeight="20" 
                                    IndentCellWidth="22" 
                                    GroupingNotificationPosition="BottomRight"
                                    GroupingNotificationTextCssClass="litContentTopHeader"
                                    GroupBySortAscendingImageUrl="sort_ascending.png"
                                    GroupBySortDescendingImageUrl="sort_descending.png"
                                    GroupBySortImageWidth="16"
                                    GroupBySortImageHeight="16"
                                    LoadingPanelClientTemplateId="c_gridExistingItems_LoadingFeedbackTemplate"
                                    LoadingPanelPosition="MiddleCenter"
                                    LoadingPanelEnabled="true" 
                                    Sort="Name"
                                    ManualPaging="false"
                                    width="365"
                                    height="400"
                                    BorderWidth="1"
                                    BorderStyle="Solid"
                                    BorderColor="Gray"
                                    runat="server">
                                    <Levels>
                                        <ComponentArt:GridLevel
                                            DataKeyField="ID"
                                            ShowTableHeading="false" 
                                            ShowSelectorCells="false" 
                                            RowCssClass="Row" 
                                            ColumnReorderIndicatorImageUrl="reorder.gif"
                                            DataCellCssClass="DataCell" 
                                            HeadingCellCssClass="HeadingCell" 
                                            HeadingCellHoverCssClass="HeadingCellHover" 
                                            HeadingCellActiveCssClass="HeadingCellActive" 
                                            HeadingRowCssClass="HeadingRow" 
                                            HeadingTextCssClass="HeadingCellText"
                                            SelectedRowCssClass="Row"
                                            HoverRowCssClass="HoverRow"
                                            GroupHeadingCssClass="GroupHeading" 
                                            SortAscendingImageUrl="sort_ascending.png" 
                                            SortDescendingImageUrl="sort_descending.png"
                                            SortedHeadingCellCssClass="HeadingCellSorted"
                                            SortImageWidth="16" 
                                            SortImageHeight="10">
                                            <Columns>
                                                <ComponentArt:GridColumn DataField="ID" Visible="false" />
                                                <ComponentArt:GridColumn DataField="Name" Visible="true" Width="315" />
                                                <ComponentArt:GridColumn DataField="AddText" visible="false"/>
                                                <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridExistingItems_AddTemplate" Width="25" Align="Right" />
                                                <ComponentArt:GridColumn DataField="DeleteText" visible="false"/>
                                            </Columns>
                                        </ComponentArt:GridLevel>
                                    </Levels>
                                    <ClientTemplates>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_LoadingFeedbackTemplate">
                                            <table cellspacing="0" cellpadding="10" border="0" style="background-color:White;">
                                                <tr>
                                                    <td class="litText" style="padding-right:3px;">@Loading</td>
                                                    <td style="padding-left:3px;"><img src="/LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border:none;" /></td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_SliderTemplate">
                                            <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td valign="top" style="padding:5px;">
                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                            <tr>
                                                                <td>
                                                                    <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                                        <tr>
                                                                            <td><div style="overflow:hidden;width:255px;" class="litText"><nobr>## DataItem.GetMember('Name').Value ##</nobr></div></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="SliderBottom">
                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                            <tr>
                                                                <td>@Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridExistingItems.PageCount ##</b></td>
                                                                <td align="right">@Group&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridExistingItems.RecordCount ##</b></td>
                                                            </tr>
                                                        </table>  
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_PagerInfoTemplate">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td class="GridFooterText">@Page <b>## c_gridExistingItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridExistingItems.PageCount ##</b> (## c_gridExistingItems.RecordCount ## @Groups)</td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_AddTemplate">
                                            <a href="#" onclick="addGridItem('## DataItem.ClientId ##');" title="## DataItem.GetMember('AddText').Value ##"><img src="Images/transparent.gif" class="litIconArrowMoveRight" border="0" alt="## DataItem.GetMember('AddText').Value ##" /></a>
                                        </ComponentArt:ClientTemplate>
                                    </ClientTemplates>
                                </ComponentArt:Grid>
                            </td>
                            <td valign="top" style="padding-left:5px;">&nbsp;</td>
                            <td valign="top">
                                <ComponentArt:Grid id="c_gridSelectedItems"
                                    CssClass="Grid"
                                    RunningMode="Client"
                                    AutoPostBackOnSelect="true"
                                    OnSelectCommand="Delete"
                                    ShowHeader="true"
                                    ShowFooter="true"
                                    ShowSearchBox="false"
                                    SearchOnKeyPress="true"
                                    SearchTextCssClass="SearchText"
                                    SearchBoxPosition="TopLeft"
                                    SearchBoxCssClass="SearchBoxSmall"
                                    AllowMultipleSelect="false"
                                    AllowEditing="true"
                                    HeaderCssClass="GridHeader2" 
                                    DataAreaCssClass="GridDataArea"
                                    KeyboardEnabled="false"
                                    FooterCssClass="GridFooter"
                                    GroupByCssClass="GroupByCell"
                                    GroupByTextCssClass="GroupByText"
                                    GroupingNotificationText=""
                                    ItemDraggingEnabled="false"
                                    PageSize="10"
                                    PagerStyle="Slider"
                                    PagerPosition="BottomLeft"
                                    PagerInfoPosition="TopRight"
                                    PagerInfoClientTemplateId="c_gridSelectedItems_PagerInfoTemplate"
                                    PagerTextCssClass="litContentInfo"
                                    PagerButtonWidth="18"
                                    PagerButtonHeight="18"
                                    SliderHeight="18"
                                    SliderWidth="100" 
                                    SliderGripWidth="9" 
                                    SliderPopupOffsetX="20"
                                    SliderPopupClientTemplateId="c_gridSelectedItems_SliderTemplate" 
                                    PreExpandOnGroup="true"
                                    ImagesBaseUrl="../../LitiumStudio/Images/grid/" 
                                    PagerImagesFolderUrl="../../LitiumStudio/Images/grid/pager_thin/"
                                    TreeLineImagesFolderUrl="../../LitiumStudio/Images/grid/lines/" 
                                    TreeLineImageWidth="19" 
                                    TreeLineImageHeight="20"  
                                    IndentCellWidth="22" 
                                    GroupingNotificationPosition="BottomRight"
                                    GroupingNotificationTextCssClass="litContentTopHeader"
                                    GroupBySortAscendingImageUrl="sort_ascending.png"
                                    GroupBySortDescendingImageUrl="sort_descending.png"
                                    GroupBySortImageWidth="16"
                                    GroupBySortImageHeight="16"
                                    LoadingPanelClientTemplateId="c_gridSelectedItems_LoadingFeedbackTemplate"
                                    LoadingPanelPosition="MiddleCenter"
                                    LoadingPanelEnabled="true" 
                                    Sort="Name"
                                    ManualPaging="false"
                                    width="365"
                                    height="400"
                                    BorderWidth="1"
                                    BorderStyle="Solid"
                                    EditOnClickSelectedItem="false"
                                    BorderColor="Gray"
                                    runat="server">
                                    <Levels>
                                        <ComponentArt:GridLevel
                                            DataKeyField="ID"
                                            ShowTableHeading="false" 
                                            ShowSelectorCells="false"
                                            RowCssClass="Row" 
                                            EditCommandClientTemplateId="EditCommandTemplate"
                                            ColumnReorderIndicatorImageUrl="reorder.gif"
                                            DataCellCssClass="DataCell" 
                                            EditFieldCssClass="litGridEditField"
                                            HeadingCellCssClass="HeadingCell" 
                                            HeadingCellHoverCssClass="HeadingCellHover" 
                                            HeadingCellActiveCssClass="HeadingCellActive" 
                                            HeadingRowCssClass="HeadingRow" 
                                            HeadingTextCssClass="HeadingCellText"
                                            SelectedRowCssClass="Row"
                                            GroupHeadingCssClass="GroupHeading" 
                                            SortAscendingImageUrl="sort_ascending.png" 
                                            SortDescendingImageUrl="sort_descending.png" 
                                            SortedHeadingCellCssClass="HeadingCellSorted"
                                            SortImageWidth="16"
                                            SortImageHeight="10">
                                            <Columns>
                                                <ComponentArt:GridColumn DataField="ID" Visible="false" />
                                                <ComponentArt:GridColumn DataField="Name" Width="315" TextWrap="false" />
                                                <ComponentArt:GridColumn DataField="DeleteText" visible="false"/>
                                                <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_DeleteTemplate" Width="25" Align="Right" />
                                                <ComponentArt:GridColumn DataField="AddText" visible="false"/>
                                            </Columns>
                                        </ComponentArt:GridLevel>
                                    </Levels>
                                    <ClientTemplates>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_LoadingFeedbackTemplate">
                                            <table cellspacing="0" cellpadding="10" border="0" style="background-color:White;">
                                                <tr>
                                                    <td class="litText" style="padding-right:3px;">@Loading</td>
                                                    <td style="padding-left:3px;"><img src="/LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border:none;" /></td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_SliderTemplate">
                                            <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td valign="top" style="padding:5px;">
                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                            <tr>
                                                                <td>
                                                                    <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                                        <tr>
                                                                            <td><div style="overflow:hidden;width:225px;" class="litText"><nobr>## DataItem.GetMember('Name').Value ##</nobr></div></td>
                                                                        </tr>
                                                                    </table>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                                <tr>
                                                    <td class="SliderBottom">
                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                            <tr>
                                                                <td>@Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridSelectedItems.PageCount ##</b></td>
                                                                <td align="right">@Group&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridSelectedItems.RecordCount ##</b></td>
                                                            </tr>
                                                        </table>  
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_PagerInfoTemplate">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td class="GridFooterText">@Page <b>## c_gridSelectedItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridSelectedItems.PageCount ##</b> (## c_gridSelectedItems.RecordCount ## @Groups)</td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_DeleteTemplate">
                                            <!-- Show move icon only if the value for 'Disabled' is empty -->
                                            <a href="#" onclick="deleteGridItem('## DataItem.ClientId ##');" title="## DataItem.GetMember('DeleteText').Value ##"><img src="Images/transparent.gif" class="litIconArrowMoveLeft" border="0" alt="" /></a>
                                        </ComponentArt:ClientTemplate>
                                    </ClientTemplates>
                                </ComponentArt:Grid>
                            </td>
                        </tr>
                    </table> 
	            </td>
            </tr>
        </table>
        </Foundation:InformationGroup>
       
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById(null);
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSaveAndClose.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCreateAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>