<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_Campaigns, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>

<asp:Content ID="ToolbarScripts" ContentPlaceHolderID="Scripts" runat="server">
    <script type="text/javascript">
    //<![CDATA[
    // Image preloading
    var img1 = new Image();
    img1.src = '../../LitiumStudio/Images/grid/spinner.gif';
    //]]>
    var selectedCampaignId;
    function resetToolBar()
    {
        setCommonToolbarButtonEnabled('c_toolbarItemView', false);
        setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
        setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
        setECommerceCommonToolbarButtonEnabled('c_toolbarItemCopy', false);   
        setToolbarButtonEnabled('c_toolbarItemActivate', false);  
    }
    
    function setToolbarButtonEnabled(id, enabled)
    {
        c_toolbarCampaigns.get_items().getItemById(id).set_enabled(enabled);
    }
    
    function setToolbarButtonVisible(id, visible)
    {
        c_toolbarCampaigns.get_items().getItemById(id).set_visible(visible);
    }
    
    function callMethod_Failure(errors, userContext, methodName) {
       alert(errors.get_message()); 
    }
    
    function callMethod_Success(results, userContext, methodName) 
    {     
        if (methodName == 'GetSelectedCampaignInfo')
        {
            var campaignInfo = new Array();
            campaignInfo = results.split('|');
            
            // Enable or disable the edit button
            var isEditable = (campaignInfo[0] == 'True')
            
            // Enable or disable the delete button
            var isDeletable = (campaignInfo[1] == 'True')
            
            <%  if (Master.WriteAccess)
            {%>
            setCommonToolbarButtonEnabled('c_toolbarItemEdit', isEditable);
            
           	setCommonToolbarButtonEnabled('c_toolbarItemDelete', isDeletable);
           	 <%
            }%>
           	if (!isDeletable) {
           		c_toolbarCommon.get_items().getItemById('c_toolbarItemDelete').set_toolTip("<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELETE_CAMPAIGN_FORBIDDEN, this.FoundationContext.LanguageID] %>");
           	} else {
           		c_toolbarCommon.get_items().getItemById('c_toolbarItemDelete').set_toolTip("<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELETE, this.FoundationContext.LanguageID] %>");
           	}
           
            
            // Enable or disable the active/deactive button
            var isActiveDeactive = (campaignInfo[2] == 'True')
            <%  if (Master.WriteAccess)
            {%>
            setToolbarButtonEnabled('c_toolbarItemActivate', isActiveDeactive);
            <%
            }%>
            
            // Enable or disable the add and copy buttons
            var isAddable = (campaignInfo[3] == 'True')
            setCommonToolbarButtonEnabled('c_toolbarItemAdd', isAddable);
            <%  if (Master.WriteAccess)
            {%>
            setECommerceCommonToolbarButtonEnabled('c_toolbarItemCopy', isAddable);
            <%
            }%>
            
            c_toolbarCampaigns.get_items().getItemById('c_toolbarItemActivate').set_text(campaignInfo[4]);
        }
               
        if (methodName == 'ActivateDeActivateCampaign')
        {
            var campaignInfo = new Array();
            campaignInfo = results.split('|');
            c_toolbarCampaigns.get_items().getItemById('c_toolbarItemActivate').set_text(campaignInfo[0]);
            var tableView = $find("<%= c_campaignsGrid.ClientID %>").get_masterTableView();
            tableView.clearSelectedItems();
            resetToolBar();
            updateGrid();
        }
        
        if (methodName == 'DeleteCampaign')
        {
            if (results == 'True')
            {
                updateGrid();
                resetToolBar();
            }
        }
    }
    
    function onToolbarItemSelect(sender, eventArgs)
    {
        var toolbarItem = eventArgs.get_item().get_id();
        //var selectedCampaign = gridHelper.GetSelectedKeys();
        if (selectedCampaignId != '')
        {
            if (toolbarItem == 'c_toolbarItemActivate')
            {
                PageMethods.ActivateDeActivateCampaign(selectedCampaignId, callMethod_Success, callMethod_Failure); 
            }
            else if (toolbarItem == 'c_toolbarItemDelete' && confirm("<%=m_currentModule.Strings[Litium.Studio.UI.ECommerce.Common.Constants.ModuleStringConstants.DELETE_CAMPAIGN_CONFIRMATION, this.FoundationContext.LanguageID] %>"))
            {
                PageMethods.DeleteCampaign(selectedCampaignId, callMethod_Success, callMethod_Failure);
            }
        }

        if (toolbarItem == 'c_toolbarItemAdd') {
            document.location = '<%= ResolveUrl(AddCampaignUrl) %>';
            
        }
    }

    function RowSelected(sender, args, gridHelper) {
        if (args._domEvent.type != null) {
            setCommonToolbarButtonEnabled('c_toolbarItemView', true);
            
            <%  if (Master.WriteAccess)
				    {%>
            setECommerceCommonToolbarButtonEnabled('c_toolbarItemCopy', true);
            setToolbarButtonEnabled('c_toolbarItemActivate', true);
            <%
				    }%>

            var selectedCampaign = gridHelper.GetSelectedKeys();
            selectedCampaignId = selectedCampaign[0];
            if (selectedCampaign != '') {
                PageMethods.GetSelectedCampaignInfo(selectedCampaign, callMethod_Success, callMethod_Failure);
            }
        }
    }

    function updateGrid() {
        var tableView = $find("<%= c_campaignsGrid.ClientID %>").get_masterTableView();
        tableView.rebind();
    }

    function ChangeCampaignType() {
        $get('<%= c_hiddenCampaignType.ClientID %>').value = $get('<%= c_campaignTypeDropDownList.ClientID %>').value;
        var tableView = $find("<%= c_campaignsGrid.ClientID %>").get_masterTableView();
        tableView.clearSelectedItems();
        resetToolBar();
        updateGrid();
    }

    function ClearFilters() {
        var calendar = $find("<%= c_calendarFromDate.ClientID %>");
        calendar.clear();
        var calendar1 = $find("<%= c_calendarToDate.ClientID %>");
        calendar1.clear();
        $get('<%= c_campaignTypeDropDownList.ClientID %>').selectedIndex = 0;
        $get('<%= c_hiddenCampaignFromDate.ClientID %>').value = '';
        $get('<%= c_hiddenCampaignToDate.ClientID %>').value = '';
        $get('<%= c_hiddenCampaignType.ClientID %>').value = '';
        updateGrid();
    }

    function DateSelectedFrom(sender, eventArgs) {
        var date = '';
        if (eventArgs.get_newValue() != null) {
            date = eventArgs.get_newValue();
        }
        $get('<%= c_hiddenCampaignFromDate.ClientID %>').value = date;
        var tableView = $find("<%= c_campaignsGrid.ClientID %>").get_masterTableView();
        tableView.clearSelectedItems();
        resetToolBar();
        updateGrid();
    }

    function DateSelectedTo(sender, eventArgs) {
        var date = '';
        if (eventArgs.get_newValue() != null) {
            date = eventArgs.get_newValue();
        }
        $get('<%= c_hiddenCampaignToDate.ClientID %>').value = date;
        var tableView = $find("<%= c_campaignsGrid.ClientID %>").get_masterTableView();
        tableView.clearSelectedItems();
        resetToolBar();
        updateGrid();
    }
    </script>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">   
    
    
    <div style="float:left;">
    <ComponentArt:ToolBar ID="c_toolbarCampaigns" 
        OnItemCommand="c_toolbarCampaigns_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">            
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemActivate" ImageUrl="icons_standard/media_play_16px.png" CausesValidation="False"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
        </Items>
        <ClientEvents>
            <ItemSelect EventHandler="onToolbarItemSelect"/>
        </ClientEvents>
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
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
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
 
    </div>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconDocumentAdd2" alt="" />
    <Foundation:ModuleString ID="ModuleString1" Name="Campaigns" Runat="server"/>
