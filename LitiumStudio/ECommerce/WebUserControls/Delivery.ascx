<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_Delivery, Litum.Studio.Web" %>
    <div class="lsContentScroll2" style="height :100%; padding-right: 0px; padding-left: 0px;">
    <table cellpadding="0" cellspacing="0" border="0" style="width: 100%; height: 100%;">
        <tr>
	        <td valign="top">
               <ComponentArt:Grid id="c_gridDeliveries" runat="server"
                    AllowMultipleSelect="false"
	                RunningMode="Client" 
                    CssClass="Grid"
                    ShowHeader="true"
                    ShowFooter="true"
                    ShowSearchBox="false"
                    SearchTextCssClass="SearchText"
                    SearchBoxPosition="TopRight"
                    SearchBoxCssClass="SearchBox"
                    SearchOnKeyPress="true"
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
                            <ComponentArt:GridColumn 
                                AllowSorting="False" 
                                DataType="System.Boolean" 
                                DataField="Selecter" 
                                FixedWidth="true" 
                                AllowReordering="False" 
                                ColumnType="CheckBox"
                                AllowEditing="True"
                                HeadingText=" "
                                Width="15"
                                />
                                <ComponentArt:GridColumn DataField="ID" Visible="false"/>
                                <ComponentArt:GridColumn DataField="DeliveryStatus" Visible="false"/>
                                <ComponentArt:GridColumn DataField="Status" Width = "50" />
                                <ComponentArt:GridColumn DataField="PromisedDeliveryDate" Width = "100" />
                                <ComponentArt:GridColumn DataField="DeliveryMethod"  Width = "150"/>
                                <ComponentArt:GridColumn DataField="DeliveryVAT" FormatString="N" Align ="Right"  Width = "80"/>
                                <ComponentArt:GridColumn DataField="TotalDeliveryCost" FormatString="N" Align ="Right"  Width = "80"/>
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
                                                    <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                        <tr>
                                                            <td><div style="overflow:hidden;width:115px;" class="litText"><nobr>## 
                                                                DataItem.GetMember(2).Value ##</nobr></div></td>
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
                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                            <tr>
                                                <td>@Item&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridDeliveries.PageCount ##</b></td>
                                                <td align="right">@Post&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## 
                                                    c_gridDeliveries.RecordCount ##</b></td>
                                            </tr>
                                        </table>  
                                    </td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                        <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td class="GridFooterText">@Page <b>## c_gridDeliveries.CurrentPageIndex + 1 ##</b> @Of <b>
                                        ## c_gridDeliveries.PageCount ##</b> (## c_gridDeliveries.RecordCount ## @Items)</td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                    </ClientTemplates>
                    <ClientEvents>
                        <ItemSelect EventHandler = "onItemSelect" />
                        <ItemCheckChange EventHandler="onCheckChange" />
                    </ClientEvents>
                </ComponentArt:Grid>
	        </td>
        </tr>
    </table>
    <asp:HiddenField id="c_hiddenFieldCurrencyCode" runat="server"/>
</div>