<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesWorkingCopy, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register TagPrefix="Status" TagName="StatusArea" Src="~/LitiumStudio/CMS/WebUserControls/StatusArea.ascx" %>
<%@ Register TagPrefix="Status" TagName="StatusAreaInfo" Src="~/LitiumStudio/CMS/WebUserControls/StatusAreaInfo.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioFilterArea" runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Closed" />
	<Status:StatusAreaInfo runat="server" ID="c_statusArea2" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <script type="text/javascript">
    	function Toolbar_onItemBeforeSelect(sender, eventArgs) {
    		if (eventArgs.get_item().get_id() == "Delete") {
    			if (!confirm('<Foundation:ModuleString Name="ConfirmationWorkingCopyDelete" runat="server"/>'))
    				eventArgs.set_cancel(true);
    		}
    	}
    </script>
    <ComponentArt:ToolBar ID="ToolBar1" EnableViewState="false"
        AutoPostBackOnSelect="true"
        OnItemCommand="ToolBar_ItemCommand"
        runat="server" CssClass="litToolbar"
        DefaultItemCssClass="litToolbarItemNew"
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
        DefaultItemDisabledCssClass="litToolbarItemDisabled"
        ImagesBaseUrl="~/LitiumStudio/Images/"
        ItemSpacing="0"
        UseFadeEffect="false"
        Orientation="Horizontal"
        DefaultItemExpandedCssClass="litToolbarItemOnMouseDown"
        DefaultItemImageWidth="16"
        DefaultItemImageHeight="24">
        <Items>
            <ComponentArt:ToolBarItem ID="Back" ImageUrl="icons_standard/arrow_left_blue_16px.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="Delete" ImageUrl="icons_standard/delete.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="Publish" ImageUrl="icons_standard/ok.png" ItemType="DropDown" DropDownId="PublishMenu" DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="24"   ClientTemplateId="c_toolbarLeftTreeItemDropDownTemplate"/>
        </Items>
        <ClientEvents>
            <ItemBeforeSelect EventHandler="Toolbar_onItemBeforeSelect" />
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
    <ComponentArt:Menu runat="server" ID="PublishMenu" EnableViewState="false" OnItemSelected="PublishMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
        <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="ExpandableItemLook" RightIconUrl="menu/arrow.gif" RightIconWidth="20" RightIconHeight="15" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="CalendarItemLook" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" LabelPaddingBottom="0" LabelPaddingLeft="0" LabelPaddingRight="0" LabelPaddingTop="0"/>
            <ComponentArt:ItemLook LookID="CalendarTextItemLook" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="0" LabelPaddingLeft="0" LabelPaddingRight="0" LabelPaddingTop="0"/>
        </ItemLooks>
        <Items>
            <ComponentArt:MenuItem ID="PublishNow" Look-LeftIconUrl="icons_standard/ok.png" AutoPostBackOnSelect="true" />
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
                        <asp:ListItem Text="06:00" Value="6" />
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
                    <asp:Button runat="server" id="c_buttonTimePublish" onClick="ButtonTimePublish_Click" CssClass="litInputButton" style="width:auto;" />
                </Template>
            </ComponentArt:NavigationCustomTemplate>
        </ServerTemplates>
    </ComponentArt:Menu>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Status:StatusArea runat="server" ID="c_statusArea" IsWorkingCopy="True" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
        <iframe src="<%=SelectedPagePath%>" class="litModuleIframeWithTreeAreaV2" style="width: 100%; height: 100%;" scrolling="auto" frameborder="0" id="iframeTest"></iframe>
    </div>
</asp:Content>