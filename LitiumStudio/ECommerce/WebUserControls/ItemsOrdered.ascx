<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_ItemsOrdered, Litum.Studio.Web" %>
    <div class="lsContentScroll2" style="height: 100%; padding-left: 0px; padding-right: 0px;">
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 100%;">
        <tr>
	        <td valign="top">
               <ComponentArt:Grid id="c_orderRowsGrid" runat="server"
	                RunningMode="Client" 
                    CssClass="Grid"
                    ShowHeader="true"
                    ShowFooter="true"
                    ShowSearchBox="false"
                    SearchTextCssClass="SearchText"
                    SearchBoxPosition="TopRight"
                    SearchBoxCssClass="SearchBox"
                    SearchOnKeyPress="true"
                    AllowMultipleSelect="false" 
                    HeaderCssClass="GridHeader" 
                    DataAreaCssClass="GridData GridTabData"
                    KeyboardEnabled="false"
                    FooterCssClass="GridFooterTab" 
                    GroupByCssClass="GroupByCell"
                    GroupByTextCssClass="GroupByText"
                    PageSize="10" 
                    PagerStyle="Slider" 
                    PagerPosition="BottomLeft"
                    PagerInfoPosition="BottomRight"
                    PagerInfoClientTemplateId="PagerInfoTemplate"
                    PagerTextCssClass="litContentInfo"
                    PagerButtonWidth="18"
                    PagerButtonHeight="18"
                    SliderHeight="18"
                    SliderWidth="150" 
                    SliderGripWidth="9" 
                    SliderPopupOffsetX="20"
                    SliderPopupClientTemplateId="SliderTemplateClient" 
                    PreExpandOnGroup="true"
                    ImagesBaseUrl="~/LitiumStudio/Images/grid/" 
                    PagerImagesFolderUrl="~/LitiumStudio/Images/grid/pager/"
                    TreeLineImageWidth="22" 
                    TreeLineImageHeight="19" 
                    IndentCellWidth="22" 
                    GroupingNotificationTextCssClass="litContentTopHeader"
                    GroupBySortAscendingImageUrl="sort_ascending.png"
                    GroupBySortDescendingImageUrl="sort_descending.png"
                    GroupBySortImageWidth="16"
                    GroupBySortImageHeight="16"
                    LoadingPanelClientTemplateId="LoadingFeedbackTemplate"
                    LoadingPanelPosition="MiddleCenter"
                    LoadingPanelEnabled="true"
                    ManualPaging="false"
                    Width="100%"
                    Height="100%"
                    >
                    <Levels>
                        <ComponentArt:GridLevel
                            DataKeyField="ID"
                            ShowTableHeading="false" 
                            ShowSelectorCells="false" 
                            RowCssClass="Row" 
                            ColumnReorderIndicatorImageUrl="reorder.gif"
                            DataCellCssClass="DataCell DataCellBig" 
                            HeadingCellCssClass="HeadingCell HeadingCellBig" 
                            HeadingCellHoverCssClass="HeadingCellHover" 
                            HeadingCellActiveCssClass="HeadingCellActive" 
                            HeadingRowCssClass="HeadingRow" 
                            HeadingTextCssClass="HeadingCellText HeadingCellTextBig"
                            SelectedRowCssClass="SelectedRow"
                            HoverRowCssClass="HoverRow"
                            GroupHeadingCssClass="GroupHeading" 
                            SortAscendingImageUrl="sort_ascending.png" 
                            SortDescendingImageUrl="sort_descending.png" 
                            SortedHeadingCellCssClass="HeadingCellSorted"
                            SortImageWidth="16" 
                            SortImageHeight="10">
                            <Columns>
                                <ComponentArt:GridColumn DataField="ID" Visible="false" />
                                <ComponentArt:GridColumn DataField="ArticleNumber" width="150" />
                                <ComponentArt:GridColumn DataField="OrderRowDescription" width="200" />
                                <ComponentArt:GridColumn DataField="UnitListPrice" FormatString="N" Align="Right"  width="60" />
                                <ComponentArt:GridColumn DataField="UnitCampaignPrice" FormatString="N" Align="Right" width="120" />
                                <ComponentArt:GridColumn DataField="Quantity"  Align="Right" width="60" />
                                <ComponentArt:GridColumn DataField="TotalDiscountAmount" FormatString="N" Align="Right" width="50" />
                                <ComponentArt:GridColumn DataField="TotalPrice" FormatString="N" Align="Right" width="70" />
                                <ComponentArt:GridColumn DataField="FormatedVatPercentage" Align="Right" width="90" />
                                <ComponentArt:GridColumn DataField="TotalVATAmount" FormatString="N" Align="Right" width="50" />
                            </Columns>
                        </ComponentArt:GridLevel>
                    </Levels>
                    <ClientTemplates>
                        <ComponentArt:ClientTemplate Id="SliderTemplateClient">
                            <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td valign="top" style="padding:5px;">
                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                            <tr>
                                                <td>
                                                    <table id="eee" cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                        <tr>
                                                            <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## 
                                                                DataItem.GetMember(2).Value ## </nobr></div></td>
                                                            <td><div style="overflow:hidden;width:135px;" class="litText"><nobr>## 
                                                                DataItem.GetMember(3).Value ##</nobr></div></td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td class="SliderBottom">
                                        <table width="100%" cellspacing="0" id="dddd" cellpadding="0" border="0" >
                                            <tr>
                                                <td>@Item&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_orderRowsGrid.PageCount ##</b></td>
                                                <td align="right">@Post&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## 
                                                    c_orderRowsGrid.RecordCount ##</b></td>
                                            </tr>
                                        </table>  
                                    </td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                        <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td class="GridFooterText">@Page <b>## c_orderRowsGrid.CurrentPageIndex + 1 ##</b> @Of <b>
                                        ## c_orderRowsGrid.PageCount ##</b> (## c_orderRowsGrid.RecordCount ## @Items)</td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                    </ClientTemplates>
                    <ClientEvents>
                        <ItemSelect EventHandler = "onItemSelect" />
                    </ClientEvents>
                </ComponentArt:Grid>
	        </td>
        </tr>
    </table>
    <asp:HiddenField id="c_hiddenFieldCurrencyCode" runat="server"/>
</div>