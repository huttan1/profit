<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditPersonControl, Litum.Studio.Web" %>
<script type="text/javascript">
	function c_gridItems_onItemExternalDrop(sender, eventArgs) {
		var originalItem = eventArgs.get_item();
		var originalTable = originalItem.get_table();
		var targetControl = eventArgs.get_targetControl();
		var targetTable = targetControl.get_table();
		if (targetControl.get_id().indexOf("c_gridSelectedItems") != -1 || originalItem.getMember('DeleteText').get_text() != '') {
			if (targetControl.get_id().indexOf("c_gridExistingItems") != -1) {
				deletingItem = true;
				c_gridSelectedItems.deleteItem(originalItem);
			} else {
				addingItem = true; 
				c_gridExistingItems.deleteItem(originalItem);
			}
		}
	}
	var addingItem = false;
	function addGridItem(rowId) {
		var originalItem = c_gridExistingItems.getItemFromClientId(rowId);
		addingItem = true;
		c_gridExistingItems.deleteItem(originalItem);
	}
	function GridItemUpdated() {
		if (addingItem) {
			addingItem = false;
			c_gridSelectedItems.sort(1, false);
		} else if (deletingItem) {
			deletingItem = false;
			c_gridExistingItems.sort(1, false);
		}
	}

	function doNothingGridItem(rowId) { }
	var deletingItem = false;
	function deleteGridItem(rowId) {
		var originalItem = c_gridSelectedItems.getItemFromClientId(rowId);
		deletingItem = true;
		c_gridSelectedItems.deleteItem(originalItem);
	}
</script>
<div class="lsTabContent">
<table border="0" cellspacing="0" cellpadding="0" style="margin-top: 15px;">
<tr>
    <td class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="AvailablePersons" runat="server" />:</td>
    <td>&nbsp;</td>
    <td class="litBoldHeader"><asp:Label runat="server" ID="c_labelMembers" />:</td>
