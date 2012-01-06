<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" enableeventvalidation="false" autoeventwireup="true" inherits="LitiumStudio_CMS_Pages, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register TagPrefix="Status" TagName="StatusArea" Src="~/LitiumStudio/CMS/WebUserControls/StatusArea.ascx" %>
<%@ Register TagPrefix="Status" TagName="StatusAreaInfo" Src="~/LitiumStudio/CMS/WebUserControls/StatusAreaInfo.ascx" %>


<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <script type="text/javascript">
        window.onload = setToolbarVisible;


        function setToolbarVisible() {            
            setTimeout("document.getElementById('<%= ToolBar1.ClientID %>').style.display = 'block'", 1000);
        }
        </script>
	<ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
	    runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
	    DefaultItemExpandedCssClass="litToolbarItemOnMouseDown" style="display: none;"  EnableViewState="false"
	    DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown" DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">            
            <ComponentArt:ToolBarItem ID="View" ImageUrl="icons_standard/view.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem ID="Publish" ImageUrl="icons_standard/ok.png" ItemType="DropDown" DropDownId="PublishMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16" ClientTemplateId="c_toolbarLeftTreeItemDropDownTemplate"/>
            <ComponentArt:ToolBarItem ID="Unpublish" ImageUrl="icons_standard/ps_unpubl2_16px.png" />
            <ComponentArt:ToolBarItem ID="Lock" ImageUrl="icons_standard/lock.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="Unlock" ImageUrl="icons_standard/lock_open.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="HideInMenu" ImageUrl="icons_standard/document.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="ShowInMenu" ImageUrl="icons_standard/ps_show_16px.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="SeparatorSharedPages" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem ID="ShowSharedPages" ImageUrl="icons_standard/shared_16px.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="MasterPage" ImageUrl="icons_standard/master_16px.png" ItemType="DropDown" DropDownId="DisconnectMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemDropDownTemplate"/>
            <ComponentArt:ToolBarItem ID="ProductCatalogInfo" ImageUrl="icons_standard/earth2.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="SeparatorTranslationInfo" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem ID="TranslationInfo" ImageUrl="icons_standard/translation_16px.png"  ItemType="DropDown" DropDownId="TranslationInfoMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemDropDownTemplate"/>
            <ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2"/>
            <ComponentArt:ToolBarItem ID="Statistic" ImageUrl="icons_standard/chart_line.png" ItemType="DropDown" DropDownId="StatisticMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemDropDownTemplate"/>
            <ComponentArt:ToolBarItem ID="Settings" ImageUrl="icons_standard/document_preferences.png" ItemType="DropDown" DropDownId="SettingsMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemDropDownTemplate"/>
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
			    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemDropDownTemplate">
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
    <ComponentArt:Menu runat="server" ID="DisconnectMenu" EnableViewState="false" OnItemSelected="DisconnectMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
        <Items>
            <ComponentArt:MenuItem ID="ShowMasterPage" Look-LeftIconUrl="icons_standard/master_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="Disconnect" Look-LeftIconUrl="icons_standard/shared_release_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="DisconnectRecursively" Look-LeftIconUrl="icons_standard/shared_release_16px.png" AutoPostBackOnSelect="true" />
        </Items>
    </ComponentArt:Menu>
    <ComponentArt:Menu runat="server" ID="TranslationInfoMenu" EnableViewState="false" OnItemSelected="TranslationMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
        <Items>
            <ComponentArt:MenuItem ID="Translations" Look-LeftIconUrl="icons_standard/documents_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="OriginalPage" Look-LeftIconUrl="icons_standard/document_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="ToBeTranslated" Look-LeftIconUrl="icons_standard/replace2_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="Translated" Look-LeftIconUrl="icons_standard/check2_16px.png" AutoPostBackOnSelect="true" />
        </Items>
    </ComponentArt:Menu>
    <ComponentArt:Menu runat="server" ID="StatisticMenu" EnableViewState="false" OnItemSelected="StatisticMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultDisabledItemLookId="DisabledItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
        <Items runat="server">
            <ComponentArt:MenuItem ID="VisitorStatistic" runat="server" AutoPostBackOnSelect="true" Look-LeftIconUrl="icons_standard/chart_line.png" />
            <ComponentArt:MenuItem ID="ProspectFinderStatistic" runat="server" AutoPostBackOnSelect="true" Look-LeftIconUrl="icons_standard/enecto_16px.png" DisabledLook-LeftIconUrl="icons_standard/enecto_16px.png" />
        </Items>
    </ComponentArt:Menu>
    <ComponentArt:Menu runat="server" ID="SettingsMenu" EnableViewState="false" OnItemSelected="SettingsMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
        </ItemLooks>
        <Items>
            <ComponentArt:MenuItem ID="Permissions" Look-LeftIconUrl="icons_standard/earth_preferences_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="Responsible" Look-LeftIconUrl="icons_standard/document_pinned_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="Versions" Look-LeftIconUrl="icons_standard/document_exchange_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="Advanced" Look-LeftIconUrl="icons_standard/gear.png" AutoPostBackOnSelect="true" />
        </Items>
    </ComponentArt:Menu>
    <ComponentArt:Menu runat="server" ID="PublishMenu" EnableViewState="false" OnItemSelected="PublishMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="ExpandableItemLook" RightIconUrl="menu/arrow.gif" RightIconWidth="20" RightIconHeight="15" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="CalendarItemLook" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" LabelPaddingBottom="0" LabelPaddingLeft="0" LabelPaddingRight="0" LabelPaddingTop="0"/>
            <ComponentArt:ItemLook LookID="CalendarTextItemLook" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="0" LabelPaddingLeft="0" LabelPaddingRight="0" LabelPaddingTop="0"/>
        </ItemLooks>
        <Items>
            <ComponentArt:MenuItem ID="PublishNow" Look-LeftIconUrl="icons_standard/ok.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="PublishWithSubPages" Look-LeftIconUrl="icons_standard/ok.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="PublishSubPages" Look-LeftIconUrl="icons_standard/ok.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="PublishApproval" Look-LeftIconUrl="icons_standard/hand_green_card.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="CancelPublishApproval" Look-LeftIconUrl="icons_standard/hand_green_card.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="TimePublish" LookId="ExpandableItemLook" DefaultSubGroupCssClass="litNavMenuGroup" Look-LeftIconUrl="icons_standard/clock.png" >
                <ComponentArt:MenuItem ID="TimePublishCalendar" LookId="CalendarItemLook" ServerTemplateId="CalendarTemplate" />
                <ComponentArt:MenuItem ID="TimePublishButton" LookId="CalendarItemLook" ServerTemplateId="TimeTemplate" />
            </ComponentArt:MenuItem>
            <ComponentArt:MenuItem ID="CancelTimePublish" Look-LeftIconUrl="icons_standard/clock.png" AutoPostBackOnSelect="true" />
        </Items>
        <ClientEvents>
            <ItemSelect EventHandler="PublishMenu_ItemSelect" />
        </ClientEvents>
        <ServerTemplates>
            <ComponentArt:NavigationCustomTemplate ID="CalendarTemplate">
                <Template>
                    <ComponentArt:Calendar runat="server" SelectedDate="<%#TimePublishDate%>"
                        id="c_calendarTimePublish" 
                        AllowMonthSelection="false"
                        AllowMultipleSelection="false"
                        AllowWeekSelection="false"
                        ControlType="Calendar"
                        DayNameFormat="FirstTwoLetters"
                        ImagesBaseUrl="~/LitiumStudio/Images/calendar/"
                        NextImageUrl="cal_nextMonth.gif"
                        PrevImageUrl="cal_prevMonth.gif" 
                        SelectMonthText="" 
                        SelectWeekText="&raquo;" 
                        SwapDuration="300"
                        SwapSlide="Linear"
                        CalendarCssClass="litCalendar" 
                        TitleCssClass="litCalendarTitle" 
                        DayCssClass="litCalendarDay" 
                        DayHeaderCssClass="litCalendarDayHeader" 
                        DayHoverCssClass="litCalendarDayHover" 
                        MonthCssClass="litCalendarMonthBig"
                        NextPrevCssClass="litCalendarNextPrev" 
                        OtherMonthDayCssClass="litCalendarOtherMonthDay" 
                        SelectedDayCssClass="litCalendarSelectedDay" 
                        SelectMonthCssClass="litCalendarSelector"
                        SelectWeekCssClass="litCalendarSelector"
                        TodayDayCssClass="litCalendarToday">
                    </ComponentArt:Calendar>
                </Template>
            </ComponentArt:NavigationCustomTemplate>
            <ComponentArt:NavigationCustomTemplate ID="TimeTemplate">
                <Template><span class="litBoldText">&nbsp;<Foundation:ModuleString ID="ModuleString1" Name="Time" runat="server"/>&nbsp;</span>
                    <asp:DropDownList runat="server" ID="c_dropDownListTimePublish" SelectedValue="<%#TimePublishTime%>" CssClass="litInputSelect" style="width:auto;">
                        <asp:ListItem Text="00:00" Value="0" />
                        <asp:ListItem Text="01:00" Value="1" />
                        <asp:ListItem Text="02:00" Value="2" />
                        <asp:ListItem Text="03:00" Value="3" />
                        <asp:ListItem Text="04:00" Value="4" />
                        <asp:ListItem Text="05:00" Value="5" />
                        <asp:ListItem Text="07:00" Value="7" />
                        <asp:ListItem Text="08:00" Value="8" />
                        <asp:ListItem Text="09:00" Value="9" />
                        <asp:ListItem Text="10:00" Value="10" />
                        <asp:ListItem Text="11:00" Value="11" />
                        <asp:ListItem Text="12:00" Value="12" />
                        <asp:ListItem Text="13:00" Value="13" />
                        <asp:ListItem Text="14:00" Value="14" />
                        <asp:ListItem Text="15:00" Value="15" />
                        <asp:ListItem Text="16:00" Value="16" />
                        <asp:ListItem Text="17:00" Value="17" />
                        <asp:ListItem Text="18:00" Value="18" />
                        <asp:ListItem Text="19:00" Value="19" />
                        <asp:ListItem Text="20:00" Value="20" />
                        <asp:ListItem Text="21:00" Value="21" />
                        <asp:ListItem Text="22:00" Value="22" />
                        <asp:ListItem Text="23:00" Value="23" />
                    </asp:DropDownList>
                    <asp:Button runat="server" id="c_buttonTimePublish" onClientClick="setTimeout('progressActivate();',100);" onClick="ButtonTimePublish_Click" CssClass="litInputButton" style="width:auto;" />
                </Template>
            </ComponentArt:NavigationCustomTemplate>
        </ServerTemplates>
    </ComponentArt:Menu>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Status:StatusArea runat="server" ID="c_statusArea" />
