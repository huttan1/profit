<%@ page language="C#" autoeventwireup="true" enableeventvalidation="false" inherits="LitiumStudio_ProductCatalog_PriceListAddEditArticle, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
        runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
        DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
        ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
        DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem ID="Abort" runat="server" ImageUrl="icons_standard/sign_stop.png"
                CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="Save" runat="server" CausesValidation="True"
                ImageUrl="icons_standard/floppy_disk_blue.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
        </Items>
        <ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>
    </ComponentArt:ToolBar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
     <img src="Images/transparent.gif" class="litIconBarcode" alt="" /><asp:Label runat="server" ID="c_header" />    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
       <script type="text/javascript">
    
        // Adds an item from the grid with existing items to the grid with selected items.
        function addGridItem(rowID) {
        
            var originalItem = c_gridExistingItems.getItemFromClientId(rowID);            
            var targetTable = c_gridSelectedItems.get_table();
            targetTable.addEmptyRow(targetTable.getRowCount());
            gridItem = targetTable.getRow(targetTable.getRowCount() - 1);
            gridItem.setValue(0, originalItem.getMember('ID').get_text());
            gridItem.setValue(1, originalItem.getMember('ArticleNumber').get_text());             
            gridItem.setValue(2, originalItem.getMember('DisplayName').get_text());  
            gridItem.setValue(3, originalItem.getMember('CurrentPrice').get_text()); 
                      
            c_gridExistingItems.deleteItem(originalItem);
            AddItemToSelectedItems(originalItem.getMember('ID').get_text());
            ReloadGrid();
        }

        // Removes an item from the grid with existing items from the grid with selected items.
        function deleteGridItem(rowID) {
            var originalItem = c_gridSelectedItems.getItemFromClientId(rowID);
            var targetTable = c_gridExistingItems.get_table();
            targetTable.addEmptyRow(targetTable.getRowCount());
            gridItem = targetTable.getRow(targetTable.getRowCount() - 1);
            gridItem.setValue(0, originalItem.getMember('ID').get_text());
            gridItem.setValue(1, originalItem.getMember('ArticleNumber').get_text());
            gridItem.setValue(2, originalItem.getMember('DisplayName').get_text());
            gridItem.setValue(3, originalItem.getMember('CurrentPrice').get_text());            
            c_gridSelectedItems.deleteItem(originalItem);
            RemoveItemFromSelectedItems(originalItem.getMember('ID').get_text());
            ReloadGrid();
        }
        var AddText = "<Foundation:ModuleString runat="server" Name="Add" />";
        var DeleteText = "<Foundation:ModuleString runat="server" Name="Remove" />";
        
        function AddItemToSelectedItems(articleId)
        {
            // Custom parameter format: PriceListId^ArticleIds seperated by | sign.
            var customeParameter = document.getElementById("<%= c_hiddenCustomParameter.ClientID %>");
            var customParameterSections = new Array();    
            customParameterSections = customeParameter.value.split('^');
            // contents of the array:
            // customParameterSections[0] = PriceListId
            // customParameterSections[1] = ArticleIds seperated by | sign.
            
            var newParam = customParameterSections[0] + '^';
            
            // append the new article id to the existing set of article ids.
            newParam = newParam + customParameterSections[1] + articleId + '|';
            customeParameter.value = newParam;
        }
        
        function RemoveItemFromSelectedItems(articleId)
        {
            var customParamContainer = document.getElementById("<%= c_hiddenCustomParameter.ClientID %>");
            var customParameterSections = new Array();
            
            // Custom parameter format: PriceListId^ArticleIds seperated by | sign.
            customParameterSections = customParamContainer.value.split('^');
            
            var selectedItems = customParameterSections[1]; // Selected items in the right hand side grid. seperated by | sign.
            
            var resultString = '';
            
            if(selectedItems != '')
            {
                var itemsArray = new Array(); // Stores already existing items in the right hand side grid.
                var newItemsArray = new Array(); // Stores the items that will remain in the right hand side grid after the current item is removed.
                itemsArray = selectedItems.split('|');
                
                for (var i=0; i < itemsArray.length; i++)
                {
                    if(itemsArray[i] != '')
                    {
                        // Add the items to the new items array if it is not the item to be deleted.
                        if(itemsArray[i] != articleId)
                        {
                            newItemsArray[newItemsArray.length] = itemsArray[i];
                        }
                    }
                }
                
                // Recreate the formatted string to be passed as the custom parameter
                for(var j=0; j < newItemsArray.length; j++)
                {
                    resultString = resultString + newItemsArray[j] + '|';
                }
            }
            // Append the created string to the exsisting other custom parameters (PriceListId)
            customParamContainer.value = customParameterSections[0] + '^' + resultString;
        }
        
        // Loads data to the left hand side grid.
        // called from the current page only (but from multiple locations).
        function ReloadGrid()
        {
            var customParameter = document.getElementById("<%= c_hiddenCustomParameter.ClientID %>").value;
            c_gridExistingItems.set_webServiceCustomParameter(customParameter);
            c_gridExistingItems.webServiceSelect();
        }
        
		function onWebServiceComplete(sender, eventArgs)
        {
            if(eventArgs.get_customParameter() != null && eventArgs.get_customParameter().toLowerCase() == "reset")
		        c_gridExistingItems.set_currentPageIndex(0);
        }
        
        function onPriceIncludesVatChange()
        {
            var vatValidator = document.getElementById("<%= c_reqVat.ClientID %>");
            var vatRequiredImage = document.getElementById("c_imageVatRequired");
            if(document.getElementById("<%= c_checkBoxPriceIncludesVat.ClientID %>").checked)
            {
                ValidatorEnable(vatValidator, false); 
                vatRequiredImage.style.display = "none"; 
            }
            else
            {
                vatRequiredImage.style.display = "inline"; 
            }
        }

        
    </script>

    <asp:HiddenField ID="c_hiddenCustomParameter" runat="server" />
    <asp:HiddenField ID="c_hiddenPriceListId" runat="server" />
    <div class="lsContentScroll">
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
            <tr>
                <td valign="top">
					<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="235px" >
						<div class="litBoldHeader">
							<Foundation:ModuleString runat="server" Name="Price" />
							<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
								alt="" />
						</div>
						<div>
							<asp:TextBox runat="server" ID="c_price" CssClass="litInputSelect" />&nbsp;<asp:RequiredFieldValidator
								ID="c_reqPrice" ControlToValidate="c_price" runat="server" Display="Dynamic" /><asp:RangeValidator
									runat="server" ID="c_rangePrice" ControlToValidate="c_price" CultureInvariantValues="true"
									Type="Double" MinimumValue="0" MaximumValue="99999999999" />
						</div>
						<div class="litBoldHeader" >
							<Foundation:ModuleString ID="ModuleString2" runat="server" Name="PriceIncludesVat" /> 
							<asp:CheckBox ID="c_checkBoxPriceIncludesVat" runat="server" onclick="onPriceIncludesVatChange()" style="padding-left: 5px;" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString1" runat="server" Name="VATPercentage" />
							<img id="c_imageVatRequired" src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
								alt="" />
						</div>                   
						<div>
							<asp:TextBox runat="server" ID="c_vat" CssClass="litInputSelect" />&nbsp;<asp:RequiredFieldValidator
								ID="c_reqVat" ControlToValidate="c_vat" runat="server" Display="Dynamic" /><asp:RangeValidator
									runat="server" ID="c_rangeVat" ControlToValidate="c_vat" CultureInvariantValues="true"
									Type="Double" MinimumValue="0" MaximumValue="9999.9999" />
						</div>
					</Foundation:InformationGroup>
                    <br />
                    <table border="0" cellspacing="0" cellpadding="0">
						<tr>                         						
							<td>
								<asp:CustomValidator ID="c_custArticles" runat="server" OnServerValidate="ValidateArticleSelection" />
							</td>
						</tr>
                        <tr>
                            <td class="litBoldHeader">
                                <Foundation:ModuleString ID="ModuleString3" Name="PriceListAvailableArticles" runat="server" />
                            </td>
                            <td>
                                &nbsp;
                            </td>
                            <td class="litBoldHeader">
                                <Foundation:ModuleString ID="ModuleString4" Name="PriceListSelectedArticles" runat="server" />
                            </td>
                        </tr>
                        <tr>
                            <td valign="top">
                                <ComponentArt:Grid ID="c_gridExistingItems" onclick="ReloadGrid()" CssClass="Grid" RunningMode="WebService"
                                    ShowHeader="true" ShowFooter="true" ShowSearchBox="true" SearchOnKeyPress="false"
                                    SearchTextCssClass="SearchText" SearchBoxPosition="TopLeft" SearchBoxCssClass="SearchBoxSmall"
                                    AllowMultipleSelect="false" AllowHtmlContent="true" AllowEditing="false" HeaderCssClass="GridHeader2"
                                    DataAreaCssClass="GridDataArea" KeyboardEnabled="false" FooterCssClass="GridFooter"
                                    GroupByCssClass="GroupByCell" GroupByTextCssClass="GroupByText" GroupingNotificationText=""
                                    ItemDraggingEnabled="false" PageSize="10" PagerStyle="Slider" PagerPosition="BottomLeft"
                                    PagerInfoPosition="TopRight" PagerInfoClientTemplateId="c_gridExistingItems_PagerInfoTemplate"
                                    PagerTextCssClass="litContentInfo" PagerButtonWidth="18" PagerButtonHeight="18"
                                    SliderHeight="18" SliderWidth="100" SliderGripWidth="9" SliderPopupOffsetX="20"
                                    SliderPopupClientTemplateId="c_gridExistingItems_SliderTemplate" PreExpandOnGroup="true"
                                    ImagesBaseUrl="../../LitiumStudio/Images/grid/" PagerImagesFolderUrl="../../LitiumStudio/Images/grid/pager_thin/"
                                    TreeLineImagesFolderUrl="../../LitiumStudio/Images/grid/lines/" TreeLineImageWidth="19"
                                    TreeLineImageHeight="20" IndentCellWidth="22" GroupingNotificationPosition="BottomRight"
                                    GroupingNotificationTextCssClass="litContentTopHeader" GroupBySortAscendingImageUrl="sort_ascending.png"
                                    GroupBySortDescendingImageUrl="sort_descending.png" GroupBySortImageWidth="16"
                                    GroupBySortImageHeight="16" LoadingPanelClientTemplateId="c_gridExistingItems_LoadingFeedbackTemplate"
                                    LoadingPanelPosition="MiddleCenter" LoadingPanelEnabled="true" Sort="Name" ManualPaging="false"
                                    Width="310" Height="425" BorderWidth="1" BorderStyle="Solid" BorderColor="Gray"
                                    runat="server" WebServiceSelectMethod="GetArticle" WebService="Litium.Studio.UI.ProductCatalog.WebServices.ArticleServices">
                                    <Levels>
                                        <ComponentArt:GridLevel DataKeyField="ID" ShowTableHeading="false" ShowSelectorCells="false"
                                            RowCssClass="Row" ColumnReorderIndicatorImageUrl="reorder.gif" DataCellCssClass="DataCell"
                                            HeadingCellCssClass="HeadingCell" HeadingCellHoverCssClass="HeadingCellHover"
                                            HeadingCellActiveCssClass="HeadingCellActive" HeadingRowCssClass="HeadingRow"
                                            HeadingTextCssClass="HeadingCellText" SelectedRowCssClass="Row" HoverRowCssClass="HoverRow"
                                            GroupHeadingCssClass="GroupHeading" SortAscendingImageUrl="sort_ascending.png"
                                            SortDescendingImageUrl="sort_descending.png" SortedHeadingCellCssClass="HeadingCellSorted" SortImageWidth="16" SortImageHeight="10">
                                            <Columns>
                                                <ComponentArt:GridColumn DataField="ID" Visible="false" />
                                                <ComponentArt:GridColumn DataField="ArticleNumber" Visible="true" HeadingText="ArticleNumber" IsSearchable="true" />
                                                <ComponentArt:GridColumn DataField="DisplayName" Visible="true" HeadingText="Description" />
                                                <ComponentArt:GridColumn DataField="CurrentPrice" Visible="true" Align="Right" HeadingText="CurrentPrice" />
                                                <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridExistingItems_AddTemplate"
                                                    Width="25" Align="Right" />
                                            </Columns>
                                        </ComponentArt:GridLevel>
                                    </Levels>
                                    <ClientTemplates>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_LoadingFeedbackTemplate">
                                            <table cellspacing="0" cellpadding="10" border="0" style="background-color: White;">
                                                <tr>
                                                    <td class="litText" style="padding-right: 3px;">
                                                        @Loading
                                                    </td>
                                                    <td style="padding-left: 3px;">
                                                        <img src="/LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border: none;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_SliderTemplate">
                                            <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td valign="top" style="padding: 5px;">
                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                            <tr>
                                                                <td>
                                                                    <table cellspacing="0" cellpadding="2" border="0" style="width: 255px;">
                                                                        <tr>
                                                                            <td>
                                                                                <div style="overflow: hidden; width: 115px;" class="litText">
                                                                                    <nobr>## DataItem.GetMember('ArticleNumber').Value ## - ## DataItem.GetMember('DisplayName').Value ##</nobr>
                                                                                </div>
                                                                            </td>
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
                                                                <td>
                                                                    @Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridExistingItems.PageCount
                                                                        ##</b>
                                                                </td>
                                                                <td align="right">
                                                                    @Record&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridExistingItems.RecordCount
                                                                        ##</b>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_PagerInfoTemplate">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td class="GridFooterText">
                                                        @Page <b>## c_gridExistingItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridExistingItems.PageCount
                                                            ##</b> (## c_gridExistingItems.RecordCount ## @Records)
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridExistingItems_AddTemplate">
                                            <a href="#" onclick="addGridItem('## DataItem.ClientId ##');" title="## AddText ##">
                                                <img src="Images/transparent.gif" class="litIconArrowMoveRight" border="0" alt="## AddText ##" /></a>
                                        </ComponentArt:ClientTemplate>
                                    </ClientTemplates>
                                    <ClientEvents>
                                        <PageIndexChange EventHandler="ReloadGrid" />
                                        <SortChange EventHandler="ReloadGrid" />
										<WebServiceComplete EventHandler="onWebServiceComplete" />
                                    </ClientEvents>
                                </ComponentArt:Grid>
                            </td>
                            <td valign="top" style="padding-left: 5px;">
                                &nbsp;
                            </td>
                            <td valign="top">
                                <ComponentArt:Grid ID="c_gridSelectedItems" CssClass="Grid" RunningMode="Client"
                                    ShowHeader="true" ShowFooter="true" ShowSearchBox="false" SearchOnKeyPress="true"
                                    SearchTextCssClass="SearchText" SearchBoxPosition="TopLeft" SearchBoxCssClass="SearchBoxSmall"
                                    AllowMultipleSelect="false" AllowHtmlContent="true" AllowEditing="true" HeaderCssClass="GridHeader2"
                                    DataAreaCssClass="GridDataArea" KeyboardEnabled="false" FooterCssClass="GridFooter"
                                    GroupByCssClass="GroupByCell" GroupByTextCssClass="GroupByText" GroupingNotificationText=""
                                    ItemDraggingEnabled="false" PageSize="10" PagerStyle="Slider" PagerPosition="BottomLeft"
                                    PagerInfoPosition="TopRight" PagerInfoClientTemplateId="c_gridSelectedItems_PagerInfoTemplate"
                                    PagerTextCssClass="litContentInfo" PagerButtonWidth="18" PagerButtonHeight="18"
                                    SliderHeight="18" SliderWidth="100" SliderGripWidth="9" SliderPopupOffsetX="20"
                                    SliderPopupClientTemplateId="c_gridSelectedItems_SliderTemplate" PreExpandOnGroup="true"
                                    ImagesBaseUrl="../../LitiumStudio/Images/grid/" PagerImagesFolderUrl="../../LitiumStudio/Images/grid/pager_thin/"
                                    TreeLineImagesFolderUrl="../../LitiumStudio/Images/grid/lines/" TreeLineImageWidth="19"
                                    TreeLineImageHeight="20" IndentCellWidth="22" GroupingNotificationPosition="BottomRight"
                                    GroupingNotificationTextCssClass="litContentTopHeader" GroupBySortAscendingImageUrl="sort_ascending.png"
                                    GroupBySortDescendingImageUrl="sort_descending.png" GroupBySortImageWidth="16"
                                    GroupBySortImageHeight="16" LoadingPanelClientTemplateId="c_gridSelectedItems_LoadingFeedbackTemplate"
                                    LoadingPanelPosition="MiddleCenter" LoadingPanelEnabled="true" Sort="Name" ManualPaging="false"
                                    Width="310" Height="425" BorderWidth="1" BorderStyle="Solid" EditOnClickSelectedItem="false"
                                    BorderColor="Gray" runat="server">
                                    <Levels>
                                        <ComponentArt:GridLevel DataKeyField="ID" ShowTableHeading="false" ShowSelectorCells="false"
                                            RowCssClass="Row" EditCommandClientTemplateId="EditCommandTemplate" ColumnReorderIndicatorImageUrl="reorder.gif"
                                            DataCellCssClass="DataCell" EditFieldCssClass="litGridEditField" HeadingCellCssClass="HeadingCell"
                                            HeadingCellHoverCssClass="HeadingCellHover" HeadingCellActiveCssClass="HeadingCellActive"
                                            HeadingRowCssClass="HeadingRow" HeadingTextCssClass="HeadingCellText" SelectedRowCssClass="Row"
                                            GroupHeadingCssClass="GroupHeading" SortAscendingImageUrl="sort_ascending.png"
                                            SortDescendingImageUrl="sort_descending.png" SortedHeadingCellCssClass="HeadingCellSorted" SortImageWidth="16" SortImageHeight="10">
                                            <Columns>
                                                <ComponentArt:GridColumn DataField="ID" Visible="false" />
                                                <ComponentArt:GridColumn DataField="ArticleNumber" Visible="true" HeadingText="ArticleNumber" />
                                                <ComponentArt:GridColumn DataField="DisplayName" Visible="true" HeadingText="Description" />
                                                <ComponentArt:GridColumn DataField="CurrentPrice" Visible="true" Align = "Right" HeadingText="CurrentPrice" />
                                                <ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="c_gridSelectedItems_DeleteTemplate"
                                                    Width="25" Align="Right" />
                                            </Columns>
                                        </ComponentArt:GridLevel>
                                    </Levels>
                                    <ClientTemplates>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_LoadingFeedbackTemplate">
                                            <table cellspacing="0" cellpadding="10" border="0" style="background-color: White;">
                                                <tr>
                                                    <td class="litText" style="padding-right: 3px;">
                                                        @Loading
                                                    </td>
                                                    <td style="padding-left: 3px;">
                                                        <img src="/LitiumStudio/Images/grid/spinner.gif" width="16" height="16" alt="" style="border: none;" />
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_SliderTemplate">
                                            <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td valign="top" style="padding: 5px;">
                                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                                            <tr>
                                                                <td>
                                                                    <table cellspacing="0" cellpadding="2" border="0" style="width: 255px;">
                                                                        <tr>
                                                                            <td>
                                                                                <div style="overflow: hidden; width: 115px;" class="litText">
                                                                                    <nobr>## DataItem.GetMember('ArticleNumber').Value ## - ## DataItem.GetMember('DisplayName').Value ##</nobr>
                                                                                </div>
                                                                            </td>
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
                                                                <td>
                                                                    @Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridSelectedItems.PageCount
                                                                        ##</b>
                                                                </td>
                                                                <td align="right">
                                                                    @Record&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridSelectedItems.RecordCount
                                                                        ##</b>
                                                                </td>
                                                            </tr>
                                                        </table>
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_PagerInfoTemplate">
                                            <table cellspacing="0" cellpadding="0" border="0">
                                                <tr>
                                                    <td class="GridFooterText">
                                                        @Page <b>## c_gridSelectedItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridSelectedItems.PageCount
                                                            ##</b> (## c_gridSelectedItems.RecordCount ## @Records)
                                                    </td>
                                                </tr>
                                            </table>
                                        </ComponentArt:ClientTemplate>
                                        <ComponentArt:ClientTemplate ID="c_gridSelectedItems_DeleteTemplate">
                                            <a href="#" onclick="deleteGridItem('## DataItem.ClientId ##');" title="## DeleteText ##">
                                                <img src="Images/transparent.gif" class="litIconArrowMoveLeft" border="0" alt="## DeleteText ##" /></a>
                                        </ComponentArt:ClientTemplate>
                                    </ClientTemplates>
                                </ComponentArt:Grid>
                            </td>
                        </tr>
                    </table>
                </td>
            </tr>
        </table>
    </div>
</asp:Content>