</tr>
<tr>
    <td valign="top">
        <ComponentArt:Grid id="c_gridExistingItems"
            CssClass="Grid"
            RunningMode="Callback"
            ManualPaging="true"
            ShowHeader="true"
            ShowFooter="true"
            ShowSearchBox="true"
            SearchOnKeyPress="false"
            SearchTextCssClass="SearchText"
            SearchBoxPosition="TopLeft"
            SearchBoxCssClass="SearchBoxSmall"
            AllowMultipleSelect="true"
            AllowEditing="false"
            HeaderCssClass="GridHeader2" 
            DataAreaCssClass="GridDataArea"
            KeyboardEnabled="false"
            FooterCssClass="GridFooter" 
            GroupByCssClass="GroupByCell"
            GroupByTextCssClass="GroupByText"
            GroupingNotificationText=""
            ItemDraggingEnabled="true"
            ExternalDropTargets="c_gridSelectedItems"
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
            AutoCallBackOnInsert="true"
            AutoCallBackOnUpdate="true"
            AutoCallBackOnDelete="true"
            width="420"
            BorderWidth="1"
            BorderStyle="Solid"
            BorderColor="Gray"
            runat="server">
            <Levels>
                <ComponentArt:GridLevel
                    DataKeyField="Id"
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
                        <ComponentArt:GridColumn DataField="Id" Visible="false" />
                        <ComponentArt:GridColumn DataField="Name" Visible="true" />
                        <ComponentArt:GridColumn DataField="Email" Visible="true" />
                        <ComponentArt:GridColumn DataField="AddText" visible="false" />
                        <ComponentArt:GridColumn DataField="DeleteText" Visible="false" />
                        <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridExistingItems_EditTemplate" Width="100" Align="Center" />
                    </Columns>
                </ComponentArt:GridLevel>
            </Levels>
            <ClientTemplates>
                <ComponentArt:ClientTemplate Id="c_gridExistingItems_LoadingFeedbackTemplate">
                    <table cellspacing="0" cellpadding="10" border="0" style="background-color:White;">
                        <tr>
                            <td class="litText" style="padding-right:3px;">@Loading</td>
                            <td style="padding-left:3px;"><img src="../../LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border:none;" /></td>
                        </tr>
                    </table>
                </ComponentArt:ClientTemplate>
                <ComponentArt:ClientTemplate Id="c_gridExistingItems_SliderTemplate">
                    <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td valign="top" style="padding:5px;">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td>
                                            <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                <tr>
                                                    <td><div style="overflow:hidden;width:115px;" class="litText">## DataItem.GetMember('Name').Value ##</div></td>
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
                                        <td align="right">@Person&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridExistingItems.RecordCount ##</b></td>
                                    </tr>
                                </table>  
                            </td>
                        </tr>
                    </table>
                </ComponentArt:ClientTemplate>
                <ComponentArt:ClientTemplate ID="c_gridExistingItems_PagerInfoTemplate">
                    <table cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td class="GridFooterText">@Page <b>## c_gridExistingItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridExistingItems.PageCount ##</b> (## c_gridExistingItems.RecordCount ## @Persons)</td>
                        </tr>
                    </table>
                </ComponentArt:ClientTemplate>
                <ComponentArt:ClientTemplate Id="c_gridExistingItems_EditTemplate">
                    <a href="#" onclick="addGridItem('## DataItem.ClientId ##');" title="## DataItem.GetMember('AddText').Value ##"><img src="Images/transparent.gif" class="litIconArrowMoveRight" border="0" alt="## DataItem.GetMember('AddText').Value ##" /></a>
                </ComponentArt:ClientTemplate>
            </ClientTemplates>
            <ClientEvents>
                <ItemExternalDrop EventHandler="c_gridItems_onItemExternalDrop" />
                <CallbackComplete EventHandler="GridItemUpdated" />
            </ClientEvents>
        </ComponentArt:Grid>
    </td>
    <td valign="top" style="padding-left:5px;">&nbsp;</td>
    <td valign="top">
        <ComponentArt:Grid id="c_gridSelectedItems"
            CssClass="Grid"
            RunningMode="Callback"
            ManualPaging="true"
            ShowHeader="true"
            ShowFooter="true"
            ShowSearchBox="false"
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
            ItemDraggingEnabled="true"
            ExternalDropTargets="c_gridExistingItems"
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
            AutoCallBackOnInsert="true"
            AutoCallBackOnUpdate="true"
            AutoCallBackOnDelete="true"
            width="420"
            BorderWidth="1"
            BorderStyle="Solid"
            BorderColor="Gray"
            runat="server">
            <Levels>
                <ComponentArt:GridLevel
                    DataKeyField="Id"
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
                        <ComponentArt:GridColumn DataField="Id" Visible="false" />
                        <ComponentArt:GridColumn DataField="Name" Visible="true" />
                        <ComponentArt:GridColumn DataField="Email" Visible="true" />
                        <ComponentArt:GridColumn DataField="AddText" visible="false"/>
                        <ComponentArt:GridColumn DataField="DeleteText" Visible="false" />
                        <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_EditTemplate" Width="100" Align="Center" />
                    </Columns>
                </ComponentArt:GridLevel>
            </Levels>
            <ClientTemplates>
                <ComponentArt:ClientTemplate Id="c_gridSelectedItems_LoadingFeedbackTemplate">
                    <table cellspacing="0" cellpadding="10" border="0" style="background-color:White;">
                        <tr>
                            <td class="litText" style="padding-right:3px;">@Loading</td>
                            <td style="padding-left:3px;"><img src="../../LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border:none;" /></td>
                        </tr>
                    </table>
                </ComponentArt:ClientTemplate>
                <ComponentArt:ClientTemplate Id="c_gridSelectedItems_SliderTemplate">
                    <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td valign="top" style="padding:5px;">
                                <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td>
                                            <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                <tr>
                                                    <td><div style="overflow:hidden;width:115px;" class="litText">## DataItem.GetMember('Name').Value ##</div></td>
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
                                        <td align="right">@Person&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridSelectedItems.RecordCount ##</b></td>
                                    </tr>
                                </table>  
                            </td>
                        </tr>
                    </table>
                </ComponentArt:ClientTemplate>
                <ComponentArt:ClientTemplate ID="c_gridSelectedItems_PagerInfoTemplate">
                    <table cellspacing="0" cellpadding="0" border="0">
                        <tr>
                            <td class="GridFooterText">@Page <b>## c_gridSelectedItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridSelectedItems.PageCount ##</b> (## c_gridSelectedItems.RecordCount ## @Persons)</td>
                        </tr>
                    </table>
                </ComponentArt:ClientTemplate>
                <ComponentArt:ClientTemplate Id="c_gridSelectedItems_EditTemplate">
                    <a href="#" onclick="deleteGridItem('## DataItem.ClientId ##');" title="## DataItem.GetMember('DeleteText').Value ##"><img src="Images/transparent.gif" class="litIconArrowMoveLeft" border="0" alt="" /></a>
                </ComponentArt:ClientTemplate>
            </ClientTemplates>
            <ClientEvents>
                <ItemExternalDrop EventHandler="c_gridItems_onItemExternalDrop" />
                <CallbackComplete EventHandler="GridItemUpdated" />
            </ClientEvents>
        </ComponentArt:Grid>
    </td>
</tr>
</table>
</div>