</asp:Content>
<asp:Content ID="LitiumStudioFilterArea" ContentPlaceHolderID="LitiumStudioFilterArea"
	runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Open" />
	<div style="padding-bottom: 3px;display :inline;">
	    <div>
	        <span class="lsFilterItem">
		        <Foundation:ModuleString Name="CampaignStartDate" runat="server" ID="c_moduleStringDateSelection" />
		        <LS:DateTimeHelper ID="DateTimeHelper2" AssociatedControlID="c_calendarFromDate"
			        runat="server" />
		        <Telerik:RadDatePicker runat="server" Width="160" ID="c_calendarFromDate" AutoPostBack="false"
			        EnableTyping="false" style=" margin-left: 5px;">
			        <ClientEvents OnDateSelected="DateSelectedFrom" />
		        </Telerik:RadDatePicker>
		    </span>
		    <span class="lsFilterItem">
			</span>
		</div>
		<div>
		    <span class="lsFilterItem">
		        <Foundation:ModuleString Name="CampaignEndDate" runat="server" ID="ModuleStringCampaignEndDate" />
		        <LS:DateTimeHelper ID="DateTimeHelper3" AssociatedControlID="c_calendarToDate" runat="server" />
		        <Telerik:RadDatePicker runat="server" ID="c_calendarToDate" Width="160" AutoPostBack="false"
			        EnableTyping="false" style=" margin-left: 9px;">
			        <ClientEvents OnDateSelected="DateSelectedTo" />
		        </Telerik:RadDatePicker>
    		 </span> 
    		 <span class="lsFilterItem">  
		        <Foundation:ModuleString Name="CampaignType" runat="server" ID="ModuleStringCampaignType" />
		        <asp:DropDownList runat="server" ID="c_campaignTypeDropDownList" onchange="ChangeCampaignType()" Width="150" style="margin-left: 4px;" />
		     </span>
		     <span class="lsFilterItem">
		    </span>
		     <span class="lsFilterItem">
		        <asp:HyperLink runat="server" ID="c_hyperLinkClearFilter" Text="Clear filters" onclick="ClearFilters()" />
		    	<asp:CompareValidator ID="c_dateCompareValidator" runat="server" ControlToValidate="c_calendarToDate"
			        ControlToCompare="c_calendarFromDate" Operator="GreaterThan" Type="Date" style="width:0px;">
		        </asp:CompareValidator>
		     </span>
		</div>
	</div>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
         <LS:GridHelperAjax runat="server" ID="m_campaignHelper" AssociatedControlID="c_campaignsGrid"
		    OnNeedData="grid_NeedData" DataKeyName="CampaignID" />
	    <Telerik:RadGrid ID="c_campaignsGrid" runat="server" Style="height: 100%;">
		    <ClientSettings>
			    <ClientEvents OnRowSelecting="RowSelected" />
		    </ClientSettings>
		    <MasterTableView runat="server" ClientDataKeyNames="CampaignID" AllowCustomSorting="true">
		        <Columns>
		            <Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />				   
				    <Telerik:GridBoundColumn DataField="IsActiveFormattedString"/>
				    <Telerik:GridBoundColumn DataField="CampaignName"/>
				    <Telerik:GridBoundColumn DataField="ExternalCampaignID" />
				    <Telerik:GridBoundColumn DataField="CampaignTypeTranslatedString"/>
				    <Telerik:GridBoundColumn DataField="StartDateFormattedString"/>
				    <Telerik:GridBoundColumn DataField="EndDateFormattedString"/>
				    <Telerik:GridBoundColumn DataField="IsExclusiveFormattedString"/>
				     <Telerik:GridBoundColumn DataField="CampaignID" Display="false"/>
		        </Columns>
		    </MasterTableView>
	    </Telerik:RadGrid>
        <asp:HiddenField ID="c_hiddenIsActiveCampaign" runat="server" Value="0" />
	    <asp:HiddenField ID="c_hiddenCampaignType" runat="server" />
	    <asp:HiddenField ID="c_hiddenCampaignFromDate" runat="server" />
	    <asp:HiddenField ID="c_hiddenCampaignToDate" runat="server" />
    </div>
</asp:Content>

