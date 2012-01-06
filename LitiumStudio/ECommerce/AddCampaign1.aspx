<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_AddCampaign1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>
<%@ Register TagPrefix="Relations" TagName="RelationsDialog" src="~/LitiumStudio/WebUserControls/RelationsDialog.ascx" %>
<%@ Register TagPrefix="ProductCatalog" TagName="ProductCatalogDialog" src="~/LitiumStudio/WebUserControls/ProductCatalogDialog.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">

    <ComponentArt:ToolBar ID="c_toolbarAddCampaign" AutoPostBackOnSelect="true" 
        OnItemCommand="c_toolbarAddCampaign_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem ID="c_toolbarItemCancel" runat="server" ImageUrl="icons_standard/sign_stop.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="c_toolbarItemNext" runat="server" ImageUrl="icons_standard/arrow_right_blue_16px.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonDropDownTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;"/>
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
                <span class="litContentTopHeader"><img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" class="litIconShoppingBag" />
			    <Foundation:ModuleString ID="c_moduleStringAddCampaign" Name="AddCampaign1" runat="server" /></span>  
            </td>
        </tr>
    </table>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
   <Telerik:RadScriptBlock ID="dd" runat="server">
	<script type="text/javascript">

		addEvent(window, "load", onCampaignTypeChanged);

		function validateDateSelection()
		{
			var isValid = true;
			var fromDate = c_calendarFromDate.getSelectedDate();
			var toDate = c_calendarToDate.getSelectedDate();
			if (fromDate != null && toDate != null)
			{
				if(fromDate > toDate)
				{
					isValid = false;
				}
			}
			return isValid;
		}
		
		function onDateSelection()
		{
			if (validateDateSelection())
			{
				if (document.getElementById("<% Response.Write(c_leftErrorPanel.ClientID); %>"))
				{
					document.getElementById("<% Response.Write(c_leftErrorPanel.ClientID); %>").style.display = 'none';
				}
			}
			else
			{
				if (document.getElementById("<% Response.Write(c_leftErrorPanel.ClientID); %>"))
				{
					document.getElementById("<% Response.Write(c_leftErrorPanel.ClientID); %>").style.display = 'inline';
				}
			}
		}		
	      
		function onFromDateSelectionChanged(sender, eventArgs)
		{
			var fromDate = '';
			if (sender.getSelectedDate() != null) 
			{
				fromDate = sender.formatDate(sender.getSelectedDate(),
					document.getElementById("<% Response.Write(c_hiddenFieldDateTimeFormat.ClientID); %>").value);
			}
		}
	    
		function onToDateSelectionChanged(sender, eventArgs)
		{
			var toDate = '';
			if (sender.getSelectedDate() != null) 
			{
				toDate = sender.formatDate(sender.getSelectedDate(),
					document.getElementById("<% Response.Write(c_hiddenFieldDateTimeFormat.ClientID); %>").value);
			}
		}
		
		function onCampaignTypeChanged() {
		    
            var selectedCampignType = document.getElementById("<% Response.Write(c_dropDownListCampaignType.ClientID); %>").value;
            if(selectedCampignType != '')
            {
                PageMethods.GetCampaignTypeDetails(selectedCampignType, callMethod_Success, callMethod_Failure);
                PageMethods.GetCampaignTypeDescription(selectedCampignType, callMethod_Success, callMethod_Failure);
            }
		}

        function callMethod_Success(results, userContext, methodName) 
        {
            if (methodName == 'GetCampaignTypeDetails')
            {
                showHideExtraInfo(results);
            }
            else if (methodName == 'GetCampaignTypeDescription') 
            {
            	$("#TextBoxCampaignTypeDescription").html(results);
            }
        }
        
        function showHideExtraInfo(results)
        {
            var typeDetails = new Array();
            typeDetails = results.split(',');
                           
            if(typeDetails[0] == 'True')
            {
                document.getElementById("<% Response.Write(divArticles.ClientID); %>").style.display = "inline";
            }
            else
            {
                document.getElementById("<% Response.Write(divArticles.ClientID); %>").style.display = "none";
            }
            
            if(typeDetails[1] == 'True')
            {
                document.getElementById("<% Response.Write(divProductGroups.ClientID); %>").style.display = "inline";
            }
            else
            {
                document.getElementById("<% Response.Write(divProductGroups.ClientID); %>").style.display = "none";
                document.getElementById("<% Response.Write(c_hiddenFieldProductGroups.ClientID); %>").value = '';
            }
             
            if(typeDetails[2] == 'True')
            {
                document.getElementById("<% Response.Write(divProductCatalogs.ClientID); %>").style.display = "inline";
            }
            else
            {
                document.getElementById("<% Response.Write(divProductCatalogs.ClientID); %>").style.display = "none";
                document.getElementById("<% Response.Write(c_hiddenFieldProductCatalogs.ClientID); %>").value = '';
            }
            
            if(typeDetails[3] == 'True')
            {
                document.getElementById("<% Response.Write(divGroups.ClientID); %>").style.display = "inline";
            }
            else
            {
                document.getElementById("<% Response.Write(divGroups.ClientID); %>").style.display = "none";
                document.getElementById("<% Response.Write(c_hiddenFieldGroups.ClientID); %>").value = '';
            }
        }
        
        function callMethod_Failure(errors, userContext, methodName) 
        {
            alert(errors.get_message());
        }

   
	</script></Telerik:RadScriptBlock>
	<div class="lsContentScroll">
	<table border="0" cellspacing="0" >
		<tr valign="top">
			<td>
			    <div style="padding-right: 15px;">
				<Foundation:InformationGroup runat="server" ID="c_informationGroupGeneral" Width="200px" HeaderText="General" HeaderTextName="General">
					<table border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr id="c_tableRowReadableID" runat="server">
							<td>
								<table border="0" cellspacing="0" cellpadding="0"><tr><td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringCampaignReadableID" Name="CampaignReadableID" Runat="server"/>:&nbsp;</div></td><td valign="bottom"><asp:Label CssClass="litInputText150" runat="server" MaxLength="200" ID="c_labelReadableID" /></td></tr></table>
							</td>
						</tr>					
						<tr>
							<td>
								<div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringCampaignName" Name="CampaignName" Runat="server"/>
								<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredCampaignName" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
								<asp:TextBox CssClass="litInputText150" runat="server" MaxLength="200" ID="c_textBoxCampaignName"></asp:TextBox>&nbsp;
								<asp:RequiredFieldValidator Display="Dynamic" ID="c_validatorCampaignName" ValidationGroup="addCampaign" ControlToValidate="c_textBoxCampaignName" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
							</td>
						</tr>
						<tr>
							<td>
								<div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringCampaignDescription" Name="CampaignDescription" Runat="server"/>:</div>
								<asp:TextBox TextMode="MultiLine" CssClass="litInputText150" runat="server" MaxLength="200" ID="c_textBoxCampaignDescription"></asp:TextBox>
							</td>
						</tr>
						<tr>
							<td>
								<div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringCampaignType" Name="CampaignType" Runat="server"/>
								<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredCampaignType" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
								<asp:DropDownList CssClass="litInputText150" ID="c_dropDownListCampaignType" runat="server" onchange="onCampaignTypeChanged()"></asp:DropDownList>&nbsp;
								<asp:RequiredFieldValidator Display="Dynamic" ID="c_validatorCampaignType" ControlToValidate="c_dropDownListCampaignType" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>									
							</td>
						</tr>	
						<tr>
						    <td>						
							    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCurrency" Name="Currency" Runat="server"/>
							    <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCurrency" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	                            <asp:DropDownList id="c_dropDownListCurrency" runat="server" Width = "150px"/>
                                <asp:RequiredFieldValidator Display="Dynamic" ID="c_validatorCampaignCurrency" ControlToValidate="c_dropDownListCurrency" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>									
                            </td>	
                        </tr>										
						<tr>
							<td>
								<div class="litBoldHeader"><asp:CheckBox ID="c_checkBoxExclusive" runat="server" />&nbsp;
								<Foundation:ModuleString ID="c_moduleStringCampaignExclusive" Name="CampaignExclusive" Runat="server"/>
								<asp:Label ID="c_labelSeperator" Text=": " runat="server"/>
								<Foundation:ModuleString ID="c_moduleStringCampaignExclusiveDescription" Name="CampaignExclusiveDescription" Runat="server"/>
								</div>
							</td>						
						</tr>
						<tr>
							<td>
								<div class="litBoldHeader"><asp:CheckBox ID="c_checkBoxActive" runat="server" />&nbsp;
								<Foundation:ModuleString ID="c_moduleStringCampaignActive" Name="CampaignActive" Runat="server"/>
								</div>
							</td>						
						</tr>	
						<tr>
							<td>
								<div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringCampaignTypeDescription" Name="CampaignDescription" Runat="server"/>:</div>
								<div class="litText"><span id="TextBoxCampaignTypeDescription" /></div>
							</td>
						</tr>					
					</table>
				</Foundation:InformationGroup>
				</div>
			</td>
			<td>
				<Foundation:InformationGroup runat="server" ID="c_informationGroupValidFor" Width="450px" HeaderText="Valid for" HeaderTextName="CampaignValidFor">
					<table border="0" cellspacing="0" cellpadding="0" width="100%">
						<tr id="Tr1" runat="server">
							<td>
								<asp:Panel runat="server" ID="c_panelCampaignPeriod" xstyle="padding-top: 8px;">
									<div class="litBoldHeader" style="margin-top: 0px;">
										<asp:Label ID="c_labelCampaignPeriod" runat="server" Text=""></asp:Label>
									</div>
									<table border="0" cellpadding="0" cellspacing="0" width="240px">
										<tr>
											<td valign="top">
												<div class="litInputTable">
												    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringStartDate" Name="CampaignStartDate" Runat="server"/>
                                                        <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageStartDate" style="vertical-align:middle;" class="litIconRequired" alt="" />:
                                                    </div>
													
													<LS:DateTimeHelper runat="server" ID="c_calendarFromDateHelper" AssociatedControlID="c_calendarFromDate" />
													<Telerik:RadDatePicker runat="server" ID="c_calendarFromDate" />
													<asp:CustomValidator Display="Dynamic" ID="c_validatorFromDate" runat="server" ErrorMessage="*"></asp:CustomValidator>
												</div>
											</td>
											<td width="20px" style="text-align: center;">
											</td>
											<td valign="top">
												<div class="litInputTable">
												    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringEndDate" Name="CampaignEndDate" Runat="server"/>
                                                        <img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageEndDate" style="vertical-align:middle;" class="litIconRequired" alt="" />:
                                                    </div>
													<LS:DateTimeHelper runat="server" ID="c_calendarToDateHelper" AssociatedControlID="c_calendarToDate" />
													<Telerik:RadDatePicker runat="server" ID="c_calendarToDate" />
													<asp:CustomValidator Display="Dynamic" ID="c_validatorToDate" runat="server" ErrorMessage="*"></asp:CustomValidator>
												</div>
											</td>
										</tr>
									</table>
									<asp:Panel ID="c_leftErrorPanel" runat="server" Width="100%" style="display:none;">
										<fieldset class="litErrorFieldset" style="width: 220px;">
											<legend class="litErrorFieldsetMsg">
												<img src="Images/transparent.gif" style="vertical-align: middle;" alt="" class="litIconError" />
												<b>
													<Foundation:SystemString Name="ErrorPageTitle" runat="server" ID="c_systemStringDateSelection" />
												</b></legend>
											<img src="Images/transparent.gif" width="5" alt="" /><br />
											<Foundation:ModuleString Name="InvalidDateSelection" runat="server" ID="c_moduleStringDateSelection" />
										</fieldset>
									</asp:Panel>									
								</asp:Panel>
							</td>
						</tr>
						<tr>
							<td>
								<div id="divArticles" runat="server">
								    <div class="litBoldHeader" style="width: 450px;margin-top: 7px;"><div style="float: left;" ><Foundation:ModuleString ID="c_moduleStringArticles" Name="CampaignProducts" Runat="server" /></div>
								    <div style="float:right;"><a class="litIconPopUp litContentPager"  runat="server" style="float: right; font-size: 100%;" id="c_buttonArticles" href="#">Add</a></div></div>
								    <div style="clear: both;"></div>
								     <LS:GridHelperAjax runat="server" ID="m_articlesHelper" AssociatedControlID="c_articlesGrid"
	                                    OnNeedData="articlesGrid_NeedData" DataKeyName="ID" PageSize="5" AllowSorting=true />
                                    <Telerik:RadGrid ID="c_articlesGrid" CssClass="ArticleGrid" runat="server" Style="height: 200px; width: 450px; border: solid 1px #CFCDCC;" AllowMultiRowSelection="true" OnItemCommand="articlesGrid_ItemCommand">
	                                    <MasterTableView runat="server" ClientDataKeyNames="ID" CssClass="AutoShrink" >
	                                    <Columns>
	                                        <Telerik:GridBoundColumn DataField="ID" Display="false" />
		                                    <Telerik:GridBoundColumn DataField="DisplayName" />
		                                    <Telerik:GridBoundColumn DataField="ArticleNumber" />
		                                    <Telerik:GridBoundColumn DataField="Location" />
		                                    <Telerik:GridButtonColumn CommandName="Delete" CommandArgument="ID" ImageUrl="../Images/icons_standard/delete.png"
									                                ButtonType="ImageButton" UniqueName="DeleteColumn">
                                            <HeaderStyle Width="27px" />
			                                </Telerik:GridButtonColumn>
		                                </Columns>
	                                    </MasterTableView>
                                    </Telerik:RadGrid>    
							    </div>
							</td>
							
						</tr>
						<tr>
							<td>
							    <div id="divProductGroups" runat="server">
								    <div class="litBoldHeader" style="width: 450px;margin-top: 7px;"><div style="float: left;" ><Foundation:ModuleString ID="c_moduleStringProductGroups" Name="CampaignProductGroups" Runat="server"/></div>
								    <div style="float:right;"> <a class="litIconPopUp litContentPager"  runat="server" style="float:right;font-size: 100%;" id="c_buttonProductGroups" href="#">Add</a></div></div>
								    <div style="clear: both;"></div>
								    <LS:GridHelperAjax runat="server" ID="GridHelperAjax1" AssociatedControlID="c_productGroupGrid"
	                                    OnNeedData="productGroupGrid_NeedData" DataKeyName="ID" PageSize="5" AllowSorting=true />
                                    <Telerik:RadGrid ID="c_productGroupGrid" CssClass="ArticleGrid" runat="server" Style="height: 200px; width: 450px; border: solid 1px #CFCDCC;" AllowMultiRowSelection="true" OnItemCommand="c_productGroupGrid_ItemCommand">
	                                    <MasterTableView runat="server" ClientDataKeyNames="ID" CssClass="AutoShrink" >
	                                    <Columns>
	                                        <Telerik:GridBoundColumn DataField="ID" Display="false" />
		                                    <Telerik:GridBoundColumn DataField="DisplayName" />
		                                    <Telerik:GridBoundColumn DataField="Location" />
		                                    <Telerik:GridButtonColumn CommandName="Delete" CommandArgument="ID" ImageUrl="../Images/icons_standard/delete.png"
									                                ButtonType="ImageButton" UniqueName="DeleteColumn">
                                            <HeaderStyle Width="27px" />
			                                </Telerik:GridButtonColumn>
		                                </Columns>
	                                    </MasterTableView>
                                    </Telerik:RadGrid>    
							    </div>
							</td>
						</tr>
						<tr>
							<td>
							    <div id="divProductCatalogs" runat="server">
								    <div class="litBoldHeader" style="width: 450px;margin-top: 7px;"><div style="float: left;" ><Foundation:ModuleString ID="c_moduleStringProductCatalogs" Name="CampaignProductCatalogs" Runat="server"/></div>
								    <div style="float:right;"><a class="litIconPopUp litContentPager"  runat="server" style="font-size: 100%;" id="c_buttonProductCatalogs" href="#">Add</a></div></div>
								    <div style="clear: both;"></div>
								    <LS:GridHelperAjax runat="server" ID="GridHelperAjax2" AssociatedControlID="c_productCatalogGrid"
	                                    OnNeedData="productCatalogGrid_NeedData" DataKeyName="ID" PageSize="5" AllowSorting=true />
                                    <Telerik:RadGrid ID="c_productCatalogGrid" CssClass="ArticleGrid" runat="server" Style="height: 200px; width: 450px; border: solid 1px #CFCDCC;" AllowMultiRowSelection="true" OnItemCommand="c_productCatalogGrid_ItemCommand">
	                                    <MasterTableView runat="server" ClientDataKeyNames="ID" CssClass="AutoShrink" >
	                                    <Columns>
	                                        <Telerik:GridBoundColumn DataField="ID" Display="false" />
		                                    <Telerik:GridBoundColumn DataField="DisplayName" />
		                                    <Telerik:GridButtonColumn CommandName="Delete" CommandArgument="ID" ImageUrl="../Images/icons_standard/delete.png"
									                                ButtonType="ImageButton" UniqueName="DeleteColumn">
                                            <HeaderStyle Width="27px" />
			                                </Telerik:GridButtonColumn>
		                                </Columns>
	                                    </MasterTableView>
                                    </Telerik:RadGrid>    
							    </div>
							</td>
						</tr>						
						<tr>
							<td>
							    <div id="divGroups" runat="server">
								    <div class="litBoldHeader" style="width: 450px;margin-top: 7px;"><div style="float: left;" ><Foundation:ModuleString ID="c_moduleStringGroups" Name="CampaignGroups" Runat="server"/></div>
								    <div style="float:right;"><a class="litIconPopUp litContentPager"  runat="server" style="float:right;font-size: 100%;" id="c_buttonGroups" href="#">Add</a></div></div>
								    <div style="clear: both;"></div>
								    
								    <LS:GridHelperAjax runat="server" ID="GridHelperAjax3" AssociatedControlID="c_groupGrid"
	                                    OnNeedData="groupGrid_NeedData" DataKeyName="ID" PageSize="5" AllowSorting=true />
                                    <Telerik:RadGrid ID="c_groupGrid" CssClass="ArticleGrid" runat="server" Style="height: 200px; width: 450px; border: solid 1px #CFCDCC;" AllowMultiRowSelection="true" OnItemCommand="c_groupGrid_ItemCommand">
	                                    <MasterTableView runat="server" ClientDataKeyNames="ID" CssClass="AutoShrink" >
	                                    <Columns>
	                                        <Telerik:GridBoundColumn DataField="ID" Display="false" />
		                                    <Telerik:GridBoundColumn DataField="DisplayName" />
		                                    <Telerik:GridButtonColumn CommandName="Delete" CommandArgument="ID" ImageUrl="../Images/icons_standard/delete.png"
									                                ButtonType="ImageButton" UniqueName="DeleteColumn">
                                            <HeaderStyle Width="27px" />
			                                </Telerik:GridButtonColumn>
		                                </Columns>
	                                    </MasterTableView>
                                    </Telerik:RadGrid>    
							    </div>
							</td>
						</tr>										
					</table>
				</Foundation:InformationGroup>
			</td>
		</tr>
	</table>
	</div>
	<div style="height: 1px;">
	    <asp:HiddenField runat="server" id="c_hiddenFieldDateTimeFormat" />
	    <ProductCatalog:ProductCatalogDialog id="c_campaignArticlesDialog" runat="server" PageSize="10" />
        <asp:HiddenField runat="server" id="c_hiddenFieldArticles" />
        <asp:HiddenField runat="server" id="c_hiddenFieldProducts" />
        <asp:HiddenField runat="server" id="c_hiddenFieldProductGroups" />
        <asp:HiddenField runat="server" id="c_hiddenFieldProductCatalogs" />    
	    <Relations:RelationsDialog id="c_campaignGroupsDialog" runat="server" PageSize="10" />
        <asp:HiddenField runat="server" id="c_hiddenFieldGroups" />	
    </div>
</asp:Content>

