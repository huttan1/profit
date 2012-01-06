<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesAdvanced, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarAdvanced" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemAdvancedAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemAdvancedAbort" runat="server"/>	
        <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
        <toolbar:ToolbarItem CausesValidation="true" OnClick="ToolbarItemAdvancedSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemAdvancedSave" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconGear" />
	<Foundation:ModuleString ID="ModuleString16" name="AdvancedHeader" runat="server" />
	<asp:Label runat="Server" ID="c_labelPageName" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll" >
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
	        <tr>
		        <td colspan="2" valign="top">
		            <span class="litBoldText"><Foundation:ModuleString Name="Address" runat="server" ID="Modulestring9"/></span><br />
                    <span class="litText"><asp:Label ID="c_labelPagePath" Runat="server"/></span>
                    <div style="height:15px;"></div>
                    <table cellpadding="0" cellspacing="0" border="0">
				        <tr valign ="top">
					        <td style="width:90px;" valign="top">
						        <img src="<%=TemplateThumbnailUrl%>" width="90" height="110" style="margin-top:2px;" alt="" />
					        </td>
					        <td valign="top" style="PADDING-LEFT: 10px">
						        <span class="litBoldText"><Foundation:ModuleString Name="PageType" runat="server" ID="Modulestring10"/></span><br />
						        <span class="litText"><asp:Label ID="c_labelPageType" Runat="server"/></span><br /><br />
						        <span class="litBoldText"><Foundation:ModuleString Name="Template" runat="server" ID="Modulestring11"/></span><br />
						        <span class="litText"><asp:Label ID="c_labelTemplate" Runat="server"/></span><br /><br />
						        <span class="litText"><Foundation:ModuleString ID="ModuleString1" Name="TemplateDescription" runat="server" /></span>
					        </td>
				        </tr>
			        </table>
			        <div style="height:15px;"></div>
			        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString14" name="AdvancedStartPage" runat="server" /></span><br />
			        <asp:CheckBox id="c_startPage" cssclass="litInputCheckbox" runat="server" /><span class="litText"><Foundation:ModuleString name="AdvancedStartPageIsSelected" runat="server" ID="Modulestring17"/></span>
			        <br />
			        <div style="height:15px;"></div>
			        <span class="litBoldText"><Foundation:ModuleString name="AdvancedDisabledInMenu" runat="server" ID="Modulestring7"/></span><br />
			        <asp:CheckBox id="c_checkBoxDisabledInMenu" cssclass="litInputCheckbox" runat="server"/>
			        <span class="litText"><Foundation:ModuleString name="AdvancedDisabledInMenuDescription" runat="server" ID="Modulestring8"/></span>
			        <div style="height:15px;"></div>
			        <span class="litBoldText"><Foundation:ModuleString name="AdvancedShowAtSiteMap" runat="server" ID="Modulestring4"/></span><br />
			        <asp:CheckBox id="c_checkBoxShowAtSiteMap" cssclass="litInputCheckbox" runat="server"/>
			        <span class="litText"><Foundation:ModuleString name="AdvancedShowAtSiteMapDescription" runat="server" ID="Modulestring6"/></span>
			        <div style="height:15px;"></div>
			       
			       <asp:Panel runat="server" ID="c_prospectFinderPanel">
						<span class="litBoldText"><Foundation:ModuleString name="ProspectFinder" runat="server" ID="Modulestring18"/></span><br />
						<asp:CheckBox id="c_prospectFinder" CssClass="litInputCheckbox" runat="server"/>
						<span class="litText"><Foundation:ModuleString name="ProspectFinderUse" runat="server" ID="Modulestring19"/> <asp:Label runat="server" ForeColor="Red" Visible="false" id="c_prospectFinderError"><Foundation:ModuleString runat="server" Name="ProspectFinderToManyPages" /></asp:Label></span>
						<div style="height:15px;"></div>
			       </asp:Panel>
			       <span class="litBoldText"><Foundation:ModuleString name="AdvancedUnpublishDate" runat="server" ID="Modulestring5"/></span><br />
                    <asp:CheckBox id="c_checkBoxUnpublish" cssclass="litInputCheckbox" runat="server" style="padding-bottom: 5px;"/><br />
			        <ComponentArt:Calendar runat="server"
                        id="c_calendarUnpublish"
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
			        <span class="litText"><Foundation:ModuleString name="AdvancedUnpublishDateDescription" runat="server" ID="Modulestring12"/></span>
			        <div style="height:15px;"></div>
			        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString13" name="AdvancedArchive" runat="server"/></span><br />
			        <asp:CheckBox id="c_checkBoxArchive" CssClass="litInputCheckbox" style="margin-right:5px;" runat="server"/>
			        <ComponentArt:Calendar runat="server"
                        id="c_calendarAutoArchive"
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
			        <asp:Literal runat="server" Text="white" ID="c_literalChangeAutoArchiveCalendarHeaderBackground" Visible="false"/>
			        <span class="litText"><Foundation:ModuleString name="AdvancedArchiveDescription" runat="server" ID="Modulestring15"/></span>
		        </td>
	        </tr>
        </table>
    </div>
    <script type="text/javascript">
    	var focusObject = null;
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemAdvancedSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemAdvancedAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>