<%@ page language="C#" autoeventwireup="true" inherits="Modules_Common_SelectItemFromECommerce, Litum.Studio.Web" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-y:hidden;">
    <head>
        <title><Foundation:ModuleString ID="ModuleString1" Name="ECommerce" runat="server"/></title>
          <style type="text/css">
            .litTreeView td { padding:0px; }
            .litTreeView { position:relative; padding:0px;}
        </style>
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Foundation.css")%>" />
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Position.css")%>" />
	    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />
        <script type="text/javascript">
				//<![CDATA[
				var onCheckClick = false;
				var checkCount = 0;
				var selectMultiple = <%=SelectMultiple%>;
                
                getElementsByClassName = function(sender, className)
                {
                    var elements = [];
                    var myclass = new RegExp('\\b' + className + '\\b');
                    var elem = sender.getElementsByTagName('*');
                    
                    for (var i = 0, l = elem.length; i < l; i++)
                    {
                        var classes = elem[i].className;
                        
                        if (myclass.test(classes))
                        {
                            elements.push(elem[i]);
                        }
                    }
                    
                    return elements;
                };     
                
                 // returns the input text element used for searching
                function searchboxElement()
                {
                    return getElementsByClassName(document, 'SearchBox')[0];
                }
                        
                // returns the hidden element used for storing checked relations item ids
                function inputHiddenECommerceIDsElement()
                {
                    return document.getElementById('<%=c_inputHiddenECommerceIDs.ClientID%>');
                }
                
                // returns the hidden element used for storing checked relation item names
                function inputHiddenECommerceNamesElement()
                {
                    return document.getElementById('<%=c_inputHiddenECommerceNames.ClientID%>');
                }
                
                function CheckChange(sender, eventArgs)
				{
					onCheckClick = true;
				}
				function selectGridItem(sender, eventArgs)
				{
					checked = !eventArgs.get_item().get_cells()[1].get_value();
				    id = eventArgs.get_item().get_cells()[0].get_value();
				    name = eventArgs.get_item().get_cells()[2].get_value();
				    
					if (!onCheckClick) {
						eventArgs.get_item().SetValue(1,checked);
					} else {
						onCheckClick = false;
					}

					checked = eventArgs.get_item().get_cells()[1].get_value();
					if(checked) {
						checkCount++;
					} else{
						checkCount--;
					}
					<%=c_gridECommerceItems.ClientID%>.Render();
					if (selectMultiple)
					{
					    if (checked)
					        addItem(id, name);
					    else
   					        removeItem(id, name);
					}
					else
					{
					    inputHiddenECommerceIDsElement().value  = eventArgs.get_item().get_cells()[0].get_value()
					    inputHiddenECommerceNamesElement().value  = eventArgs.get_item().get_cells()[2].get_value()
                        resetCheckedVisibleItems(eventArgs.get_item().get_cells()[0].get_value());					    
                    }
				}
				
				function sortingChanged(sender, eventArgs) 
                {
                    // no need to pass any paramters as sort order and sorting column is automatically set 
                    // in the request object
                    onGridLoad();
                }
               
                function submitResult()
	            {
	                c_gridECommerceItems.set_webServiceCustomParameter('<%=PropertyID%>,' + inputHiddenECommerceIDsElement().value);
	                c_gridECommerceItems.set_webServiceSelectMethod("UpdateSessionData"); 
	                c_gridECommerceItems.webServiceSelect();
	            }
	            
               function onWebServiceComplete(sender, eventArgs) {
				    if(eventArgs.get_customParameter() != null && eventArgs.get_customParameter() == "reset")
				     c_gridECommerceItems.set_currentPageIndex(0);
                }
                       
                function onPageIndexChange(sender, eventArgs)
                {
                    // no need to set the current index as it is automatically set in the request object
                    onGridLoad();
                }

                function onGridLoad(includeDates)
                {
                    c_gridECommerceItems.set_webServiceCustomParameter(inputHiddenECommerceIDsElement().value);
                }                            
                
                function addItem(id, name)
				{
				    idString = inputHiddenECommerceIDsElement().value;
				    nameString = inputHiddenECommerceNamesElement().value;
				    if (idString && idString.length > 0)
				    {
				        if (idString.indexOf(id) < 0)
				        {
				            idString = idString + ',' + id + ',';
				            nameString = nameString + '#LITIUM#' + name + '#LITIUM#';
				        }
				    }
				    else
				    {
				        idString = id + ',';
				        nameString = name + '#LITIUM#' 
				    }
				    if (idString.length > 0)
				        idString = idString.substr(0, idString.length - 1);
				    if (nameString.length > 0)
				        nameString = nameString.substr(0, nameString.length -8);

                    inputHiddenECommerceIDsElement().value = idString;
				    inputHiddenECommerceNamesElement().value = nameString;
				}
				
				function removeItem(id, name)
				{
				    idString = inputHiddenECommerceIDsElement().value;
				    nameString = inputHiddenECommerceNamesElement().value;
				    if (idString && idString.length > 0)
				    {
				        idStringArray = idString.split(',');
				        nameStringArray = nameString.split('#LITIUM#');
				        for(var i=0; i < idStringArray.length; i++)
				        {
				            if (idStringArray[i] == id)
				            {
				               idStringArray[i] = '';
				               nameStringArray[i] = '';
				            }
				        }
				    }
				    newIdString = idStringArray.join(',');
				    newNameString = nameStringArray.join('#LITIUM#');
				     if (newIdString.length > 0)
				    {
				        if (newIdString.indexOf(',') == 0)
				           newIdString = newIdString.substr(1, newIdString.length - 1);
				        if (newIdString.lastIndexOf(',') == newIdString.length - 1)
				           newIdString = newIdString.substr(0, newIdString.length - 1);
				    }       
				    if (newNameString.length > 0)
				    {
				        if (newNameString.indexOf('#LITIUM#') == 0)
				            newNameString = newNameString.substr(8, newNameString.length - 8);
				        if (newNameString.lastIndexOf('#LITIUM#') == newNameString.length - 8)
				            newNameString = newNameString.substr(0, newNameString.length - 8);
				        
				    }
				    inputHiddenECommerceIDsElement().value = newIdString.replace(',,',',');
				    inputHiddenECommerceNamesElement().value = newNameString.replace('#LITIUM##LITIUM#','#LITIUM#');
				} 
	
				function resetCheckedVisibleItems(id)
                {
                    var gridItem;
                    var itemIndex = 0;
                    var searchTerm = searchboxElement().value;            
                    c_gridECommerceItems.beginUpdate();
                    while (gridItem = c_gridECommerceItems.get_table().getRow(itemIndex))
                    {
                        if (gridItem.get_cells()[1].get_value())
                        {
                            if (gridItem.get_cells()[0].get_value() != id)
                                gridItem.setValue(1, false);
                        }
                        itemIndex++;
                    }
                    c_gridECommerceItems.endUpdate();
                }
				//]]>
			</script>
    </head>
     <body class="litModalPopupBody">
            <form id="Form1" method="post" runat="server">
            <asp:ScriptManager ID="c_scriptManagerECommerce" runat="server">
                <Services>
                    <asp:ServiceReference path="ECommerceDataService.asmx" />
                </Services>
            </asp:ScriptManager>
     
 
            <ComponentArt:Grid id="c_gridECommerceItems" runat="server"
	                RunningMode="WebService" 
                    CssClass="Grid"
                    ShowHeader="true"
                    ShowFooter="true"
                    ShowSearchBox="true"
                    SearchTextCssClass="SearchText"
                    SearchBoxPosition="TopRight"
                    SearchBoxCssClass="SearchBox"
                    SearchOnKeyPress="false"
                    AllowMultipleSelect="false"
                    HeaderCssClass="GridHeader" 
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
                    WebService="ECommerceDataService"
                    WebServiceSelectMethod="GetProducts"
                    Height = "398"
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
                            <ComponentArt:GridColumn DataField="Checked" ColumnType="CheckBox" AllowEditing="True" AllowSorting="False" HeadingText=" " AllowReordering="False" FixedWidth="true" />
                            <ComponentArt:GridColumn DataField="DisplayName" AllowSorting="True" IsSearchable="true" />
                            </Columns>
                        </ComponentArt:GridLevel>
                    </Levels>
                    <ClientTemplates>
						<ComponentArt:ClientTemplate ID="Loading">						
						</ComponentArt:ClientTemplate>
                        <ComponentArt:ClientTemplate Id="SliderTemplateClient">
                            <table class="SliderPopup" cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td valign="top" style="padding:5px;">
                                        <table width="100%" cellspacing="0" cellpadding="0" border="0">
                                            <tr>
                                                <td>
                                                    <table cellspacing="0" cellpadding="2" border="0" style="width:255px;">
                                                        <tr>
                                                            <td><div style="overflow:hidden;width:135px;" class="litText"><nobr>## DataItem.GetMember(2).Value ##</nobr></div></td>
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
                                                <td>@Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridECommerceItems.PageCount ##</b></td>
                                                <td align="right">@Item&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridECommerceItems.RecordCount ##</b></td>
                                            </tr>
                                        </table>  
                                    </td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                        <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td class="GridFooterText">@Page <b>## c_gridECommerceItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridECommerceItems.PageCount ##</b> (## c_gridECommerceItems.RecordCount ## @Items)</td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                    </ClientTemplates>
                    <ClientEvents>
                        <WebServiceComplete EventHandler="onWebServiceComplete" />
                        <ItemSelect EventHandler="selectGridItem" />
                        <SortChange EventHandler="sortingChanged" />
                        <ItemCheckChange EventHandler="CheckChange" />
                        <PageIndexChange EventHandler="onPageIndexChange" />
                    </ClientEvents>
                </ComponentArt:Grid>
        <input type="hidden" runat="server" id="c_inputHiddenECommerceIDs" />
        <input type="hidden" runat="server" id="c_inputHiddenECommerceNames" />
      </form>
      </body>
</html>
    <script type="text/javascript" >
    //<![CDATA[
    // Image preloading
    var img1 = new Image();
    img1.src = '../../LitiumStudio/Images/grid/spinner.gif';
    //]]>    
    </script>
