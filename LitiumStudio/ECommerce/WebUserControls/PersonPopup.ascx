<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_PersonPopup, Litum.Studio.Web" %>

<script type="text/javascript">  

    // Data Binding Scripts: Start      
    function selectPersonGridItem(sender, eventArgs)
    {
        //toolbarItemAction('activate','1_0,1_1');    
        
    }
    function personSortingChanged(sender, eventArgs) 
    {
        if (eventArgs.get_descending() == true) {}
        else {}
    } 
    function onPersonLoad(sender, eventArgs)
    {
        c_personsGrid.webServiceSelect();
    }
    function filterPersonGrid(sender, eventArgs)
    {
        //c_ordersGrid.set_webServiceCustomParameter(c_calendarToDeliveryDate.getSelectedDate());
        //c_ordersGrid.webServiceSelect();
    } 
    function onPageIndexChange(sender, eventArgs)
    {
        // no need to set the current index as it is automatically set in the request object
        onPersonLoad(false);
    }
    //Data binding Scripts:End
    
    //******************************************************************************************
   
    //******************************************************************************************

</script>

<ComponentArt:Dialog 
    ContentCssClass="contentCss" FooterCssClass="footerCss" 
    HeaderCssClass="headerCss" CssClass="dialogCss" 
    Icon=""  Value="" HeaderClientTemplateId="header" 
    Title="AJAX TabStrip Content" ShowTransition="Pixelate" 
    CloseTransition="Pixelate" AnimationDuration="200" 
    ModalMaskCssClass="modalMaskCssClass" AllowDrag="true" 
    Alignment="MiddleCentre"  ID="c_dialogPersonPopup" runat="server" 
    Height="400" Width="510">
     <%-- <ClientEvents>
        <OnShow EventHandler="dialogshow" />
        <OnClose EventHandler="dialogclose" />
        <OnDrag EventHandler="dialogdrag" />
        <OnDrop EventHandler="dialogdrop" />
        <OnFocus EventHandler="dialogfocus" />
      </ClientEvents>--%>
      <ClientTemplates>
        <ComponentArt:ClientTemplate id="header">
              <table cellpadding="0" cellspacing="0" border = "0" width = "700px">
                
              </table>
          </ComponentArt:ClientTemplate>
      </ClientTemplates>
      <Content>
         <table cellpadding="0" cellspacing="0" border = "0" width="700">
            <tr bgcolor = "gray">                      
                    <td valign="middle" style="font-size:15px;font-family:Arial;font-weight:bold;">
                        <Foundation:ModuleString ID="c_moduleStringSelectPerson" Name="Person" Runat="server"/>
                    </td>
                    <td align="right"><img runat = "server" src="../Images/main_ecommerce_16px.png" onclick="c_dialogPersonPopup.Close();" /></td>                    
                </tr>
            <tr bgcolor = "gray">
                  <td style="font-size:12px;font-family:Arial;padding:10px;" colspan = "2">
                  <ComponentArt:Grid id="c_personsGrid" runat="server"
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
                    KeyboardEnabled="false"
                    FooterCssClass="GridFooter" 
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
                    WebService="RelationsService"
                    WebServiceSelectMethod="GetAllPersons"
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
                            <ComponentArt:GridColumn HeadingText="First Name" DataField="FirstName" />
                            <ComponentArt:GridColumn HeadingText="Last Name" DataField="LastName" />
                            <ComponentArt:GridColumn HeadingText="Email" DataField="Email" />
                            <%--<ComponentArt:GridColumn DataField="ID" Visible="false" />
                            <ComponentArt:GridColumn HeadingText="Order Id" DataField="OrderID" />
                            <ComponentArt:GridColumn HeadingText="Customer Number" DataField="CustomerNumber" />
                            <ComponentArt:GridColumn HeadingText="First Name" DataField="FirstName" />
                            <ComponentArt:GridColumn HeadingText="Last Name" DataField="LastName" />--%>
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
                                                <td>@Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_personsGrid.PageCount ##</b></td>
                                                <td align="right">@Post&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## 
                                                    c_personsGrid.RecordCount ##</b></td>
                                            </tr>
                                        </table>  
                                    </td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                        <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td class="GridFooterText">@Page <b>## c_personsGrid.CurrentPageIndex + 1 ##</b> @Of <b>
                                        ## c_personsGrid.PageCount ##</b> (## c_personsGrid.RecordCount ## @Persons)</td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                    </ClientTemplates>
                    <ClientEvents>
                        <SortChange EventHandler="personSortingChanged" />
                        <ItemSelect EventHandler="selectPersonGridItem" />
                        <Load EventHandler="onPersonLoad" />
                        <PageIndexChange EventHandler="onPersonLoad" />
                    </ClientEvents>
                </ComponentArt:Grid>
                  </td>
       </tr>
            <tr bgcolor ="gray">
                <td align="right" colspan = "2" width = "100%" >
                    <input id="Button1" type = "button" runat = "server" onclick = "c_dialogPersonPopup.Close();" value = "Cancel" />
                    <asp:Button  CssClass="litInputButton" ID="c_buttonOk" runat="server" OnClick = "c_buttonOk_Click" Text="Ok"  CausesValidation = "false" />
                    <%--<asp:Button ID="Button2" runat="server" Text="Ok"  CausesValidation = "false" />--%>
                </td>
            </tr>
    </table>
      </Content>
</ComponentArt:Dialog>