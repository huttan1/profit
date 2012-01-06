<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesCreate3, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarCreate" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreatePrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSave" runat="server"/>	
		<toolbar:ToolbarItem OnClick="ToolbarItemCreateSaveAndEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSaveAndEdit" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconDocumentAdd2" />
	<Foundation:ModuleString ID="ModuleString1" Name="CreatePageHeader" Runat="server"/> <span style="font-weight:normal;"><asp:Label runat="server" ID="c_guideNumber"></asp:Label></span>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
	<script type="text/javascript">
		function SetAltText(item)
		{
			item.alt = '<%=this.DeleteText %>';
		}
	    
		// Adds an item from the grid with existing items to the grid with selected items.
		function addGridItem(rowID)
		{
			var originalItem = c_gridExistingItems.getItemFromClientId(rowID);
			var targetTable = c_gridSelectedItems.get_table();
			targetTable.addEmptyRow(targetTable.getRowCount());
			gridItem = targetTable.getRow(targetTable.getRowCount()-1);
			gridItem.setValue(0,originalItem.getMember('ID').get_text());
			gridItem.setValue(1,originalItem.getMember('Name').get_text());
			gridItem.setValue(5,originalItem.getMember('DeleteText').get_text());
			gridItem.setValue(7,originalItem.getMember('AddText').get_text());
			gridItem.setValue(8,originalItem.getMember('ReadText').get_text());
			gridItem.setValue(9,originalItem.getMember('WriteText').get_text());
			gridItem.setValue(10,originalItem.getMember('PublishText').get_text());
			c_gridExistingItems.deleteItem(originalItem);
			c_gridSelectedItems.sort(1, false);
		}
	    
		// Removes an item from the grid with existing items from the grid with selected items.
		function deleteGridItem(rowID)
		{
			var originalItem = c_gridSelectedItems.getItemFromClientId(rowID);
			var targetTable = c_gridExistingItems.get_table();
			var index = targetTable.getRowCount();
			targetTable.addEmptyRow(targetTable.getRowCount());
			gridItem = targetTable.getRow(targetTable.getRowCount()-1);
			gridItem.setValue(0,originalItem.getMember('ID').get_text());
			gridItem.setValue(1,originalItem.getMember('Name').get_text());
			gridItem.setValue(2,originalItem.getMember('AddText').get_text());
			gridItem.setValue(4,originalItem.getMember('DeleteText').get_text());
			gridItem.setValue(5,originalItem.getMember('ReadText').get_text());
			gridItem.setValue(6,originalItem.getMember('WriteText').get_text());
			gridItem.setValue(7,originalItem.getMember('PublishText').get_text());
			c_gridSelectedItems.deleteItem(originalItem);
			c_gridExistingItems.sort(1, false);
		}
	    
		// Updates the string in the hidden field with the permission changes.
		// Runs when a permission check box is clicked.
		function SetPermission(permissionType, checkBox, index)
		{
			var gridTable = c_gridSelectedItems.get_table();
			var row = gridTable.getRow(index);
	        
			if(checkBox.checked)
			{
				if(permissionType == 0)
				{
					row.SetValue(11, "checked");    
				}
				else if(permissionType == 1)
				{
					row.SetValue(12, "checked");    
				}
				else if(permissionType == 2)
				{
					row.SetValue(13, "checked");    
				}
			}
			else
			{
				if(permissionType == 0)
				{
					row.SetValue(11, null);    
				}
				else if(permissionType == 1)
				{
					row.SetValue(12, null);    
				}
				else if(permissionType == 2)
				{
					row.SetValue(13, null);    
				}
			}
		}
		function Grid_OnLoad(sender, eventArgs) {
			toolbarItemAction('activate','1_2,1_3');
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
			                            <td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="AvailableGroups" Runat="server"/>:</td>
			                            <td>&nbsp;</td>
			                            <td class="litBoldText"><Foundation:ModuleString ID="ModuleString4" Name="GroupsWithPermissions" Runat="server"/>:</td>
		                            </tr>
		                            <tr>
			                            <td valign="top">
                                            <ComponentArt:Grid id="c_gridExistingItems"
                                                CssClass="Grid"
                                                RunningMode="Client"
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
                                                width="310"
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
                                                            <ComponentArt:GridColumn DataField="Name" Visible="true" />
                                                            <ComponentArt:GridColumn DataField="AddText" visible="false"/>
                                                            <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridExistingItems_AddTemplate" Width="25" Align="Right" />
                                                            <ComponentArt:GridColumn DataField="DeleteText" visible="false"/>
                                                            <ComponentArt:GridColumn DataField="ReadText" Width="10" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="WriteText" Width="10" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="PublishText" Width="10" Align="Center" Visible="false" />
                                                        </Columns>
                                                    </ComponentArt:GridLevel>
                                                </Levels>
                                                <ClientTemplates>
                                                    <ComponentArt:ClientTemplate ID="c_gridExistingItems_LoadingFeedbackTemplate">
                                                        <table cellspacing="0" cellpadding="10" border="0" style="background-color:White;">
                                                            <tr>
                                                                <td class="litText" style="padding-right:3px;">@Loading</td>
                                                                <td style="padding-left:3px;"><img src="../../LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border:none;" /></td>
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
                                                                                        <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## DataItem.GetMember('Name').Value ##</nobr></div></td>
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
                                                        <a href="#" onclick="addGridItem('## DataItem.ClientId ##');" title="## DataItem.GetMember('AddText').Value ##"><img src="../../LitiumStudio/Images/icons_standard/arrow_move_gray_right_16px.png"" border="0" height="16px" width="16px" alt="## DataItem.GetMember('AddText').Value ##" /></a>
                                                    </ComponentArt:ClientTemplate>
                                                </ClientTemplates>
                                            </ComponentArt:Grid>
			                            </td>
			                            <td valign="top" style="padding-left:5px;">&nbsp;</td>
			                            <td valign="top">
                                            <ComponentArt:Grid id="c_gridSelectedItems" 
                                                CssClass="Grid"
                                                RunningMode="Client"
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
                                                width="420"
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
                                                            <ComponentArt:GridColumn DataField="Name" Width="160" />
                                                            <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_Read" DataType="System.Boolean" ColumnType="CheckBox" Align="Left" />
                                                            <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_Write" DataType="System.Boolean" ColumnType="CheckBox" Align="Left" />
                                                            <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_Publish" DataType="System.Boolean" ColumnType="CheckBox" Align="Left" />
                                                            <ComponentArt:GridColumn DataField="DeleteText" visible="false"/>
                                                            <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_DeleteTemplate" Width="25" Align="Right" />
                                                            <ComponentArt:GridColumn DataField="AddText" visible="false"/>
                                                            <ComponentArt:GridColumn DataField="ReadText" Width="10" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="WriteText" Width="10" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="PublishText" Width="10" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="ReadChecked" Width="50" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="WriteChecked" Width="50" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="PublishChecked" Width="50" Align="Center" Visible="false" />
                                                            <ComponentArt:GridColumn DataField="Disabled" Width="50" Align="Center" Visible="false" />
                                                        </Columns>
                                                    </ComponentArt:GridLevel>
                                                </Levels>
                                                <ClientTemplates>
                                                    <ComponentArt:ClientTemplate ID="c_gridSelectedItems_LoadingFeedbackTemplate">
                                                        <table cellspacing="0" cellpadding="10" border="0" style="background-color:White;">
                                                            <tr>
                                                                <td class="litText" style="padding-right:3px;">@Loading</td>
                                                                <td style="padding-left:3px;"><img src="../../LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border:none;" /></td>
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
                                                                                        <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## DataItem.GetMember('Name').Value ##</nobr></div></td>
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
                                                    <ComponentArt:ClientTemplate ID="c_gridSelectedItems_Read">
                                                        <input type="checkbox" ## DataItem.GetMember('ReadChecked').Value ## ## DataItem.GetMember('Disabled').Value ## onclick="javascript:SetPermission(0, this, '##DataItem.Index##');" />
                                                    </ComponentArt:ClientTemplate>
                                                    <ComponentArt:ClientTemplate ID="c_gridSelectedItems_Write">
                                                        <input type="checkbox" ## DataItem.GetMember('WriteChecked').Value ## ## DataItem.GetMember('Disabled').Value ## onclick="javascript:SetPermission(1, this, '##DataItem.Index##');" />
                                                    </ComponentArt:ClientTemplate>
                                                    <ComponentArt:ClientTemplate ID="c_gridSelectedItems_Publish">
                                                        <input type="checkbox" ## DataItem.GetMember('PublishChecked').Value ## ## DataItem.GetMember('Disabled').Value ## onclick="javascript:SetPermission(2, this, '##DataItem.Index##');" />
                                                    </ComponentArt:ClientTemplate>
                                                    <ComponentArt:ClientTemplate ID="c_gridSelectedItems_DeleteTemplate">
                                                        <!-- Show move icon only if the value for 'Disabled' is empty -->
                                                        <a href="#" onclick="deleteGridItem('## DataItem.ClientId ##');" title="## DataItem.GetMember('DeleteText').Value ##">## DataItem.GetMember('Disabled').Value ? '' : '<img src="../../LitiumStudio/Images/icons_standard/arrow_move_gray_left_16px.png" onload="javascript:SetAltText(this)" height="16px" width="16px" border="0" alt="" />' ##</a>
                                                    </ComponentArt:ClientTemplate>
                                                </ClientTemplates>
                                                <ClientEvents>
                                                    <Load EventHandler="Grid_OnLoad" />
                                                </ClientEvents>
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
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemCreateSaveAndEdit.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCreateAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>