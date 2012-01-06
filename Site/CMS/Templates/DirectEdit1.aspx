<%@ Page Language="C#" CodeFile="DirectEdit1.aspx.cs" Inherits="Templates_DirectEdit1" ValidateRequest="false"%>
<%@ Register TagPrefix="de" Namespace="Litium.Extensions.DirectEdit.WebControls" Assembly="Litium.Extensions" %>
<%@ Register TagPrefix="ComponentArt" Namespace="ComponentArt.Web.UI" Assembly="ComponentArt.Web.UI" %>
<asp:content id="Content1" contentplaceholderid="Content" runat="Server">
	<link rel="stylesheet" type="text/css" href="<% = ResolveUrl("~/Site/CMS/Templates/DirectEdit/foundation.css") %>" />
	<link rel="stylesheet" type="text/css" href="<% = ResolveUrl("~/Site/CMS/Templates/DirectEdit/skin.css") %>" />
	<style type="text/css">
		.deInputTextarea{ font-family:Arial!important; font-size:110%; }
	</style>

	<asp:PlaceHolder id="m_placeHolderNoEditPage" visible="false" runat="server">
		<h1><web:Text Name="Title" runat="server" /></h1>
		<web:Text Name="Text" runat="server" />
	</asp:PlaceHolder>

	<asp:PlaceHolder id="m_placeHolderContent" runat="server">
		<h1><web:Text Name="Title" runat="server" /></h1>
		<web:Text Name="Text" runat="server" />

		<div class="DirectEditToolBarBackGround DirectEditToolbar1Borders">
		<ComponentArt:ToolBar ID="m_toolBar1" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand" runat="server" CssClass="DirectEditToolbar" DefaultItemCssClass="DirectEditToolbarItemNew" DefaultItemHoverCssClass="DirectEditToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown" DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/Pages/Images/" ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
			<Items>
				<ComponentArt:ToolBarItem ID="Cancel" CausesValidation="False" ImageUrl="~/litiumstudio/Images/icons_standard/sign_stop.png" />
				<ComponentArt:ToolBarItem ID="Delete" CausesValidation="False" ImageUrl="~/litiumstudio/Images/icons_standard/delete.png" />
				<ComponentArt:ToolBarItem ID="View" CausesValidation="true" ImageUrl="~/litiumstudio/Images/icons_standard/view.png" />
			</Items>
		</ComponentArt:ToolBar>
		</div>
		<div class="DirectEditToolBarBackGround DirectEditToolbar2Borders">	
			<ComponentArt:ToolBar ID="m_toolBar2" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand" runat="server" CssClass="DirectEditToolbar" DefaultItemCssClass="DirectEditToolbarItemNew" DefaultItemHoverCssClass="DirectEditToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown" DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/Pages/Images/" ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
				<Items>
					<ComponentArt:ToolBarItem ID="Save" CausesValidation="true" ImageUrl="~/litiumstudio/Images/icons_standard/floppy_disk_blue.png" />
					<ComponentArt:ToolBarItem ID="SaveForPublish" CausesValidation="true" ImageUrl="~/litiumstudio/Images/icons_standard/hand_green_card.png" />
					<ComponentArt:ToolBarItem ID="Publish" CausesValidation="true" ImageUrl="~/litiumstudio/Images/icons_standard/ok.png"/>
				</Items>
			</ComponentArt:ToolBar>
		</div>
		<div style="border: 1px solid #A19E98; padding: 10px;">
			<asp:CustomValidator runat="server" Display="dynamic" ID="NewsDateContinuityValidator">Slutdatum måste ligga efter startdatum</asp:CustomValidator>
			
			<asp:Panel id="m_panelNewPageFields" runat="server">
				<span class="litBoldText"><web:Text ID="Text1" Name="PageNameTitle" runat="server" /><asp:Image runat="server" ImageUrl="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" /></span><asp:RequiredFieldValidator id="m_requiredFieldValidatorPageName" ControlToValidate="m_textBoxPageName" Text="Du måste ange ett namn på sidan" runat="server" class="litErrorMsg" /><br />
				<asp:TextBox id="m_textBoxPageName" runat="server" /><br />
			</asp:Panel>
			
		
			<de:EditPropertyRepeater ID="m_editPropertyRepeater" runat="server">
				<BooleanTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName1" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon1" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/><br />
					<de:BooleanCheckBox ID="BooleanCheckBox1" runat="server">
						<BooleanItemTemplate>
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td valign="middle" style="width:100%;" id="tdBoolean" runat="server"><asp:Label id="labelBoolean" CssClass="litText" runat="server"/><asp:CheckBox id="checkBoxBoolean" cssclass="litInputCheckbox" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelBooleanRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonBooleanRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelBooleanAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonBooleanAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0"  runat="server"/></td>
								</tr>
							</table>
						</BooleanItemTemplate>
					</de:BooleanCheckBox>
					<div style="height:5px;"></div>
				</BooleanTemplate>
				<DateTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName3" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon3" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>&nbsp;
					<de:DateCalendar ID="DateCalendar1" HeaderBackground="white" runat="server">
						<DateItemTemplate>
							<de:LitCustomValidator cssClass="litErrorMsg" id="validatorMandatoryDateCalendar" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td><asp:Label id="labelDate" CssClass="litText" runat="server"/>
										<ComponentArt:Calendar runat="server"
											id="calendarDate"
											AutoPostBackOnSelectionChanged="false"
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
									<td style="width:100%; padding-left:10px!important;" valign="bottom"><asp:HyperLink id="hyperLinkDate" CssClass="litText" runat="Server" /></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelDateRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelDateAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
								</tr>
							</table>
						</DateItemTemplate>
					</de:DateCalendar>
					<div style="height:5px;"></div>
				</DateTemplate>
				<DateTimeTemplate>
					<span class="litBoldText"><de:PropertyName runat="server"/></span><de:MandatoryIcon src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>&nbsp;
					<de:DateTimeCalendar ID="DateTimeCalendar1" HeaderBackground="white" runat="server">
						<DateTimeItemTemplate>
							<de:LitCustomValidator cssClass="litErrorMsg" id="validatorMandatoryDateTimeCalendar" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td><asp:Label id="labelDateTime" CssClass="litText" runat="server"/>
										<ComponentArt:Calendar runat="server"
											id="calendarDateTime"
											AutoPostBackOnSelectionChanged="false"
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
									<td style="width:100%; padding-left:10px!important;" valign="bottom"><asp:TextBox ID="textBoxDateTime" cssclass="litText" style="width:35px;" runat="server"/><de:LitCustomValidator cssClass="litErrorMsg" id="validatorTimeDateTimeCalendar" runat="server"/><br /><asp:HyperLink id="hyperLinkDateTime" CssClass="litText" runat="Server" /></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelDateTimeRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateTimeRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelDateTimeAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDateTimeAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
								</tr>
							</table>
						</DateTimeItemTemplate>
					</de:DateTimeCalendar>
					<div style="height:5px;"></div>
				</DateTimeTemplate>
				<IntegerTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName4" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon4" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>&nbsp;
					<de:IntegerTextBox ID="IntegerTextBox1" runat="server">
						<IntegerItemTemplate>
							<de:LitCustomValidator cssClass="litErrorMsg" id="validatorMandatoryInteger" runat="server"/><de:LitCustomValidator cssClass="litErrorMsg" id="validatorInteger" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td valign="middle" style="width:100%;" id="tdInteger" runat="server"><asp:Label id="labelInteger" CssClass="litText" runat="server"/><asp:TextBox id="textBoxInteger" cssclass="litText" style="width:50px;" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelIntegerRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonIntegerRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelIntegerAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonIntegerAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
								</tr>
							</table>
						</IntegerItemTemplate>
					</de:IntegerTextBox>
					<div style="height:5px;"></div>
				</IntegerTemplate>
				<DecimalTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName2" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon2" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>&nbsp;
					<de:DecimalTextBox ID="DecimalTextBox1" runat="server">
						<DecimalItemTemplate>
							<de:LitCustomValidator cssClass="litErrorMsg" id="validatorMandatoryDecimal" runat="server"/><de:LitCustomValidator cssClass="litErrorMsg" id="validatorDecimal" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td valign="middle" style="width:100%;" id="tdDecimal" runat="server"><asp:Label id="labelDecimal" CssClass="litText" runat="server"/><asp:TextBox id="textBoxDecimal" cssclass="litText" style="width:50px;" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelDecimalRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDecimalRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelDecimalAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonDecimalAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
								</tr>
							</table>
						</DecimalItemTemplate>
					</de:DecimalTextBox>
					<div style="height:5px;"></div>
				</DecimalTemplate>
				<ShortStringTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName5" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon5" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>&nbsp;
					<de:ShortStringTextBox ID="ShortStringTextBox1" runat="server">
						<ShortStringItemTemplate>
							<de:LitCustomValidator id="validatorMandatoryShortString" cssClass="litErrorMsg" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td valign="middle"><asp:Label id="labelShortString" CssClass="litText" runat="server"/></td>
									<td style="width:100%;"><asp:TextBox id="textBoxShortString" CssClass="litInputText litInputFullWidth" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelShortStringRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonShortStringRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelShortStringAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonShortStringAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
								</tr>
							</table>
						</ShortStringItemTemplate>
					</de:ShortStringTextBox>
					<div style="height:5px;"></div>
				</ShortStringTemplate>
				<LongStringSimpleTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName7" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon7" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>&nbsp;
					<de:LongStringTextBox ID="LongStringTextBox1" runat="server">
						<LongStringSimpleItemTemplate>
							<de:LitCustomValidator id="validatorMandatoryLongStringSimple" cssClass="litErrorMsg" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td valign="top"><asp:Label id="labelLongStringSimple" CssClass="litText" runat="server"/></td>
									<td style="width:100%;"><asp:TextBox id="textBoxLongStringSimple" CssClass="litInputTextArea litInputFullWidth deInputTextarea" textMode="multiline" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelLongStringSimpleRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringSimpleRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelLongStringSimpleAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringSimpleAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
								</tr>
							</table>
						</LongStringSimpleItemTemplate>
					</de:LongStringTextBox><div style="height:5px;"></div>
				</LongStringSimpleTemplate>
				<LongStringTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName8" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon8" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>&nbsp;
					<de:LongStringEditor ID="LongStringEditor1" runat="server">
						<LongStringItemTemplate>
							<de:LitCustomValidator id="validatorMandatoryLongString" cssClass="litErrorMsg" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td valign="top"><asp:Label id="labelLongString" CssClass="litText" runat="server"/></td>
									<td style="width:100%;"><de:HTMLEditor id="editorLongString" width="100%" Height="220" cssclass="litInputTextArea litInputFullWidth" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelLongStringRemove" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
									<td style="width:16px;" valign="top"><asp:panel id="panelLongStringAdd" CssClass="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonLongStringAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
								</tr>
							</table>
						</LongStringItemTemplate>
					</de:LongStringEditor><div style="height:5px;"></div>
				</LongStringTemplate>
				<ImageTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName2" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon2" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>
					<de:ImageField ID="ImageField1" runat="server">
						<ImageItemTemplate>
							<de:LitCustomValidator id="validatorImageToLarge" cssClass="litErrorMsg" runat="server"/><br />
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td valign="top" style="padding-right:10px!important;"><table style="height:62px; width:74px; padding:5px; background-color:white; border:1px solid gray;"><tr><td align="center" valign="middle"><de:LitCustomValidator cssClass="litErrorMsg" id="validatorMandatoryImage" Display="Dynamic" runat="server"/><asp:Label cssClass="litErrorMsg" id="labelImageFromMediaArchive" visible="false" runat="server" /><asp:Image id="imgImage" runat="server"/></td></tr></table></td>
									<td style="width:100%;" valign="top">
										<asp:Panel style="padding-bottom:5px" id="panelImageArray" runat="server">
												<table cellpadding="0" cellspacing="0" border="0" width="100%">
													<tr>
														<td style="width:100%;">
															<asp:DropDownList cssClass="litInputSelect litInputFullWidth" AutoPostBack="true" id="dropDownListImageArray" runat="server"/>
														</td>
														<td style="width:16px;" valign="top"><asp:panel id="panelImageRemove" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonImageRemove" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
														<td style="width:16px;" valign="top"><asp:panel id="panelImageAdd" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonImageAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
													</tr>
												</table>
										</asp:Panel>
										<div style="padding-bottom:5px">
											<table cellpadding="0" cellspacing="0" border="0" width="100%">
												<tr>
													<td style="width:100%;">
														<table cellpadding="0" cellspacing="0" border="0" width="100%">
															<tr>
																<asp:PlaceHolder id="placeHolderBrowse" runat="server">
																	<td><input type="file" id="inputImage" size="25" class="litInputFile" runat="server"/></td>
																</asp:PlaceHolder>	
																<asp:PlaceHolder id="placeHolderOr" runat="server">
																	<td class="litText">&nbsp;Ladda upp en fil eller?<Foundation:ModuleString ID="ModuleString3" name="FileUploadOrMediaArchive" />&nbsp;</td>
																</asp:PlaceHolder>	
																<asp:PlaceHolder id="placeHolderFromMediaArchive" runat="server">
																	<td style="padding-right:3px; width:100%;"><asp:TextBox id="textBoxImageID" class="litInputText" style="width:95%;" ReadOnly="true" runat="server"/></td>
																	<td><input type="button" id="buttonFromMediaArchive" class="litInputButton" style="width:auto;margin-left:2px;" runat="server"/><input type="hidden" id="hiddenInputImageID" runat="server"/></td>
																</asp:PlaceHolder>	
															</tr>
														</table>
													</td>
													<td style="width:16px;" valign="top"><asp:panel id="panelImageDelete" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonImageDelete" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
												</tr>
											</table>
										</div>	
										<div style="padding-bottom:5px"><span class="litText">Bildtext<Foundation:ModuleString ID="ModuleString4" name="ImageText" /></span><br /><asp:TextBox id="textBoxImageText" style="width:82%;" cssClass="litInputText" runat="server"/></div>
										<asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/warning_16px.png")%>" style="vertical-align:middle;" alt="" />Varning 1<Foundation:ModuleString ID="ModuleString5" name="WarningImageFromMediaArchive1" /></div></asp:Panel>
										<asp:Panel id="panelMediaArchiveMessage2" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/warning_16px.png")%>" alt="" />Varning 2<Foundation:ModuleString ID="ModuleString6" name="WarningImageFromMediaArchive2" /></div></asp:Panel>
									</td>
								</tr>
							</table>
						</ImageItemTemplate>
					</de:ImageField>	
				</ImageTemplate>
				<FileTemplate>
					<span class="litBoldText"><de:PropertyName ID="PropertyName6" runat="server"/></span><de:MandatoryIcon ID="MandatoryIcon6" src="~/LitiumStudio/Images/icons_standard/required.png" align="AbsMiddle" border="0" runat="server"/>
					<de:FileField ID="FileField1" DisabledCssClass="litToolbarItemDisabled" runat="server">
						<FileItemTemplate>
							<table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
								<tr>
									<td style="width:100%;" valign="top">
										<asp:Panel style="padding-bottom:5px" id="panelFileInput" runat="server">
											<de:LitCustomValidator id="validatorMandatoryFile" Display="Dynamic" runat="server"/>
											<table cellpadding="0" cellspacing="0" border="0" width="100%">
												<tr>
													<asp:PlaceHolder id="placeHolderBrowseFile" runat="server">
														<td><input type="file" id="inputFile" size="25" class="litInputFile" runat="server"/></td>
													</asp:PlaceHolder>	
													<asp:PlaceHolder id="placeHolderOrFile" runat="server">
														<td class="litText">&nbsp;Välj en fil?<Foundation:ModuleString ID="ModuleString3" name="FileUploadOrMediaArchive" />&nbsp;</td>
													</asp:PlaceHolder>	
													<asp:PlaceHolder id="placeHolderFileFromMediaArchive" runat="server">
														<td style="padding-right:3px; width:100%;"><asp:TextBox id="textBoxFileName" class="litInputText" style="width:95%;" ReadOnly="true" runat="server"/></td>
														<td><input type="button" id="buttonFileFromMediaArchive" class="litInputButton" style="width:auto;margin-left:2px;" runat="server"/><input type="hidden" id="hiddenInputFileID" runat="server"/></td>
													</asp:PlaceHolder>	
													<asp:PlaceHolder visible="false" id="placeHolderAddFile" runat="server">
														<td style="width:16px;" valign="top"><asp:panel id="panelFileAdd" class="litBlankAddDelete" runat="server"/><asp:ImageButton id="imageButtonFileAdd" ImageUrl="~/LitiumStudio/Images/icons_standard/add_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></td>
													</asp:PlaceHolder>
												</tr>
											</table>
										 </asp:Panel>
										 <table cellpadding="0" cellspacing="0" style="padding-bottom:5px" id="tableFile" border="0" width="100%" runat="server"> 
											<tr>
												<td style="width:100%;" class="litText"><asp:HyperLink id="hyperLinkFile" runat="server"/><asp:Label id="labelFileName" runat="server" /></td>
												<td style="width:16px;" valign="middle"><div class="litBlankAddDelete"><asp:ImageButton id="imageButtonFileUp" ImageUrl="~/LitiumStudio/Images/icons_standard/arrow_up_blue.png" ImageAlign="AbsMiddle" BorderWidth="0" style="margin-top:3px; margin-left:5px;" runat="server"/></div></td>
												<td style="width:16px;" valign="middle"><div class="litBlankAddDelete"><asp:ImageButton id="imageButtonFileDown" ImageUrl="~/LitiumStudio/Images/icons_standard/arrow_down_blue.png" ImageAlign="AbsMiddle" BorderWidth="0" style="margin-top:3px; margin-left:5px;" runat="server"/></div></td>
												<td style="width:16px;" valign="middle"><div class="litBlankAddDelete"><asp:ImageButton id="imageButtonFileDelete" ImageUrl="~/LitiumStudio/Images/icons_standard/delete_16px.png" ImageAlign="AbsMiddle" BorderWidth="0" runat="server"/></div></td>
											</tr>
										</table>	
										<asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/warning_16px.png")%>" style="vertical-align:middle;" alt="" />Varning 1<Foundation:ModuleString ID="ModuleString5" name="WarningFileFromMediaArchive1" /></asp:Panel>
										<asp:Panel id="panelMediaArchiveMessage2" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/Images/icons_standard/warning_16px.png")%>" alt="" />Varning 2<Foundation:ModuleString ID="ModuleString6" name="WarningFileFromMediaArchive2" /></asp:Panel>
									</td>
								</tr>
								<tr>
									<td><hr></td>
								</tr>
							</table>
						</FileItemTemplate>
					</de:FileField>	
				</FileTemplate>
			</de:EditPropertyRepeater>
			
			<span class="litBoldText"><web:Text Name="CommentTitle" runat="server" /></span><br />
			<asp:TextBox id="m_textBoxEditorNotes" cssclass="deInputTextarea" runat="server" Rows="7" width="95%" TextMode="Multiline"  />
			<asp:PlaceHolder id="m_placeHolderCommentHistory" visible="false" runat="server">
				<span class="litBoldText">Historik:</span><br />
				<asp:Label id="m_labelCommentHistory" runat="server" />
			</asp:PlaceHolder>
		</div>
	</asp:PlaceHolder>
</asp:content>
