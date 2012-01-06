<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_OtherSettings, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconTemplate" /><Foundation:ModuleString Name="OtherSettings" runat="server"/>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <fieldset class="litFieldset">
            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString5" Name="DeleteVersions" runat="server"/></legend>
            <br />
		    <asp:Repeater id="c_repeaterWebSites" runat="server" OnItemCommand="DeleteVersionCommand">
	            <ItemTemplate>
	                 <table width="100%">
                        <tr>
                            <td class="litText">
								<asp:Label ID="Label1" runat="server" style="margin-bottom:5px;"><%# DataBinder.Eval(Container.DataItem,"Name") %></asp:Label>
								<asp:Label ID="Label2" runat="server" Visible="false"></asp:Label>
							</td>
				            <td align="right" valign="bottom">
								<asp:Button ID="Button1" runat="server" CssClass="litInputButton" CommandName="DeleteWebSiteVersions" />
							</td>
				        </tr>
				    </table>
	            </ItemTemplate>
	        </asp:Repeater> 
	    </fieldset>
	    <br />
        <fieldset class="litFieldset">
            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="DeleteVisitStatistics" runat="server"/></legend>
            <img src="images/transparent.gif" width="5" alt="" /><br />
            <div>
                <div class="litText">
                    <Foundation:ModuleString ID="ModuleString4" Name="DeleteVisitStatisticsInfo" runat="server"/>
                </div>
                <br />
                    <table width="100%">
                        <tr>
                            <td>
                                <ComponentArt:Calendar runat="server"
                                    id="c_calendarVisitStatistics"
                                    AutoPostBackOnSelectionChanged="true"
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
                                    TodayDayCssClass="litCalendarToday"
                                    NextPrevCssClass="litCalendarNextPrev" 
                                    OtherMonthDayCssClass="litCalendarOtherMonthDay" 
                                    SelectedDayCssClass="litCalendarSelectedDay" 
                                    SelectMonthCssClass="litCalendarSelector"
                                    SelectWeekCssClass="litCalendarSelector">
                                </ComponentArt:Calendar>
				            </td>
				            <td align="right" valign="bottom">
                                <asp:Button ID="c_deleteVisitStatics" runat="server" CssClass="litInputButton" CommandName="DeleteVisitStatistics"/>
				            </td>
				        </tr>
				    </table>
                
            </div>
        </fieldset>
	    <br />
        <fieldset class="litFieldset">
            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="EmptyTrashcans" runat="server"/></legend>
            <br />
            <table width="100%">
                <tr>
                    <td class="litText">
						<Foundation:ModuleString ID="ModuleString6" Name="EmptyTrashcansInfo" runat="server"/>
					</td>
					<td align="right" valign="bottom">
						<asp:Button ID="c_emptyTrashcans" runat="server" CssClass="litInputButton" CommandName="EmptyTrashcans" />
					</td>
		        </tr>
		    </table>
        </fieldset>
	    <br />
        <fieldset class="litFieldset">
            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString7" Name="EmptyArchives" runat="server"/></legend>
            <br />
            <table width="100%">
                <tr>
                    <td class="litText">
						<Foundation:ModuleString ID="ModuleString8" Name="EmptyArchivesInfo" runat="server"/>
					</td>
					<td align="right" valign="bottom">
						<asp:Button ID="c_emptyArchives" runat="server" CssClass="litInputButton" CommandName="EmptyArchives" />
					</td>
		        </tr>
		    </table>
        </fieldset>
	    <br />
        <fieldset class="litFieldset">
            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="UserAgentHeader" runat="server"/></legend>
			<div style="margin-bottom: 8px; margin-top: 8px;">
				<Foundation:ModuleString CssClass="litText" ID="ModuleString9" Name="UserAgentInfo" runat="server"/>
			</div>
            <table width="100%">
                <tr>
                    <td class="litText">
						<asp:FileUpload ID="c_userAgentFile" Font-Size="11px" runat="server" /><asp:RequiredFieldValidator ControlToValidate="c_userAgentFile" ValidationGroup="UserAgent" runat="server" ID="c_userAgentFileValidator" Display="Dynamic"><asp:Image runat="server" CssClass="litIconError" ImageUrl="../Images/Transparent.gif" style="vertical-align: middle;" /><Foundation:SystemString runat="server" Name="RequiredField" /></asp:RequiredFieldValidator>
					</td>
					<td align="right" valign="bottom">
						<asp:Button runat="server" ID="c_userAgentSend" OnClick="UserAgentSend_Click" ValidationGroup="UserAgent" CssClass="litInputButton" />
					</td>
		        </tr>
		    </table>
        </fieldset>
    </div>
</asp:Content>

