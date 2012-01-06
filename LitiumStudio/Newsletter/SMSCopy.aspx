<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_SMSCopy, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <script type="text/javascript">
        // Shows confirmation dialogs for actions of toolbar menu items.
        function SendMenu_ItemSelect(sender, eventArgs) {
            if (eventArgs.get_item().get_id() == "SendNow") {
                if (!confirm('<%=SendNowConfirmationText%>'))
                    eventArgs.set_cancel(true);
            }
            if (eventArgs.get_item().get_id() == "ScheduledSending" || eventArgs.get_item().get_id() == "ScheduledSendingCalendar" || eventArgs.get_item().get_id() == "ScheduledSendingButton") {
                eventArgs.set_cancel(true);
            }
        }
     </script>
      <ComponentArt:ToolBar ID="ToolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand" runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown" DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items>
            <ComponentArt:ToolBarItem ID="Cancel" ImageUrl="icons_standard/sign_stop.png" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem ID="Save" ImageUrl="icons_standard/floppy_disk_blue.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif" ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem ID="Send" ImageUrl="icons_standard/send_16px.png" ItemType="DropDown" DropDownId="SendMenu"
                DropDownImageUrl="toolbar/dropdown.gif" DropDownImageWidth="16" DropDownImageHeight="16"  ClientTemplateId="c_toolbarLeftTreeItemButtonDropDownTemplate"/>
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
    <ComponentArt:Menu runat="server" ID="SendMenu" OnItemSelected="SendMenu_OnItemSelected" ImagesBaseUrl="~/LitiumStudio/Images/" CssClass="litNavMenuGroup" DefaultItemLookID="DefaultItemLook" DefaultGroupItemSpacing="1" DefaultItemTextAlign="Left" DefaultItemTextWrap="false" DefaultGroupExpandOffsetX="0" DefaultGroupExpandOffsetY="0" DefaultGroupExpandDirection="Auto" TopGroupExpandDirection="BelowLeft" TopGroupExpandOffsetY="0" CollapseDuration="100" CollapseSlide="ExponentialDecelerate" ExpandDuration="100" ExpandSlide="ExponentialDecelerate" ExpandDelay="0" ExpandOnClick="false" CascadeCollapse="true" CollapseDelay="10000" HideSelectElements="false" HighlightExpandedPath="true" KeyboardEnabled="true" OverlayWindowedElements="true" ShadowColor="Gray" ShadowEnabled="true" ShadowOffset="2" Orientation="Vertical" ContextMenu="Custom">
           <ItemLooks>
            <ComponentArt:ItemLook LookID="DefaultItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="ExpandableItemLook" RightIconUrl="menu/arrow.gif" RightIconWidth="20" RightIconHeight="15" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="DisabledItemLook" LeftIconHeight="16" LeftIconWidth="16" CssClass="litNavMenuItem litDisabled" LabelPaddingBottom="4" LabelPaddingLeft="10" LabelPaddingRight="10" LabelPaddingTop="3"/>
            <ComponentArt:ItemLook LookID="CalendarItemLook" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" LabelPaddingBottom="0" LabelPaddingLeft="0" LabelPaddingRight="0" LabelPaddingTop="0"/>
            <ComponentArt:ItemLook LookID="CalendarTextItemLook" CssClass="litNavMenuItem" ExpandedCssClass="litNavMenuItemExpanded" ActiveCssClass="litNavMenuItemActive" HoverCssClass="litNavMenuItemHover" LabelPaddingBottom="0" LabelPaddingLeft="0" LabelPaddingRight="0" LabelPaddingTop="0"/>
        </ItemLooks>
        <Items>
            <ComponentArt:MenuItem ID="SendNow" Look-LeftIconUrl="icons_standard/send_16px.png" AutoPostBackOnSelect="true" />
            <ComponentArt:MenuItem ID="ScheduledSending" LookId="ExpandableItemLook" DefaultSubGroupCssClass="litNavMenuGroup" Look-LeftIconUrl="icons_standard/clock.png" >
                <ComponentArt:MenuItem ID="ScheduledSendingCalendar" LookId="CalendarItemLook" ServerTemplateId="CalendarTemplate" />
                <ComponentArt:MenuItem ID="ScheduledSendingButton" LookId="CalendarItemLook" ServerTemplateId="TimeTemplate" />
            </ComponentArt:MenuItem>
         </Items>
         <ClientEvents>
            <ItemSelect EventHandler="SendMenu_ItemSelect" />
        </ClientEvents>
        <ServerTemplates>
            <ComponentArt:NavigationCustomTemplate ID="CalendarTemplate">
                <Template>
                    <ComponentArt:Calendar runat="server" SelectedDate="<%#ScheduledSendingDate%>"
                        id="c_calendarScheduledSending" 
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
                        MonthCssClass="litCalendarMonth"
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
                    <asp:DropDownList runat="server" ID="c_dropDownListScheduledSending" SelectedValue="<%#ScheduledSendingTime%>" CssClass="litInputSelect" style="width:auto;">
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
                    <asp:Button runat="server" id="c_buttonScheduledSending" onClick="ButtonScheduledSending_Click" CssClass="litInputButton" style="width:auto;" />
                </Template>
            </ComponentArt:NavigationCustomTemplate>
        </ServerTemplates>
    </ComponentArt:Menu>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
	<img src="Images/transparent.gif" alt="" class="litIconCircularCirculars" /><Foundation:ModuleString ID="ModuleString5" Name="CircularCopySubHeader1" runat="server" />&nbsp;<span style="font-weight:normal;">(<Foundation:ModuleString Name="CircularCopySubHeader2" runat="server" ID="Systemstring2"/>)</span>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
            <tr>
                <td class="litText"><Foundation:ModuleString ID="ModuleString1" Name="CircularCopyDescription1" runat="server" /><br /><br /></td>
            </tr>
            <tr>
                <td class="litText"><Foundation:ModuleString ID="ModuleString2" Name="CircularCopyDescription2" runat="server" /><br /><br /></td>
            </tr>
            <tr>
                <td><span class="litErrorMsg"></span><asp:RadioButtonList Runat="server" ID="mc_rblRecipientsHandling" AutoPostBack="True" /></td>
            </tr>
            <tr>
                <td>&nbsp;</td>
            </tr>
            <tr>
                <td>
                    <asp:Panel Runat="server" ID="mc_panelAddressList" Enabled="False">
		                <table border="0" cellspacing="0" cellpadding="0">
			                <tr>
                                <td class="litBoldText"><Foundation:ModuleString ID="ModuleString4" Name="PhoneLists" runat="server" /><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></td>
	                        </tr>
                            <tr>
                                <td>
                                    <table>
                                        <asp:Repeater runat="server" ID="c_addressListRepeater">
                                            <ItemTemplate>
                                                <tr>
                                                    <td>
                                                        <asp:CheckBox runat="server" ID="c_addressListCheckBox" />
                                                        <asp:Label runat="server" CssClass="litText" ID="c_addressListLabel"></asp:Label>
                                                        <asp:TextBox runat="server" ID="c_addressListID" Visible="false" />
                                                    </td>
                                                </tr>
                                            </ItemTemplate>
                                        </asp:Repeater>
                                    </table>
                                </td>
                            </tr>
		                </table>
	                </asp:Panel><br />
	                <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
		                <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
			                <asp:Label id="c_labelMajorError" runat="server"/>
		                </fieldset>
	                </asp:Panel>
	                 <asp:Panel id="c_panelInfo" visible="False" runat="server"> 
		                <fieldset class="litErrorFieldset"><br />
			                <asp:Label id="c_labelInfo" runat="server"/>
		                </fieldset>
	                </asp:Panel>
                </td>
            </tr>	
        </table>
    </div>
</asp:Content>