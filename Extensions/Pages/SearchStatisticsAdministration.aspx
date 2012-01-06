<%@ Page Language="C#" CodeFile="SearchStatisticsAdministration.aspx.cs" MasterPageFile="~/LitiumStudio/Framework/ControlPanel.master" Inherits="Extensions.Pages.SearchStatisticsAdministration" %>
<%@ Import Namespace="Litium.Plus.Utilities"%>
<%@ Import Namespace="Litium.Foundation"%>
<%@ Register TagPrefix="plus" Namespace="Litium.Plus.CMS.WebControls" Assembly="Litium.Plus" %>
<asp:Content ContentPlaceHolderID="ToolbarRight" runat="server">
	<Toolbar:HorizontalToolbar ToolbarIndex="0" ID="c_toolbar" runat="server">
        <Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled"
            Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
            SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
            OnClickCode="Extensions.SearchStatisticsAdmin.ShowDeleteHistoryDialog(); return false;"
            ID="c_toolbarItemDeleteHistory" runat="server" />
    </Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="<% = ResolveUrl("~/Extensions/Common/Images/piechart_view_24px.png") %>" alt="" /><Foundation:SystemString ID="SystemString1" runat="server" Name="Extensions_SS_Administration_Header" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" runat="Server">
    <%--Place ALL javascript and css links here to follow XHTML rules--%>
    <link rel="stylesheet" href="Styles/searchstatisticsadmin.css" type="text/css" />
    <link rel="stylesheet" href="<% = ResolveUrl("~/Extensions/Common/Styles/jquery.ui/smoothness/smoothness.css") %>" type="text/css" />
    <link rel="stylesheet" href="<% = ResolveUrl("~/Extensions/Common/Styles/pager.css") %>" type="text/css" />
    
    <script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/jquery-1.3.2.min.js") %>"></script>
    <script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/jquery-ui-1.7.1.custom.min.js") %>"></script>
    <script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/i18n/ui.datepicker-" + FoundationContext.Culture.TwoLetterISOLanguageName + ".js") %>"></script>
    <script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/date.format.js") %>"></script>
    <script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Pages/Scripts/searchstatisticsadmin.js") %>"></script>
    <script type="text/javascript">
		$(document).ready(
			function()
			{
				dateFormat.i18n.dayNames = $.datepicker.regional['<% = FoundationContext.Culture.TwoLetterISOLanguageName %>'].dayNames;
				dateFormat.i18n.monthNames = $.datepicker.regional['<% = FoundationContext.Culture.TwoLetterISOLanguageName %>'].monthNames;
				dateFormat.i18n.dayNamesShort = $.datepicker.regional['<% = FoundationContext.Culture.TwoLetterISOLanguageName %>'].monthNamesShort;
				dateFormat.i18n.monthNamesShort = $.datepicker.regional['<% = FoundationContext.Culture.TwoLetterISOLanguageName %>'].monthNamesShort;
				
				// Set up administration helper scripts
				Extensions.SearchStatisticsAdmin.Init({
						Regional:'<% = FoundationContext.Culture.TwoLetterISOLanguageName %>',
						DialogButtons:{'<% = Solution.Instance.SystemStrings.GetValue("ButtonCancel", FoundationContext.User.Language.Culture, true) %>': function() { Extensions.SearchStatisticsAdmin.DialogCancel(this); }, 
									   '<% = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Toolbar_DeleteHistory", FoundationContext.User.Language.Culture, true) %>':function() { Extensions.SearchStatisticsAdmin.DialogOK(this); } },
						ConfirmDeleteOldStatisticsMessage:'<% = Solution.Instance.SystemStrings.GetValue("Extensions_SS_ConfirmDeleteStatistics", FoundationContext.User.Language.Culture, true) %>',
						SearchWordDetailsHeader:'<% = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Administration_ChoosenSearchWord", FoundationContext.User.Language.Culture, true) %>',
						NoHitPageText:'<% = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Administration_NoHitPageSelected", FoundationContext.User.Language.Culture, true) %>',
						NoDateSelectedMessage:'<% = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Administration_NoDateSelectedMessage", FoundationContext.User.Language.Culture, true) %>',
						UnknownErrorMessage:'<% = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Administration_UnknownErrorMessage", FoundationContext.User.Language.Culture, true) %>',
						OldLogsDeletedMessage:'<% = Solution.Instance.SystemStrings.GetValue("Extensions_SS_Administration_OldLogsDeletedMessage", FoundationContext.User.Language.Culture, true) %>'
					}
				);
			}
		);
	</script>
	
	<asp:PlaceHolder ID="c_placeHolderFiltering" Visible="false" runat="server">
		<script type="text/javascript">
			$(document).ready( function(){ $("#sectionContentFilter").hide(); $("#sectionHeaderFilterToggle").show(); } );
		</script>
	</asp:PlaceHolder>
    
    <!-- Content -->
    <div class="Section">
		<div class="SectionHeader ui-widget-header ui-corner-top ui-helper-clearfix">
			<div style="float:left;"><foundation:SystemString Name="Extensions_SS_Administration_Filter" runat="server" />:</div>
			<div id="sectionHeaderFilterToggle" style="float:right; display:none;"><img onclick="Extensions.SearchStatisticsAdmin.ToggleFilterBox(this);" src="<% = ResolveUrl("~/Extensions/Common/Images/navigate_down.png") %>" alt="" /></div>
		</div>
		<div id="sectionContentFilter" class="SectionContent">
			<strong><foundation:SystemString Name="Extensions_SS_Administration_ChooseWebSite" runat="server" />:</strong><br />
			<asp:DropDownList runat="server" ID="c_websiteSelector" />
			<div style="clear:both; margin-top:10px;"></div>
			<strong><foundation:SystemString Name="Extensions_SS_Administration_ChooseDateInterval" runat="server" />:</strong>
			<div class="DateIntervalLabel">
				<foundation:SystemString Name="Extensions_SS_Select_DateInterval" runat="server" />
			</div>
			<div class="DateIntervalDateLinks">
				<a href="SearchStatisticsAdministration.aspx" onclick="Extensions.SearchStatisticsAdmin.SetValueOnCalendars('<% = System.DateTime.Now.ToString("yyyy-MM-dd") %>', '<% = System.DateTime.Now.ToString("yyyy-MM-dd") %>'); return false;"><foundation:SystemString Name="Extensions_SS_Select_DateInterval_Today" runat="server" /></a>
				<a href="SearchStatisticsAdministration.aspx" onclick="Extensions.SearchStatisticsAdmin.SetValueOnCalendars('<% = DateUtilities.GetCurrentWeekStartDate().ToString("yyyy-MM-dd") %>', '<% = DateUtilities.GetCurrentWeekEndDate().ToString("yyyy-MM-dd") %>'); return false;"><foundation:SystemString Name="Extensions_SS_Select_DateInterval_ThisWeek" runat="server" /></a>
				<a href="SearchStatisticsAdministration.aspx" onclick="Extensions.SearchStatisticsAdmin.SetValueOnCalendars('<% = DateUtilities.GetPreviousWeekStartDate().ToString("yyyy-MM-dd") %>', '<% = DateUtilities.GetPreviousWeekEndDate().ToString("yyyy-MM-dd") %>'); return false;"><foundation:SystemString Name="Extensions_SS_Select_DateInterval_LastWeek" runat="server" /></a>
				<a href="SearchStatisticsAdministration.aspx" onclick="Extensions.SearchStatisticsAdmin.SetValueOnCalendars('<% = DateUtilities.GetCurrentMonthStartDate().ToString("yyyy-MM-dd") %>', '<% = DateUtilities.GetCurrentMonthEndDate().ToString("yyyy-MM-dd") %>'); return false;"><foundation:SystemString Name="Extensions_SS_Select_DateInterval_ThisMonth" runat="server" /></a>
			</div>
			<div class="DateIntervalDatePickers">
				<foundation:SystemString Name="Extensions_SS_Select_DateIntervalStartDate" runat="server" /><asp:TextBox ID="c_textBoxStartDate" Width="100" CssClass="DateField startDate" runat="server" />
				<foundation:SystemString Name="Extensions_SS_Select_DateIntervalEndDate" runat="server" /><asp:TextBox ID="c_textBoxEndDate" Width="100" CssClass="DateField endDate" runat="server" />
				&nbsp;<a href="SearchStatisticsAdministration.aspx" onclick="Extensions.SearchStatisticsAdmin.SetValueOnCalendars('', ''); return false;"><foundation:SystemString Name="Extensions_SS_Select_DateInterval_Clear" runat="server" /></a>
			</div>
			<div style="clear:both;"></div>
			<div style="text-align:right;"><asp:Button ID="c_buttonFilter" OnClick="ButtonFilter_Click" CssClass="ui-state-default ui-corner-all" runat="server" /></div>
			<div style="clear:both;"></div>
		</div>
    </div>
    <div class="Section">
		<div class="SectionHeader ui-widget-header ui-corner-top ui-helper-clearfix"><foundation:SystemString Name="Extensions_SS_Administration_SearchWord" runat="server" />:</span></div>
		<div class="SectionContent">
			<asp:PlaceHolder ID="c_placeHolderTable" runat="server">
				<table cellpadding="0" cellspacing="0" border="0" class="SearchedWords">
					<tr class="SearchedWordsTableHeader">
						<th><asp:LinkButton ID="c_linkButtonSortSearchWord" OnClick="LinkButtonSortColumn_Click" CommandArgument="SearchWord" runat="server"><foundation:SystemString Name="Extensions_SS_Administration_SearchWord" runat="server" /></asp:LinkButton>&nbsp;<asp:Image ID="c_imageSearchWordSortOrder" runat="server" /></th>
						<th style="width:125px;" class="center"><asp:LinkButton ID="c_linkButtonSortSearchCount" OnClick="LinkButtonSortColumn_Click" CommandArgument="SearchCount" runat="server"><foundation:SystemString Name="Extensions_SS_Administration_SearchCount" runat="server" /></asp:LinkButton>&nbsp;<asp:Image ID="c_imageSearchCountSortOrder" runat="server" /></th>
						<th style="width:150px;" class="center"><asp:LinkButton ID="c_linkButtonSortAverageHits" OnClick="LinkButtonSortColumn_Click" CommandArgument="AverageHits" runat="server"><foundation:SystemString Name="Extensions_SS_Administration_AverageHits" runat="server" /></asp:LinkButton>&nbsp;<asp:Image ID="c_imageAverageHitsSortOrder" runat="server" /></th>
					</tr>
					<asp:Repeater ID="c_repeaterSearchWords" OnItemDataBound="RepeaterSearchWords_ItemDataBound" runat="server">
						<ItemTemplate>
							<tr id="tableRow" runat="server">
								<td><asp:Literal ID="literalSearchWord" runat="server"></asp:Literal></td>
								<td class="center"><asp:Literal ID="literalSearchCount" runat="server"></asp:Literal></td>
								<td class="center"><asp:Literal ID="literalAverageHits" runat="server"></asp:Literal></td>
							</tr>
						</ItemTemplate>
					</asp:Repeater>
				</table>
			</asp:PlaceHolder>
            <plus:Pager id="c_pager"
				PageSize="15" 
				ShowFirstAndLastButtons="true"
				AllwaysShowPrevNextButtons="true" 
				ButtonPosition="Split" 
				EdgeEntries="3"
				DisplayedEntries="10"
				CssClass="pagination"
				EllipseWebSiteTextKey="Extensions_Pager_EllipseText"
				FirstButtonWebSiteTextKey="Extensions_Pager_FirstButtonText"
				LastButtonWebSiteTextKey="Extensions_Pager_LastButtonText"
				NextButtonWebSiteTextKey="Extensions_Pager_NextButtonText"
				PrevButtonWebSiteTextKey="Extensions_Pager_PrevButtonText"
				EllipseClass="ui-state-default"
				UseSystemStrings="true"
				SelectedItemClass="ui-state-active ui-corner-all"
				ItemClass="ui-state-default ui-corner-all"
				runat="server" 
			/>
			<div style="clear:both;"></div>
		</div>
	</div>
	<div id="sectionSearchHits" style="display:none;" class="Section">
		<div class="SectionHeader ui-widget-header ui-corner-top ui-helper-clearfix"><span id="choosenSearchWord"><foundation:SystemString Name="Extensions_SS_Administration_ChoosenSearchWord" runat="server" />:</span></div>
		<div class="SectionContent">
			<table cellpadding="0" cellspacing="0" border="0" id="ChoosenWordHitPages" class="SearchedWords">
				<tr class="SearchedWordsTableHeader">
					<th><foundation:SystemString Name="Extensions_SS_Administration_ChoosenHit" runat="server" /></th>
					<th style="width:100px;" class="center"><foundation:SystemString Name="Extensions_SS_Administration_Clicks" runat="server" /></th>
					<th style="width:150px;"><foundation:SystemString Name="Extensions_SS_Administration_LatestClick" runat="server" /></th>
				</tr>
			</table>
		</div>
    </div>
    
    <div id="DeletehistoryDialog" class="DeletehistoryDialog">
		<strong><foundation:SystemString Name="Extensions_SS_Administration_ChooseWebSiteToDeleteFrom" runat="server" />:</strong><br />
		<asp:DropDownList runat="server" ID="c_dropDownListDeleteOldStatisticsWebsiteSelector" /><br /><br />
		<strong><foundation:SystemString Name="Extensions_SS_Administration_ChooseToDate" runat="server" />:</strong><br />
		<asp:TextBox ID="c_textBoxDeleteOldStatisticsDate" Width="100" CssClass="DateField deleteOldStatisticsDate" runat="server" />
    </div>
</asp:Content>
