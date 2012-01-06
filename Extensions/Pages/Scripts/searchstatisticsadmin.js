Extensions = function(){}
Extensions.SearchStatisticsAdmin = function(){}
Extensions.SearchStatisticsAdmin.Settings = {
	Regional:"en",
	DialogTitle:"Delete old statistics",
	DialogButtons:{
		'Cancel' : function() { Extensions.SearchStatisticsAdmin.DialogCancel(this); }, 
		'Delete' : function() { Extensions.SearchStatisticsAdmin.DialogOK(this); }
	},
	SearchWordDetailsHeader:"Showing detailed information on ###",
	NoHitPageText:"No page selected",
	NoDateSelectedMessage:"You haveto select a date",
	UnknownErrorMessage:"Unknow error, please check log for more information.",
	OldLogsDeletedMessage:"Old logrows to ### deleted."
};

Extensions.SearchStatisticsAdmin.Init = function(settings)
{
	// Extend predefined settings with the provided settings
	$.extend(Extensions.SearchStatisticsAdmin.Settings, settings);
	
	// Init the calendars for start and end date
	Extensions.SearchStatisticsAdmin.InitCalendars();
	
	// Init the delete history dialog
	$("#DeletehistoryDialog").dialog({
		autoOpen: false, // We dont want the dialog to open on start
		buttons: Extensions.SearchStatisticsAdmin.Settings.DialogButtons, // We only need an ok button
		modal:true, // User should not be able to work with stuff behind the dialog
		width:500, // sets the default width to 500px
		title:Extensions.SearchStatisticsAdmin.Settings.DialogTitle, // sets the title of the dialog
		closeOnEscape:true, zIndex:999
	});
	
	$(".pagination a").each(function(){ $(this).hover(function(){ $(this).addClass("ui-state-hover"); }, function(){ $(this).removeClass("ui-state-hover"); }); });
	
	Extensions.SearchStatisticsAdmin.SetHoverOnTableRows("table.SearchedWords tr");
//	$("table.SearchedWords tr").each(
//		function(){ 
//		$(this).children("td:first").addClass("ui-corner-left"); 
//		$(this).children("td:last").addClass("ui-corner-right"); 
//		$(this).hover(
//			function(){ 
//				$(this).children("td").addClass("ui-state-hover"); 
//				
//			}, 
//			function(){ 
//				$(this).children("td").removeClass("ui-state-hover");
//			}
//		); 
//	});
}

Extensions.SearchStatisticsAdmin.DialogCancel = function(sender)
{
	$(sender).dialog("close");
}

