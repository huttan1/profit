<%@ page language="C#" autoeventwireup="true" inherits="Modules_Common_SelectItemFromProductCatalog, Litum.Studio.Web" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-y:hidden;">
    <head>
        <title><Foundation:ModuleString ID="ModuleString1" Name="ProductCatalog" runat="server"/></title>
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Foundation.css")%>" />
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Position.css")%>" />
	    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />
        <style type="text/css">
            .litTreeView td { padding:0px; }
            .litTreeView { position:relative; padding:0px;}            
            .litImgAlign img
            {
                margin-left: 40%;
            }
        </style>

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
                
                // returns the hidden element used for storing checked product catalog item extra ids
                function inputHiddenProductCatalogExtraIDsElement()
                {
                    return document.getElementById('<%=c_inputHiddenProductCatalogExtraIDs.ClientID%>');
                }
                
                // returns the hidden element used for storing checked product catalog item ids
                function inputHiddenProductCatalogIDsElement()
                {
                    return document.getElementById('<%=c_inputHiddenProductCatalogIDs.ClientID%>');
                }
                
                // returns the hidden element used for storing checked product catalog extra infos
                function inputHiddenProductCatalogExtraInfosElement()
                {
                    return document.getElementById('<%=c_inputHiddenProductCatalogExtraInfos.ClientID%>');
                }
                
                // returns the hidden element used for storing checked product catalog item names
                function inputHiddenProductCatalogNamesElement()
                {
                    return document.getElementById('<%=c_inputHiddenProductCatalogNames.ClientID%>');
                }
                
                // returns the hidden element used for storing the selected product catalog language id
                function inputHiddenProductCatalogSelectedLanguageElement()
                {
                    return document.getElementById('<%=c_inputHiddenProductCatalogSelectedLanguage.ClientID%>');
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
				    extraID = eventArgs.get_item().get_cells()[9].get_value()
				    articleID =  eventArgs.get_item().get_cells()[3].get_value();
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
					<%=c_gridProductCatalogItems.ClientID%>.Render();
					if (selectMultiple)
					{
					        if (checked)
					            addItem(id, name, extraID, articleID);
					        else
   					            removeItem(id);
					}
					else
					{
					        inputHiddenProductCatalogIDsElement().value  = id;
					        if (extraID != '<%=Guid.Empty.ToString()%>')
					            inputHiddenProductCatalogNamesElement().value  = articleID;
					        else
					            inputHiddenProductCatalogNamesElement().value  = name;    
					        inputHiddenProductCatalogExtraIDsElement().value = extraID;
					        inputHiddenProductCatalogExtraInfosElement().value = name;
                            resetCheckedVisibleItems(eventArgs.get_item().get_cells()[0].get_value());					    
                    }
				}
				
				function addItem(id, name, extraID, articleID)
				{
				    idString = inputHiddenProductCatalogIDsElement().value;
				    nameString = inputHiddenProductCatalogNamesElement().value;
				    extraIDString = inputHiddenProductCatalogExtraIDsElement().value;
				    extraInfoString = inputHiddenProductCatalogExtraInfosElement().value;
				    currentName = name;
				    if (extraID != '<%=Guid.Empty.ToString()%>')
				        currentName = articleID;
				    added = false;
				    if (idString && idString.length > 0)
				    {
    				    if (idString.indexOf(id) < 0)
				        {
				            idString = idString + ',' + id + ',';
				            nameString = nameString + '#LITIUM#' + currentName + '#LITIUM#';
				            if (extraID != '<%=Guid.Empty.ToString()%>')
				            {
				                extraIDString = extraIDString + ',' + extraID + ',';
				                extraInfoString  = extraInfoString + '#LITIUM#' + name + '#LITIUM#';
				            }
				            added = true;
				        }
				    }
				    else
				    {
				        idString = id + ',';
				        nameString = currentName + '#LITIUM#';
				        if (extraID != '<%=Guid.Empty.ToString()%>')
				        {
				            extraIDString = extraID + ',';
				            extraInfoString = name + '#LITIUM#';
				        }
				        added = true;
			        }
			        if (added)
			        {
				        if (idString.length > 0)
				            idString = idString.substr(0, idString.length - 1);
				        if (nameString.length > 0)
				            nameString = nameString.substr(0, nameString.length -8);
                        if (extraIDString.length > 0)
                            extraIDString = extraIDString.substr(0, extraIDString.length -1);        
                        if (extraInfoString.length > 0)
                            extraInfoString = extraInfoString.substr(0, extraInfoString.length -8);        
                        
                        inputHiddenProductCatalogIDsElement().value = idString;
				        inputHiddenProductCatalogNamesElement().value = nameString;
				        inputHiddenProductCatalogExtraIDsElement().value = extraIDString;
				        inputHiddenProductCatalogExtraInfosElement().value = extraInfoString;
				    }
				}
				
				function removeItem(id)
				{
				    idString = inputHiddenProductCatalogIDsElement().value;
				    nameString = inputHiddenProductCatalogNamesElement().value;
				    extraIDString = inputHiddenProductCatalogExtraIDsElement().value;
				    extraInfoString = inputHiddenProductCatalogExtraInfosElement().value;
				    if (idString && idString.length > 0 && idString.indexOf(id) > -1)
				    {
				        idStringArray = idString.split(',');
				        nameStringArray = nameString.split('#LITIUM#');
				        extraIDStringArray = extraIDString.split(',');
				        extraInfoStringArray = extraInfoString.split('#LITIUM#');
				        for(var i=0; i < idStringArray.length; i++)
				        {
				            if (idStringArray[i] == id)
				            {
				               idStringArray[i] = '';
				               nameStringArray[i] = '';
				               if (extraIDStringArray.length > 0)
				               {
				                extraIDStringArray[i] = '';
				                extraInfoStringArray[i] = ''; 
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
				        var newExtraIDString;
				        var newExtraInfoString;
				        if (extraIDStringArray.length > 0)
				        {
				            newExtraIDString = extraIDStringArray.join(',');
				            newExtraInfoString = extraInfoStringArray.join('#LITIUM#');
				            if (newExtraIDString.length > 0)
				            {
				                if (newExtraIDString.indexOf(',') == 0)
				                   newExtraIDString = newExtraIDString.substr(1, newExtraIDString.length - 1);
				                if (newExtraIDString.lastIndexOf(',') == newExtraIDString.length - 1)
				                   newExtraIDString = newExtraIDString.substr(0, newExtraIDString.length - 1);
				            }       
				            if (newExtraInfoString.length > 0)
				            {
				                if (newExtraInfoString.indexOf('#LITIUM#') == 0)
				                    newExtraInfoString = newExtraInfoString.substr(8, newExtraInfoString.length - 8);
				                if (newExtraInfoString.lastIndexOf('#LITIUM#') == newExtraInfoString.length - 8)
				                    newExtraInfoString = newExtraInfoString.substr(0, newExtraInfoString.length - 8);
        				        
				            }
    				    }           
    			        inputHiddenProductCatalogIDsElement().value = newIdString.replace(',,',',');
				        inputHiddenProductCatalogNamesElement().value = newNameString.replace('#LITIUM##LITIUM#','#LITIUM#');
				        if (extraIDStringArray.length > 0)
				        {
				            inputHiddenProductCatalogExtraIDsElement().value = newExtraIDString.replace(',,',',');
				            inputHiddenProductCatalogExtraInfosElement().value = newExtraInfoString.replace('#LITIUM##LITIUM#','#LITIUM#');
				        }
				    }
				}
				
				function onWebServiceComplete(sender, eventArgs) {
				    if(eventArgs.get_customParameter() != null && eventArgs.get_customParameter() == "reset")
				     c_gridProductCatalogItems.set_currentPageIndex(0);
				    // checkIfSelectedItemIsRegistred();
                }

				function onLanguageChanged(selectLanguage)
				{
				    inputHiddenProductCatalogSelectedLanguageElement().value = selectLanguage.value;
				    onGridLoad();
				    c_gridProductCatalogItems.webServiceSelect();
				}
				
				function sortingChanged(sender, eventArgs) 
                {
                    // no need to pass any paramters as sort order and sorting column is automatically set 
                    // in the request object
                    onGridLoad();
                }
                      
                function onPageIndexChange(sender, eventArgs)
                {
                    // no need to set the current index as it is automatically set in the request object
                    onGridLoad();
                }

                function onGridLoad()
                {
                    c_gridProductCatalogItems.set_webServiceCustomParameter(inputHiddenProductCatalogSelectedLanguageElement().value 
                        + ',<%=ShowUnpublishedItem%>,' + inputHiddenProductCatalogIDsElement().value + '^<%=ShowOnlyPricedItems%>,<%=CurrencyID%>');
                }                             
	
	            function submitResult()
	            {
	                c_gridProductCatalogItems.set_webServiceCustomParameter('<%=PropertyID%>,' + inputHiddenProductCatalogIDsElement().value + '^' + inputHiddenProductCatalogExtraIDsElement().value);
	                c_gridProductCatalogItems.set_webServiceSelectMethod("UpdateSessionData"); 
	                c_gridProductCatalogItems.webServiceSelect();
	            }
				
				function resetCheckedVisibleItems(id)
                {
                    var gridItem;
                    var itemIndex = 0;
                    var searchTerm = searchboxElement().value;            
                    c_gridProductCatalogItems.beginUpdate();
                    while (gridItem = c_gridProductCatalogItems.get_table().getRow(itemIndex))
                    {
                           if (gridItem.get_cells()[1].get_value())
                            {
                                if (gridItem.get_cells()[0].get_value() != id)
                                    gridItem.setValue(1, false);
                            }
                            var nextItemIndex = 0;
                            var nextGridItem;
                            if (gridItem.get_childTable())
                            {
                                while(nextGridItem = gridItem.get_childTable().getRow(nextItemIndex))
                                {
                                    if (nextGridItem.get_cells()[1].get_value())
                                    {
                                        if (nextGridItem.get_cells()[0].get_value() != id)
                                            nextGridItem.setValue(1, false);
                                    }
                                    nextItemIndex++;
                                }
                            }
                        
                        itemIndex++;
                    }
                    c_gridProductCatalogItems.endUpdate();
                }
                /*
                function checkIfSelectedItemIsRegistred()
                {
                    var gridItem;
                    var itemIndex = 0;
                    while (gridItem = c_gridProductCatalogItems.get_table().getRow(itemIndex))
                    {
                        checked = gridItem.get_cells()[1].get_value();
				        id = gridItem.get_cells()[0].get_value();
				        name = gridItem.get_cells()[2].get_value();
				        extraID = gridItem.get_cells()[9].get_value()
				        articleID =  gridItem.get_cells()[3].get_value();
				        if (checked)
				            addItem(id, name, extraID, articleID);
					    itemIndex++;
                    }
                }
                */
				//]]>
				</script>
    </head>
 <body class="litModalPopupBody">
    <form id="Form1" method="post" runat="server">
    <asp:ScriptManager ID="c_scriptManagerProductCatalog" runat="server">
        <Services>
          <asp:ServiceReference
             path="ProductCatalogDataService.asmx" />
        </Services>
    </asp:ScriptManager>
    <asp:PlaceHolder runat="server" ID="c_pcInstalled">
                        
                
           <div style="position:absolute; height:460px; overflow-y:auto; overflow-x:hidden; width:700px;">               
                
                <div style="position:relative; margin-top:-19px;height: 368px;">                
                    
                    <div style="position:relative; width:215px; top:25px; left: 5px;">
					   <asp:Label CssClass="litBoldText" ID="c_labelLanguage" runat="server"/>:&nbsp;<select ID="c_selectLanguage" runat="server" Class="litInputSelect" Style="width: auto;"
						     onchange="onLanguageChanged(this)"></select> 
				    </div>
				    
                <ComponentArt:Grid id="c_gridProductCatalogItems" runat="server"
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
                    DataAreaCssClass="GridDataAreaDialog"
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
                    TreeLineImageWidth="0" 
                    TreeLineImageHeight="28" 
                    IndentCellWidth="1" 
                    IndentCellCssClass=" "
                    GroupingNotificationTextCssClass="litContentTopHeader"
                    GroupBySortAscendingImageUrl="sort_ascending.png"
                    GroupBySortDescendingImageUrl="sort_descending.png"
                    GroupBySortImageWidth="16"
                    GroupBySortImageHeight="16"
                    LoadingPanelClientTemplateId="LoadingFeedbackTemplate"
                    LoadingPanelPosition="MiddleCenter"
                    LoadingPanelEnabled="true"
                    ManualPaging="false"
                    WebService="ProductCatalogDataService"
                    WebServiceSelectMethod="GetProducts"
                    Height = "400"
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
                            <ComponentArt:GridColumn DataField="Checked" ColumnType="CheckBox" AllowEditing="True" AllowSorting="False" HeadingText=" " AllowReordering="False" Width="40" FixedWidth="true" />
                            <ComponentArt:GridColumn DataField="DisplayName" IsSearchable="true" AllowSorting="True" Width = "150" />
                            <ComponentArt:GridColumn DataField="ArticleNumber" IsSearchable="true" Width="105" FixedWidth="true"/>
                            <ComponentArt:GridColumn DataField="Location" AllowSorting="false" Width = "150"/>
                            <ComponentArt:GridColumn DataField="IsPublished" AllowSorting="false" Width="30" FixedWidth="false" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/ok.png" HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="PublishedItemCount" AllowSorting="false" Width="30" FixedWidth="false" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/ok.png"  HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="UnpublishedItemCount" AllowSorting="false" Width="30" FixedWidth="false" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/ps_unpubl2_16px.png"  HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="GroupCount" Width="30" AllowSorting="false" FixedWidth="true" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/folder_closed.png"  HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="ExtraID" Visible="false" />
                            </Columns>
                        </ComponentArt:GridLevel>
                        <ComponentArt:GridLevel
                            DataMember = "Variants"
                            ShowHeadingCells="false"
                            DataKeyField="ID"
                            ShowTableHeading="false" 
                            ShowSelectorCells="false" 
                            RowCssClass="Row" 
                            ColumnReorderIndicatorImageUrl="reorder.gif"
                            DataCellCssClass="DataCell" 
                            HeadingCellCssClass="   " 
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
                            <ComponentArt:GridColumn DataField="Checked" ColumnType="CheckBox" AllowEditing="True"  Width="40"/>
                            <ComponentArt:GridColumn DataField="DisplayName" IsSearchable="true" AllowSorting="True" />
                            <ComponentArt:GridColumn DataField="ArticleNumber" IsSearchable="true" Width="100" FixedWidth="true"/>
                            <ComponentArt:GridColumn DataField="Location" AllowSorting="false" Width="150"/>
                            <ComponentArt:GridColumn DataField="IsPublished" AllowSorting="false" Width="30" FixedWidth="true" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/folder_closed_published.png" HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="PublishedItemCount" AllowSorting="false" Width="30" FixedWidth="true" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/folder_closed_published.png" HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="UnpublishedItemCount" AllowSorting="false" Width="30" FixedWidth="true" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/folder_closed_unpublished.png" HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="GroupCount" Width="30" AllowSorting="false" FixedWidth="true" Align="Center" HeadingImageUrl="~/LitiumStudio/Images/icons_standard/earth2.png" HeadingCellCssClass="litImgAlign"/>
                            <ComponentArt:GridColumn DataField="ExtraID" Visible="false" />
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
                                                <td>@Page&nbsp;<b>## DataItem.PageIndex + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridProductCatalogItems.PageCount ##</b></td>
                                                <td align="right">@Item&nbsp;<b>## DataItem.Index + 1 ##</b>&nbsp;@Of&nbsp;<b>## c_gridProductCatalogItems.RecordCount ##</b></td>
                                            </tr>
                                        </table>  
                                    </td>
                                </tr>
                            </table>
                        </ComponentArt:ClientTemplate>
                        <ComponentArt:ClientTemplate ID="PagerInfoTemplate">
                            <table cellspacing="0" cellpadding="0" border="0">
                                <tr>
                                    <td class="GridFooterText">@Page <b>## c_gridProductCatalogItems.CurrentPageIndex + 1 ##</b> @Of <b>## c_gridProductCatalogItems.PageCount ##</b> (## c_gridProductCatalogItems.RecordCount ## @Items)</td>
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
                </ComponentArt:Grid></div></div>
                </asp:PlaceHolder>
                <asp:Panel runat="server" ID="c_panelNotInstalled" Visible="false">
                    <script type="text/javascript">
                        window.parent.document.getElementById("c_buttonAddProductCatalog").disabled = "disabled";
                    </script>
                    <asp:Label runat="server" id="c_error" />
                </asp:Panel>
        <input type="hidden" runat="server" id="c_inputHiddenProductCatalogIDs" />
        <input type="hidden" runat="server" id="c_inputHiddenProductCatalogExtraIDs" />
        <input type="hidden" runat="server" id="c_inputHiddenProductCatalogExtraInfos" />
        <input type="hidden" runat="server" id="c_inputHiddenProductCatalogNames" />
        <input type="hidden" runat="server" id="c_inputHiddenProductCatalogSelectedLanguage" />
      </form>
      </body>
</html>
    <script type="text/javascript" language="javascript">
    //<![CDATA[
    // Image preloading
    var img1 = new Image();
    img1.src = '../../LitiumStudio/Images/grid/spinner.gif';
    //]]>    
    </script>