</asp:Content>
<asp:Content ContentPlaceHolderID="LitiumStudioFilterArea" runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Closed" />
	<Status:StatusAreaInfo runat="server" ID="c_statusArea2" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
		<script type="text/javascript">
			function encodeURIComponentNew(s) {
				var s = utf8(s);
				var c;
				var enc = "";
				for (var i = 0; i < s.length; i++) {
					if ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-".indexOf(s.charAt(i)) == -1)
						enc += "%" + "0123456789ABCDEF".charAt(s.charCodeAt(i) >> 4) + "0123456789ABCDEF".charAt(s.charCodeAt(i) & 0xF);
					else
						enc += s.charAt(i);
				}
				return enc;
			}
			if (!(typeof encodeURIComponent == "function"))
				encodeURIComponent = encodeURIComponentNew;
			 function ReloadPage(iFrameID) {
				var iFrame = null;
				iFrame = document.getElementById(iFrameID);
				var contentWindowRawUrl;
				if (iFrame) {
					contentWindowRawUrl = iFrame.contentWindow.document.location.href;
					contentWindowHref = contentWindowRawUrl.split("/");
					iFrameHref = iFrame.src.split("/");
					if ((iFrame.src != "") && (contentWindowHref.length > 0) && (iFrameHref.length > 0)) {
						contentWindowHrefUrl = contentWindowHref[contentWindowHref.length - 1];
						iFrameHrefUrl = iFrameHref[iFrameHref.length - 1];

						if (contentWindowHrefUrl == encodeURIComponent(iFrameHrefUrl) || contentWindowHrefUrl == iFrameHrefUrl)
							return;
				
						contentWindowHrefPageUrl = contentWindowHrefUrl.split("=");
						iFrameHrefPageUrl = iFrameHrefUrl.split("=");
						contentWindowPageID = "";
						iFramePageID = "";
						urlPiece = "";
						if (contentWindowHrefPageUrl && contentWindowHrefPageUrl.length > 1) {
							for (index = 0; index < contentWindowHrefPageUrl.length; index++) {
								urlPiece = contentWindowHrefPageUrl[index];
								pageIDString = "";
								if (urlPiece.length > 6)
									pageIDString = urlPiece.toLowerCase().substring(urlPiece.length - 6, urlPiece.length);
								if (pageIDString == "pageid") {
									contentWindowPageID = contentWindowHrefPageUrl[index + 1];
									if (contentWindowPageID.indexOf("&") > -1) {
										contentWindowPageID = contentWindowPageID.split("&")[0];
									}
									break;
								}
							}
						}
						urlPiece = "";
						if (iFrameHrefPageUrl && iFrameHrefPageUrl.length > 1) {
							for (index = 0; index < iFrameHrefPageUrl.length; index++) {
								urlPiece = iFrameHrefPageUrl[index];
								pageIDString = "";
								if (urlPiece.length > 6)
									pageIDString = urlPiece.toLowerCase().substring(urlPiece.length - 6, urlPiece.length);
								if (pageIDString == "pageid") {
									iFramePageID = iFrameHrefPageUrl[index + 1];
									if (iFramePageID.indexOf("&") > -1) {
										iFramePageID = iFramePageID.split("&")[0];
									}
									break;
								}
							}
						}
						if (contentWindowPageID != "") {
						    if (contentWindowPageID != iFramePageID)
						    {
						        document.location = "Pages.aspx?CMS_SP_ID=" + contentWindowPageID;
						    }
						}
						else {
							iFrameHrefAspxIndex = iFrameHrefUrl.toLowerCase().indexOf(".aspx");
							contentWindowHrefAspxIndex = contentWindowHrefUrl.toLowerCase().indexOf(".aspx");
							if (iFrameHrefAspxIndex > -1 && contentWindowHrefAspxIndex > -1) {
							    if (iFrameHrefUrl.toLowerCase().substring(0, iFrameHrefAspxIndex) != contentWindowHrefUrl.toLowerCase().substring(0, contentWindowHrefAspxIndex) && !(contentWindowHrefAspxIndex > -1 && contentWindowRawUrl && contentWindowRawUrl.toLowerCase().indexOf("templates/") > -1))
							    {
							        document.location = "Pages.aspx?CMS_SP_ID=" + iFrame.contentWindow.document.location.href;
							    }
							}
							else {
							    if (!(contentWindowHrefAspxIndex > -1 && contentWindowRawUrl && (contentWindowRawUrl.toLowerCase().indexOf("templates/") > -1 || contentWindowRawUrl.toLowerCase().indexOf("/error.aspx") > -1)))
							    {
							        document.location = "Pages.aspx?CMS_SP_ID=" + iFrame.contentWindow.document.location.href;
							    }
							}
						}
					}
				}
			}
        </script>
        <iframe src="<%=SelectedPagePath%>" class="litModuleIframeWithTreeAreaV2" width="100%" height="100%" scrolling="auto" frameborder="0" id="iframeTest" onload="javascript:ReloadPage('iframeTest');"></iframe>
	</div>
</asp:Content>
