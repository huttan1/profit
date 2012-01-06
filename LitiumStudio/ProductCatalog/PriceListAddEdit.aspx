<%@ page language="C#" autoeventwireup="true" validaterequest="false" inherits="LitiumStudio_ProductCatalog_PriceListAddEdit, Litum.Studio.Web" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<%@ Register TagPrefix="Relations" TagName="RelationsDialog" Src="~/LitiumStudio/WebUserControls/RelationsDialog.ascx" %>
<%@ Register TagPrefix="ProductCatalog" TagName="ProductCatalogDialog" Src="~/LitiumStudio/WebUserControls/ProductCatalogDialog.ascx" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
  <script type="text/javascript">
  	function toolbarItemSelected(sender, eventArgs) {
  		var toolbarItem = eventArgs.get_item().get_id();

  		if (toolbarItem == 'Abort') {
  			__doPostBack("itemabort");
  		}
  		if (toolbarItem == 'Save') {
  			__doPostBack("itemsave");
  		}
  	}
        </script>
	<ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="false" OnItemCommand="ToolBar_ItemCommand"
		runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="Abort" runat="server" ImageUrl="icons_standard/sign_stop.png"
			    CausesValidation="False" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="Save" runat="server" ImageUrl="icons_standard/floppy_disk_blue.png"
			     ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
		<ClientEvents>
			<ItemSelect EventHandler="toolbarItemSelected" />
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
		</ClientTemplates>
	</ComponentArt:ToolBar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<img src="Images/transparent.gif" class="litIconBarcode" alt="" /><asp:Label runat="server"
				ID="c_header" />       
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
     <script type="text/javascript">   
        
        function onSelectionChange(sender, eventArgs)
        {
            if(! validateDateSelection())
            {
                alert('<%=InvalidDateSelectionMessage%>');
                sender.clearSelectedDate();
            }
        }
        
        function validateDateSelection()
        {
            var isValid = true;
            var startDate = c_startDate.getSelectedDate();
            var endDate = c_endDate.getSelectedDate();
            if ( startDate != null && endDate != null)
            {
                if(startDate > endDate)
                {
                    isValid = false;
                }
            }
            return isValid;
        }
        
    </script>
	<div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="500px" >
			<table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
				<tr>
					<td valign="top">
						<div class="litBoldHeader">
							<Foundation:SystemString ID="ModuleString6" Name="Active" runat="server" />
						</div>
						<div>
							<asp:CheckBox Checked="true" runat="server" ID="c_active" CssClass="litInputSelect" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString11" Name="PriceListName" runat="server" />
							<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
								alt="" />
						</div>
						<div>
							<asp:TextBox runat="server" ID="c_name" CssClass="litInputSelect" />&nbsp;<asp:RequiredFieldValidator Display="Dynamic"
								ID="c_reqName" ControlToValidate="c_name" runat="server" /><asp:CustomValidator Display="Dynamic" ID="c_custName" ControlToValidate="c_name" runat="server" OnServerValidate="NameDuplicateCheck" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString1" Name="PriceListCurrency" runat="server" />
							<img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
								alt="" />
						</div>
						<div>
							<asp:DropDownList runat="server" ID="c_currencyID" CssClass="litInputSelect" />
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString3" Name="PriceListDateInterval" runat="server" />
						</div>
						<div>
							<table border="0">
								<tr>
									<td>
										<ComponentArt:Calendar runat="server" ID="c_startDate" AutoPostBackOnSelectionChanged="false"
											AllowMonthSelection="false" AllowMultipleSelection="false" AllowWeekSelection="false"
											ControlType="Calendar" DayNameFormat="FirstTwoLetters" ImagesBaseUrl="~/LitiumStudio/Images/calendar/"
											NextImageUrl="cal_nextMonth.gif" PrevImageUrl="cal_prevMonth.gif" SelectMonthText=""
											SelectWeekText="&raquo;" SwapDuration="300" SwapSlide="Linear" CalendarCssClass="litCalendar"
											TitleCssClass="litCalendarTitle" DayCssClass="litCalendarDay" DayHeaderCssClass="litCalendarDayHeader"
											DayHoverCssClass="litCalendarDayHover" MonthCssClass="litCalendarMonth" TodayDayCssClass="litCalendarToday"
											NextPrevCssClass="litCalendarNextPrev" OtherMonthDayCssClass="litCalendarOtherMonthDay"
											SelectedDayCssClass="litCalendarSelectedDay" SelectMonthCssClass="litCalendarSelector"
											SelectWeekCssClass="litCalendarSelector">
											<ClientEvents>
												<SelectionChanged EventHandler="onSelectionChange" />
											</ClientEvents>
										</ComponentArt:Calendar>
										<asp:HyperLink runat="server" ID="c_startDateClear" class="litText">
											<Foundation:ModuleString ID="ModuleString4" Name="ClearDate" runat="server" />
										</asp:HyperLink>
									</td>
									<td>
										-
									</td>
									<td>
										<ComponentArt:Calendar runat="server" ID="c_endDate" AutoPostBackOnSelectionChanged="false"
											AllowMonthSelection="false" AllowMultipleSelection="false" AllowWeekSelection="false"
											ControlType="Calendar" DayNameFormat="FirstTwoLetters" ImagesBaseUrl="~/LitiumStudio/Images/calendar/"
											NextImageUrl="cal_nextMonth.gif" PrevImageUrl="cal_prevMonth.gif" SelectMonthText=""
											SelectWeekText="&raquo;" SwapDuration="300" SwapSlide="Linear" CalendarCssClass="litCalendar"
											TitleCssClass="litCalendarTitle" DayCssClass="litCalendarDay" DayHeaderCssClass="litCalendarDayHeader"
											DayHoverCssClass="litCalendarDayHover" MonthCssClass="litCalendarMonth" TodayDayCssClass="litCalendarToday"
											NextPrevCssClass="litCalendarNextPrev" OtherMonthDayCssClass="litCalendarOtherMonthDay"
											SelectedDayCssClass="litCalendarSelectedDay" SelectMonthCssClass="litCalendarSelector"
											SelectWeekCssClass="litCalendarSelector">
											<ClientEvents>
												<SelectionChanged EventHandler="onSelectionChange" />
											</ClientEvents>
										</ComponentArt:Calendar>
										<asp:HyperLink runat="server" ID="c_endDateClear" class="litText">
											<Foundation:ModuleString ID="ModuleString7" Name="ClearDate" runat="server" />
										</asp:HyperLink>
									</td>
								</tr>
							</table>
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString2" Name="PriceListGroups" runat="server" />
						</div>
						<div>
							<asp:TextBox runat="server" ID="c_groupText" ReadOnly="true" CssClass="litInputText" />
							<asp:HiddenField runat="server" ID="c_groupIDs" />
							<asp:Button runat="server" ID="c_changeGroups" UseSubmitBehavior="false" CssClass="litInputButton" style="width:auto;margin-left:10px;" /><asp:ImageButton id="c_deleteGroups" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server" style="margin-top: -5px;"/>
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="ModuleString5" Name="PriceListOrganization" runat="server" />
						</div>
						<div>
							<asp:TextBox runat="server" ID="c_organizationText" ReadOnly="true" CssClass="litInputText" />
							<asp:HiddenField runat="server" ID="c_organizationIDs" />
							<asp:Button runat="server" ID="c_changeOrganizations" UseSubmitBehavior="false" CssClass="litInputButton" style="width:auto;margin-left:10px;" /><asp:ImageButton id="c_deleteOrganizations" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server" style="margin-top: -5px;"/>
						</div>
						<div class="litBoldHeader">
							<Foundation:ModuleString ID="c_priceListProductCatalogLabel" Name="PriceListProductCatalog"
								runat="server" />
						</div>
						<div>
							<asp:TextBox runat="server" ID="c_productCatalogText" ReadOnly="true" CssClass="litInputText" />
							<asp:HiddenField runat="server" ID="c_productCatalogIDs" />
							<asp:Button runat="server" ID="c_changeProductCatalog" UseSubmitBehavior="false" CssClass="litInputButton" style="width:auto;margin-left:10px;" /><asp:ImageButton id="c_deleteProductCatalog" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server" style="margin-top: -5px;"/>
						</div>
					</td>
				</tr>
			</table>
		</Foundation:InformationGroup>
	</div>
	<Relations:RelationsDialog ID="RelationsDialog" runat="server" />
	<ProductCatalog:ProductCatalogDialog ID="ProductCatalogDialog" runat="server" />
</asp:Content>
