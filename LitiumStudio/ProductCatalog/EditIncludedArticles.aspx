<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_EditIncludedArticles, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" class="litIconArticle" alt="" runat="server" id="imageIcon" /><asp:Label runat="server" ID="c_labelHeader" />    
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
    <script type="text/javascript">
        function c_gridItems_onItemExternalDrop(sender, eventArgs){
            var originalItem = eventArgs.get_item();
            var originalTable = originalItem.get_table();
            var targetControl = eventArgs.get_targetControl();
            var targetTable = targetControl.get_table();
            if ( targetControl.get_id().indexOf("c_gridSelectedItems") != -1 || originalItem.getMember('DeleteText').get_text() != '' ) {
                targetTable.addEmptyRow(targetTable.getRowCount());
                gridItem = targetTable.getRow(targetTable.getRowCount()-1);
                gridItem.setValue(0,originalItem.getMember('ID').get_text());
                gridItem.setValue(1,originalItem.getMember('ArticleNumber').get_text());
                gridItem.setValue(2,originalItem.getMember('DisplayName').get_text());
                if (targetControl.get_id().indexOf("c_gridExistingItems") != -1)
                {
                    gridItem.setValue(3,originalItem.getMember('AddText').get_text());
                    gridItem.setValue(5,originalItem.getMember('DeleteText').get_text());
                    gridItem.setValue(7,originalItem.getMember('EditText').get_text());
                    gridItem.setValue(8,originalItem.getMember('SaveText').get_text());
                    gridItem.setValue(9,originalItem.getMember('CancelText').get_text());
                    c_gridSelectedItems.deleteItem(originalItem);
                }
                else
                {
                    gridItem.setValue(3,'1');
                    gridItem.setValue(4,originalItem.getMember('EditText').get_text());
                    gridItem.setValue(6,originalItem.getMember('DeleteText').get_text());
                    gridItem.setValue(8,originalItem.getMember('AddText').get_text());
                    gridItem.setValue(9,originalItem.getMember('SaveText').get_text());
                    gridItem.setValue(10,originalItem.getMember('CancelText').get_text());
                    c_gridExistingItems.deleteItem(originalItem);
                }              
                GridSetExistingCustomParameter();
                c_gridExistingItems.sort(1, false);
                c_gridSelectedItems.sort(1, false);
            }
        }
        function addGridItem(rowID){
            var originalItem = c_gridExistingItems.getItemFromClientId(rowID);
            var targetTable = c_gridSelectedItems.get_table();
            targetTable.addEmptyRow(targetTable.getRowCount());
            gridItem = targetTable.getRow(targetTable.getRowCount()-1);
            gridItem.setValue(0,originalItem.getMember('ID').get_text());
            gridItem.setValue(1,originalItem.getMember('ArticleNumber').get_text());
            gridItem.setValue(2,originalItem.getMember('DisplayName').get_text());
            gridItem.setValue(3,'1');
            gridItem.setValue(4,originalItem.getMember('EditText').get_text());
            gridItem.setValue(6,originalItem.getMember('DeleteText').get_text());
            gridItem.setValue(8,originalItem.getMember('AddText').get_text());
            gridItem.setValue(9,originalItem.getMember('SaveText').get_text());
            gridItem.setValue(10,originalItem.getMember('CancelText').get_text());
            GridSetExistingCustomParameter();
            c_gridExistingItems.sort(1, false);
            c_gridSelectedItems.sort(1, false);
        }
        function doNothingGridItem(rowID){}
        function deleteGridItem(rowID){
            var originalItem = c_gridSelectedItems.getItemFromClientId(rowID);
            c_gridSelectedItems.deleteItem(originalItem);
        	GridSetExistingCustomParameter();
            c_gridExistingItems.sort(1, false);
        }
        function editGridItem(rowId){
            c_gridSelectedItems.edit(c_gridSelectedItems.getItemFromClientId(rowId));
        }
        function editGridRow(){
            c_gridSelectedItems.editComplete();
        }
        function c_gridItems_onItemBeforeUpdate(sender, eventArgs){
            var newItem = eventArgs.get_newItem();
            var quantity = newItem.getMember('Quantity').get_value();            
            if(isNaN(quantity) || (!isNaN(quantity) && (quantity < 0)))
            {
                alert('<Foundation:ModuleString ID="ModuleString66" Name="ErrorInvalidNumber" Runat="server"/>');
                eventArgs.set_continue(true);
            }
        }
        function GridSetExistingCustomParameter() {
        	var selectedTable = c_gridSelectedItems.get_table();
        	var rowCount = selectedTable.getRowCount();
        	var ids = "<%=m_articleID %>";
        	for (var i = 0; i < rowCount; i++) {
        		ids += (ids.length == 0 ? "" : ";") + selectedTable.getRow(i).getMember('ID').get_text();
        	}
        	c_gridExistingItems.set_webServiceCustomParameter(ids);
        }
        function onWebServiceComplete(sender, eventArgs) {
            var s = eventArgs.get_customParameter();
            if (s != null && s == "Reset") {
                c_gridExistingItems.set_currentPageIndex(0);
            }
        }
    </script>
   <div class="lsContentTabScroll">
		<div class="lsTabContainer">
			<WebControls:TabListContainer ID="m_tabs" runat="server">
				<tabitems>
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemGeneral" OnClick="TabItemGeneral_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemIncludedArticles" OnClick="TabItemIncludedArticles_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" Visible="false" />
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemPrice" OnClick="TabItemPrice_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" Visible="false" />
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemSettings" OnClick="TabItemSettings_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
               </tabitems>
			</WebControls:TabListContainer>
			<div>
                <table cellpadding="15" cellspacing="0" border="0" class="lsContentScroll">
	                <tr>
		                <td valign="top">
			                <table border="0" cellspacing="0" cellpadding="0">
				                <tr>
					                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="AllAvailableArticles" Runat="server"/>:</td>
					                <td>&nbsp;</td>
					                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString4" Name="ArticlesIncludedInTheArticle" Runat="server"/>:</td>
				                </tr>
				                <tr>
					                <td valign="top">
                                        <ComponentArt:Grid id="c_gridExistingItems"
                                            CssClass="Grid"
                                            RunningMode="WebService"
                                            ShowHeader="true"
                                            ShowFooter="true"
                                            ShowSearchBox="true"
                                            SearchOnKeyPress="false"
                                            SearchTextCssClass="SearchText"
                                            SearchBoxPosition="TopLeft"
                                            SearchBoxCssClass="SearchBoxSmall"
                                            AllowHtmlContent = "true"
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
                                            Sort="ArticleNumber"
                                            ManualPaging="false"
                                            width="310"
                                            height="400"
                                            BorderWidth="1"
                                            BorderStyle="Solid"
                                            BorderColor="Gray"
                                            runat="server"
											WebServiceSelectMethod="GetArticlesForStructure" 
                                            WebService="Litium.Studio.UI.ProductCatalog.WebServices.ArticleServices" >
                                            <ClientEvents>
												<WebServiceComplete EventHandler="onWebServiceComplete" />
                                                <ItemExternalDrop EventHandler="c_gridItems_onItemExternalDrop" />
                                            </ClientEvents>
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
                                                        <ComponentArt:GridColumn DataField="ArticleNumber" Visible="true" IsSearchable="true" Width="100"/>
                                                        <ComponentArt:GridColumn DataField="DisplayName" Width="160"/>
                                                        <ComponentArt:GridColumn DataField="AddText" visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridExistingItems_AddTemplate" Width="25" Align="Center" />
                                                        <ComponentArt:GridColumn DataField="DeleteText" visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn AllowSorting="false" Width="50" Align="Center" visible="false" />
                                                        <ComponentArt:GridColumn DataField="EditText" Visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn DataField="SaveText" visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn DataField="CancelText" visible="false" Width="25"/>
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
                                                                                    <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## DataItem.GetMember('DisplayName').Value ##</nobr></div></td>
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
                                                                        <td align="right">@Article&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridExistingItems.RecordCount ##</b></td>
                                                                    </tr>
                                                                </table>  
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ComponentArt:ClientTemplate>
                                                <ComponentArt:ClientTemplate ID="c_gridExistingItems_PagerInfoTemplate">
                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                        <tr>
                                                            <td class="GridFooterText">@Page <b>## c_gridExistingItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridExistingItems.PageCount ##</b> (## c_gridExistingItems.RecordCount ## @Articles)</td>
                                                        </tr>
                                                    </table>
                                                </ComponentArt:ClientTemplate>
                                                <ComponentArt:ClientTemplate ID="c_gridExistingItems_AddTemplate">
                                                    <a href="#" onclick="addGridItem('## DataItem.ClientId ##');">## DataItem.GetMember('AddText').Value ##</a>
                                                </ComponentArt:ClientTemplate>
                                            </ClientTemplates>
                                        </ComponentArt:Grid>
                                        <div style="margin-top:5px; width:310px;" class="litText">
                                            <Foundation:ModuleString ID="ModuleString6" Name="EditIncludedArticlesAddDescription" Runat="server"/>
                                        </div>
					                </td>
					                <td valign="top" style="padding-left:20px;">&nbsp;</td>
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
                                            AllowHtmlContent="true"
                                            AllowMultipleSelect="true"
                                            AllowEditing="false"
                                            HeaderCssClass="GridHeader2" 
                                            DataAreaCssClass="GridDataArea"
                                            KeyboardEnabled="false"
                                            FooterCssClass="GridFooter" 
                                            GroupByCssClass="GroupByCell"
                                            GroupByTextCssClass="GroupByText"
                                            GroupingNotificationText=""
                                            ItemDraggingEnabled="false"
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
                                            Sort="ArticleNumber"
                                            ManualPaging="false"
                                            width="400"
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
                                                        <ComponentArt:GridColumn DataField="ArticleNumber" Visible="true" Width="100"/>
                                                        <ComponentArt:GridColumn DataField="DisplayName" Width="160" />
                                                        <ComponentArt:GridColumn DataField="Quantity" AllowEditing="True" Width="100"/>
                                                        <ComponentArt:GridColumn DataField="EditText" visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_EditTemplate" EditControlType="EditCommand" Width="25" Align="Center" />
                                                        <ComponentArt:GridColumn DataField="DeleteText" visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_DeleteTemplate" Width="50" Align="Center" />
                                                        <ComponentArt:GridColumn DataField="AddText" visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn DataField="SaveText" visible="false" Width="25"/>
                                                        <ComponentArt:GridColumn DataField="CancelText" visible="false" Width="25"/>
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
                                                                                    <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## DataItem.GetMember('DisplayName').Value ##</nobr></div></td>
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
                                                                        <td align="right">@Article&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridSelectedItems.RecordCount ##</b></td>
                                                                    </tr>
                                                                </table>  
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </ComponentArt:ClientTemplate>
                                                <ComponentArt:ClientTemplate ID="c_gridSelectedItems_PagerInfoTemplate">
                                                    <table cellspacing="0" cellpadding="0" border="0">
                                                        <tr>
                                                            <td class="GridFooterText">@Page <b>## c_gridSelectedItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridSelectedItems.PageCount ##</b> (## c_gridSelectedItems.RecordCount ## @Articles)</td>
                                                        </tr>
                                                    </table>
                                                </ComponentArt:ClientTemplate>
                                                <ComponentArt:ClientTemplate Id="c_gridSelectedItems_EditTemplate">
                                                    <a href="#" onclick="editGridItem('## DataItem.ClientId ##');">## DataItem.GetMember('EditText').Value ##</a>
                                                </ComponentArt:ClientTemplate>
                                                <ComponentArt:ClientTemplate ID="c_gridSelectedItems_DeleteTemplate">
                                                    <a href="#" onclick="deleteGridItem('## DataItem.ClientId ##');">## DataItem.GetMember('DeleteText').Value ##</a>
                                                </ComponentArt:ClientTemplate>
                                                <ComponentArt:ClientTemplate Id="EditCommandTemplate">
                                                    <a href="#" onclick="editGridRow();">## DataItem.GetMember('SaveText').Value ##</a> | <a href="#" onclick="c_gridSelectedItems.EditCancel();">## DataItem.GetMember('CancelText').Value ##</a>
                                                </ComponentArt:ClientTemplate>
                                            </ClientTemplates>
                                            <ClientEvents>
                                                <ItemExternalDrop EventHandler="c_gridItems_onItemExternalDrop" />
                                                <ItemBeforeUpdate EventHandler="c_gridItems_onItemBeforeUpdate" />                                        
                                            </ClientEvents>
                                        </ComponentArt:Grid>
					                </td>
				                </tr>
			                </table>
		                </td>
	                </tr>
                </table>
            </div>
        </div>
    </div>
    <script type="text/javascript">
    	var submitObject = null; //document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>