Extensions.SearchStatisticsAdmin.DialogOK = function(sender)
{
	var dateElement = $("input[id*='c_textBoxDeleteOldStatisticsDate']");
	var webSiteId = $("select[id*='c_dropDownListDeleteOldStatisticsWebsiteSelector']").val();
	var fromDate = $(dateElement).val();
	
	if(fromDate == null || fromDate == ""){
		$(dateElement).css({"border":"1px solid red"});
		alert(Extensions.SearchStatisticsAdmin.Settings.NoDateSelectedMessage);
		return;
	}
	
	Litium.Extensions.SearchStatistics.WebServices.SearchStatistics.DeleteOldStatistics(webSiteId, fromDate, 
		function(result){
			if(result){
				alert(Extensions.SearchStatisticsAdmin.Settings.OldLogsDeletedMessage.replace(/###/, fromDate));
				document.location = document.location;
			}
			else{
				alert(Extensions.SearchStatisticsAdmin.Settings.UnknownErrorMessage);
			}
		}
	);
}

Extensions.SearchStatisticsAdmin.ToggleFilterBox = function(sender)
{
	//$("#sectionContentFilter").css({"height":"auto", "overflow":"auto", "padding":"auto"});
	$("#sectionContentFilter").slideToggle("fast", 
		function()
		{
			if($("#sectionContentFilter").css("display") == "none")
				$(sender).attr("src", "/Extensions/Common/Images/navigate_down.png");
			else
				$(sender).attr("src", "/Extensions/Common/Images/navigate_up.png");
		}
	);
}

Extensions.SearchStatisticsAdmin.InitCalendars = function()
{
	// Set default settings for datepicker
	$.datepicker.setDefaults($.extend({ changeMonth: true, changeYear: true, zIndex:1005 }, $.datepicker.regional[Extensions.SearchStatisticsAdmin.Settings.Regional])); 
	// Create date pickers for inputfields
	$("input.DateField").datepicker();
}

Extensions.SearchStatisticsAdmin.SetValueOnCalendars = function(startDate, endDate)
{
	$("input.startDate").val(startDate);
	$("input.endDate").val(endDate);
}

Extensions.SearchStatisticsAdmin.ShowDeleteHistoryDialog = function()
{
	$("#DeletehistoryDialog").dialog("open");
}

Extensions.SearchStatisticsAdmin.SetHoverOnTableRows = function(selector)
{
	$(selector).each(
		function(){ 
		$(this).children("td:first").addClass("ui-corner-left"); 
		$(this).children("td:last").addClass("ui-corner-right"); 
		$(this).hover(
			function(){ 
				$(this).children("td").addClass("ui-state-hover"); 
				
			}, 
			function(){ 
				$(this).children("td").removeClass("ui-state-hover");
			}
		); 
	});
}

Extensions.SearchStatisticsAdmin.ShowSearchedWordDetails = function(word, webSiteId)
{
	var startDate = $("input[type='text'][id*='c_textBoxStartDate']").val() + " 00:00:00";
	var endDate = $("input[type='text'][id*='c_textBoxEndDate']").val() + " 23:59:59";
	Litium.Extensions.SearchStatistics.WebServices.SearchStatistics.GetSearchLogsBySearchWord(word, webSiteId, startDate, endDate,
		function(result)
		{
		 /*
			ClickCount;
			FirstHit;
			LastHit;
			SelectedHitPageID;
			SelectedHitPageInfoCarrier;
		 */
			if(result != null && result.length > 0)
			{
				$("#sectionSearchHits").show();
				
				// Update header with new word
				$("#choosenSearchWord").text(Extensions.SearchStatisticsAdmin.Settings.SearchWordDetailsHeader.replace(/###/g, word));
				
				// Remove all old lines
				$("#ChoosenWordHitPages").find("tr[class='ChoosenWordHitPagesRow']").remove();
				
				// Add all hit rows
				for(var i = 0; i < result.length; i++)
				{
					var item = result[i];
					
					var tr = $("<tr></tr>");
					$(tr).attr("class", "ChoosenWordHitPagesRow");
					
					var tdName = $("<td></td>");
					var aName = $("<a></a>");
					var tdClicks = $("<td></td>");
					var tdLatestclick = $("<td></td>");
					
					$(tdName).append(aName);
					if(item.SelectedHitPageInfoCarrier != null)
					{
						$(aName).text(item.SelectedHitPageInfoCarrier.ShortName);
						$(aName).attr("href", item.SelectedHitPageInfoCarrier.Url.replace(/~/, ""));
					}
					else{
						$(aName).text(Extensions.SearchStatisticsAdmin.Settings.NoHitPageText);
					}
					$(tdClicks).text(item.ClickCount);
					$(tdClicks).attr("class", "center");
					$(tdLatestclick).text(item.LastHit.format("yyyy-mm-dd hh:MM:ss"));
					
					$(tr).append(tdName);
					$(tr).append(tdClicks);
					$(tr).append(tdLatestclick);
					
					$("#ChoosenWordHitPages").append(tr);
				}
				
				Extensions.SearchStatisticsAdmin.SetHoverOnTableRows("#ChoosenWordHitPages tr");
			}
		}
	);
}