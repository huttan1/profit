<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_ViewDelivery, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">

    <script type="text/javascript">
        function Grid_onLoad(sender, e) {
            sender.set_pageSize(sender.get_recordCount());
            sender.render();
        }
    </script>
    
    <ComponentArt:ToolBar ID="c_toolbarViewDelivery"
        OnItemCommand="c_toolbarViewDelivery_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">
        <ComponentArt:ToolBarItem ID="c_toolbarItemBack" runat="server" ImageUrl="icons_standard/arrow_left_blue_16px.png"
            AutoPostBackOnSelect = "true" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" />
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
     <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <span class="litContentTopHeader">
                <Foundation:ModuleString ID="c_moduleStringHeader" Name="Delivery" runat="server" />:<asp:Label runat="server" ID="c_labelHeader" class="litPageStatusHeaderV2"/></span> 
            </td>
        </tr>
    </table>     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">

        <table cellpadding="0" width="100%" cellspacing="0" border="0" style="padding-top:15px; padding-bottom: 15px; padding-left:15px;">        
            <tr>
                <td valign = "top" style="width: 260px;">
                    <Foundation:InformationGroup runat="server" ID="c_informationGroupDeliveryInfo" Width="250" HeaderText="PaymentInfo123">
                        <table>
                             <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryStatus" Name="DeliveryStatus" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelDeliveryStatus" runat="server" CssClass="litText"></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryMethod" Name="DeliveryMethod" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelDeliveryMethod" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryCost" Name="DeliveryCost" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelDeliveryCost" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryVATPercentage" Name="DeliveryVAT" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelDeliveryVATPercentage" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringDeliveryVATAmount" Name="DeliveryVATAmount" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelDeliveryVAT" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPromisedDeliveryDate" Name="PromisedDeliveryDate" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelPromisedDeliveryDate" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringComments" Name="DeliveryComments" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelDeliveryComments" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </Foundation:InformationGroup>                
                </td>
                <td valign = "top" style="width: 260px; padding-bottom: 10px;">
                    <Foundation:InformationGroup runat="server" ID="c_informationGroupDeliveryAddress" Width="250" HeaderText="Billing Address123">
                        <table>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCustomerName" Name="CustomerName" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelCustomerName" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringEmail" Name="Email" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelEmail" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddressRow1" Name="AddressRow1" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelAddressRow1" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddressRow2" Name="AddressRow2" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelAddressRow2" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringZip" Name="Zip" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelZip" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCity" Name="City" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelCity" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringState" Name="State" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelState" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCountry" Name="Country" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelCountry" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPhone" Name="Phone" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelPhone" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                             <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringFax" Name="Fax" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelFax" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMobile" Name="MobilePhone" Runat="server"/>:</div>
                                    <asp:Label ID="c_labelMobile" runat="server" CssClass="litText" ></asp:Label>
                                </td>
                            </tr>
                        </table>
                    </Foundation:InformationGroup>
                </td>
                <td valign = "top">
                    <div id="c_divAdditionalInfo" runat="server">
                        <Foundation:InformationGroup runat="server" ID="c_informationGroupAdditionalInfo" Width="250" HeaderText="DeliveryAdditionalInfo">
                            <asp:Repeater ID="c_repeaterAdditionalInfo" runat="server">
                                <ItemTemplate>
                                    <div class="litBoldHeader"><asp:Label ID="c_labelAdditionalInfoKey" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Key")%>'></asp:Label>:</div>
                                    <asp:Label ID="c_labelAdditionalInfoValue"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value")%>'></asp:Label>
                                </ItemTemplate>
                            </asp:Repeater>
                        </Foundation:InformationGroup>
                    </div>
                </td>
            </tr>
        </table>
        
        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
            <tr>
	            <td valign="top">
                   <ComponentArt:Grid id="c_gridOrderRows" runat="server"
	                    RunningMode="Client" 
                        CssClass="Grid"
                        ShowHeader="false"
                        ShowFooter="false"
                        ShowSearchBox="false"
                        SearchTextCssClass="SearchText"
                        SearchBoxPosition="TopRight"
                        SearchBoxCssClass="SearchBox"
                        SearchOnKeyPress="true"
                        AllowMultipleSelect="false"
                        HeaderCssClass="GridHeader" 
                        KeyboardEnabled="false"
                        FooterCssClass="GridFooter" 
                        GroupByCssClass="GroupByCell"
                        GroupByTextCssClass="GroupByText"
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
                        Height="50" 
                        ScrollBar="Auto"
                        >
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
                                    <ComponentArt:GridColumn DataField="OrderRowDescription" Width = "100" />
                                    <ComponentArt:GridColumn DataField="ArticleNumber" Width = "110" />
                                    <ComponentArt:GridColumn DataField="OrderRowStatus" Width = "100" Visible = "false" />
                                    <ComponentArt:GridColumn DataField="SKUCode" Width = "125" />
                                    <ComponentArt:GridColumn DataField="UnitListPrice" Width = "50" FormatString="N" Align ="Right" Visible="false" />
                                    <ComponentArt:GridColumn DataField="Quantity" Width = "65" FormatString="N" Align ="Right" />
                                    <ComponentArt:GridColumn DataField="TotalVATAmount" Width = "50" FormatString="N" Align ="Right" Visible="false" />
                                    <ComponentArt:GridColumn DataField="TotalDiscountAmount" Width = "50" FormatString="N" Align ="Right" Visible="false" />
                                    <ComponentArt:GridColumn DataField="RowTotal" Width = "80" FormatString="N" Align ="Right" />

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
                                                    <td>@Item&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridOrderRows.PageCount ##</b></td>
                                                    <td align="right">@Post&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## 
                                                        c_gridOrderRows.RecordCount ##</b></td>
                                                </tr>
                                            </table>  
                                        </td>
                                    </tr>
                                </table>
                            </ComponentArt:ClientTemplate>
                            <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                                <table cellspacing="0" cellpadding="0" border="0">
                                    <tr>
                                        <td class="GridFooterText">@Page <b>## c_gridOrderRows.CurrentPageIndex + 1 ##</b> @Of <b>
                                            ## c_gridOrderRows.PageCount ##</b> (## c_gridOrderRows.RecordCount ## @Items)</td>
                                    </tr>
                                </table>
                            </ComponentArt:ClientTemplate>
                        </ClientTemplates>
                        <ClientEvents>
                            <Load EventHandler="Grid_onLoad" />
                        </ClientEvents>
                    </ComponentArt:Grid>
	            </td>
            </tr>
        </table>
        
    </div>
</asp:Content>

