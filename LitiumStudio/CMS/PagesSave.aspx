<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesSave, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register TagPrefix="Status" TagName="StatusArea" Src="~/LitiumStudio/CMS/WebUserControls/StatusArea.ascx" %>
<%@ Register TagPrefix="Status" TagName="StatusAreaInfo" Src="~/LitiumStudio/CMS/WebUserControls/StatusAreaInfo.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioFilterArea" runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Closed" />
	<Status:StatusAreaInfo runat="server" ID="c_statusArea2" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarCreate" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemEditAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemEditAbort" runat="server"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemEditSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemEditSave" runat="server"/>
        <toolbar:ToolbarItem OnClick="ToolbarItemEditPublish_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPublish" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemEditPublish" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Status:StatusArea runat="server" ID="c_statusArea" IsWorkingCopy="true"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
        <script type="text/javascript">
        //<![CDATA[
        function CalendarOnSelectionChanged(){
            radioButtonSaveForScheduledPublishing = document.getElementById("<%=c_radioButtonSaveForScheduledPublishing.ClientID %>");
            if (radioButtonSaveForScheduledPublishing)
                radioButtonSaveForScheduledPublishing.checked = true
            RadioButtonOnClick();
        }
        function RadioButtonOnClick(){
            radioButtonDirectPublishing = document.getElementById("<%=c_radioButtonDirectPublishing.ClientID %>");
            radioButtonSaveForScheduledPublishing = document.getElementById("<%=c_radioButtonSaveForScheduledPublishing.ClientID %>");
            radioButtonReadyForPublishing = document.getElementById("<%=c_radioButtonReadyForPublishing.ClientID %>");
            radioButtonCancelScheduledPublishing = document.getElementById("<%=c_radioButtonCancelScheduledPublishing.ClientID %>");
            radioButtonCancelReadyForPublishing = document.getElementById("<%=c_radioButtonCancelReadyForPublishing.ClientID %>");
            document.getElementById('ToolbarItem_1_1').className = "litToolbarItem litToolbarItemDisabled";
            document.getElementById('ToolbarItem_1_2').className = "litToolbarItem litToolbarItemDisabled";

            if (radioButtonDirectPublishing){
                if (radioButtonDirectPublishing.checked){
                    document.getElementById('ToolbarItem_1_2').className = "litToolbarItem";
                }
            }
            if (radioButtonSaveForScheduledPublishing){
                if (radioButtonSaveForScheduledPublishing.checked && c_calendar.getSelectedDate() != null){
                    document.getElementById('ToolbarItem_1_2').className = "litToolbarItem";
                }
            }
            if (radioButtonReadyForPublishing){
                if (radioButtonReadyForPublishing.checked)
                    document.getElementById('ToolbarItem_1_1').className = "litToolbarItem";
            }
            if(radioButtonCancelScheduledPublishing){
                if (radioButtonCancelScheduledPublishing.checked)
                    document.getElementById('ToolbarItem_1_1').className = "litToolbarItem";
            }
            if(radioButtonCancelReadyForPublishing){
                if (radioButtonCancelReadyForPublishing.checked)
                    document.getElementById('ToolbarItem_1_1').className = "litToolbarItem";
            }
        }
        //]]>
        </script>
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
			<tr>
			    <td valign="top">
			        <table cellpadding="5" cellspacing="0" border="0">
			            <tr>
				            <td colspan="3" class="litHeader3" style="padding:0px;"><Foundation:ModuleString ID="ModuleString3" name="SelectSavingAlternativ" runat="server"/><br /><hr /></td>
                        </tr>
			            <asp:PlaceHolder id="c_placeHolderDirectPublishing" runat="server">
			                <tr>
					            <td valign="top"><asp:RadioButton id="c_radioButtonDirectPublishing" onClick="RadioButtonOnClick();" value="c_radioButtonDirectPublishing" checked="true" GroupName="publisingAlternatives" runat="server"/></td>
					            <td valign="top"><img src="<%=Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/ok.png")%>" style="vertical-align:middle;margin-top:2px;" alt="" /></td>
					            <td valign="top" style="width:100%;"><asp:label id="c_labelForRadioButtonDirectPublishing" runat="Server"/></td>
				            </tr>
			            </asp:PlaceHolder>
		                <asp:PlaceHolder id="c_placeHolderReadyForPublishing" runat="server">
			                <tr>
				                <td valign="top"><asp:RadioButton id="c_radioButtonReadyForPublishing" onClick="RadioButtonOnClick();" value="c_radioButtonReadyForPublishing" GroupName="publisingAlternatives" runat="server"/></td>
				                <td valign="top"><img src="<%=Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/hand_green_card.png")%>" style="vertical-align:middle;margin-top:2px;" alt="" /></td>
				                <td valign="top" style="width:100%;"><asp:label id="c_labelForRadioButtonReadyForPublishing" runat="Server"/></td>
			                </tr>
			            </asp:PlaceHolder>
		                <asp:PlaceHolder id="c_placeHolderCancelReadyForPublishing" runat="server">
            			    <tr>
					            <td valign="top"><asp:RadioButton id="c_radioButtonCancelReadyForPublishing" onClick="RadioButtonOnClick();" value="c_radioButtonCancelReadyForPublishing" GroupName="publisingAlternatives" runat="server"/></td>
					            <td valign="top"><img src="<%=Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/hand_green_card.png")%>" style="vertical-align:middle;margin-top:2px;" alt="" /></td>
				                <td valign="top" style="width:100%;"><asp:label id="c_labelForRadioButtonCancelReadyForPublishing" runat="Server"/></td>
			                </tr>
            			</asp:PlaceHolder>
			            <asp:PlaceHolder id="c_placeHolderSaveForScheduledPublishing" runat="server">
				            <tr>
					            <td valign="top"><asp:RadioButton id="c_radioButtonSaveForScheduledPublishing" onClick="RadioButtonOnClick();" value="c_radioButtonSaveForScheduledPublishing" GroupName="publisingAlternatives" runat="server"/></td>
					            <td valign="top"><img src="<%=Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/clock.png")%>" style="vertical-align:middle;margin-top:2px;" alt="" /></td>
					            <td valign="top" style="width:100%;"><asp:label id="c_labelForRadioButtonSaveForScheduledPublishing" runat="Server"/></td>
				            </tr>
				            <tr>
					            <td valign="top"></td>
					            <td valign="top"></td>
					            <td valign="top" style="width:100%;">
					                <div style="float:left;">
						                <ComponentArt:Calendar runat="server"
                                            id="c_calendar" 
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
                                            <ClientEvents>
                                                <SelectionChanged EventHandler="CalendarOnSelectionChanged" />
                                            </ClientEvents>
                                        </ComponentArt:Calendar>
                                    </div>
                                    <div style="float:left;">
                                        <span class="litBoldText">&nbsp;&nbsp;<Foundation:ModuleString ID="ModuleString2" Name="Time" runat="server"/>&nbsp;</span>
                                        <asp:DropDownList runat="server" ID="c_dropDownListTimePublish" CssClass="litInputSelect" style="width:auto;">
                                            <asp:ListItem Text="00:00" Value="0" Selected="True" />
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
                                    </div>
					            </td> 
				            </tr>
            			</asp:PlaceHolder>
            			<asp:PlaceHolder id="c_placeHolderCancelScheduledPublishing" runat="server">
            			    <tr>
					            <td valign="top"><asp:RadioButton id="c_radioButtonCancelScheduledPublishing" onClick="RadioButtonOnClick();" value="c_radioButtonCancelScheduledPublishing" GroupName="publisingAlternatives" runat="server"/></td>
					            <td valign="top"><img src="<%=Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/clock.png")%>" style="vertical-align:middle;margin-top:2px;" alt="" /></td>
					            <td valign="top" style="width:100%;"><asp:label id="c_labelForRadioButtonCancelScheduledPublishing" runat="Server"/></td>
				            </tr>
            			</asp:PlaceHolder>
				    </table>
				</td>
			</tr>
		</table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_radioButtonDirectPublishing.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemEditSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemEditAbort.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>