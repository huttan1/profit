function addEvent(object, type, func) {
	if (object.addEventListener)
		object.addEventListener(type, func, false);
	else if (object.attachEvent)
		object.attachEvent("on" + type, func);
}
function LitiumStudio_PaneResized(sender, args) {
	var oldWidth = args.get_oldWidth();
	var width = sender.get_width();
	if (oldWidth != width)
		document.cookie = "LitiumStudioSplitter=" + width;
}
var lastStartItemClick = null;
function LitiumStudio_StartItemClick(s, e) {
	var navigateUrl = e.get_item().get_navigateUrl();
	if (navigateUrl && lastStartItemClick == null)
	{
		var startmenu = StartMenu();
		if (startmenu)
			startmenu.close();

		lastStartItemClick = setTimeout(function () { clearTimeout(lastStartItemClick); lastStartItemClick = null; }, 100);
		window.location.href = navigateUrl;
	} 
}
function LitiumStudio_StartItemHelpClick(s, e) {
	var navigateUrl = e.get_item().get_navigateUrl();
	var startmenu = StartMenu();
	if (navigateUrl && startmenu) {
		startmenu.close();

		var windowWidth = 1024;
		var left = (screen.width) ? (screen.width - windowWidth) / 2 : 100;
		var properties = "width=" + windowWidth + ",scrollbars=yes,menubar=no,toolbar=no,status=no,resizable=yes,left=" + left;

		window.open(navigateUrl, 'LitiumStudioHelp' + ClientID, properties)
	}
}            
//On insert and update buttons click temporarily disables ajax to perform upload actions
function conditionalPostback(sender, eventArgs) {
	var theRegexp = new RegExp("\.UpdateButton$|\.PerformInsertButton$", "ig");
	if (eventArgs.get_eventTarget().match(theRegexp)) {
		if (window.lsUploadIDs) {
			for (k in window.lsUploadIDs) {
				var id = window.lsUploadIDs[k].toString();
				var upload = $get(id);
				if (upload) {
					//AJAX is disabled only if file is selected for upload
					if (upload.value != "") {
						eventArgs.set_enableAjax(false);
					}
				}
			}
		}
	}
}
function LitiumStudio_AddUploadControl(id) {
	if (!window.lsUploadIDs)
		window.lsUploadIDs = new Array();
	Array.add(window.lsUploadIDs, id);
}

// Fix correct disabled paths for images
try {
	ComponentArt_ToolBarItem.prototype.get_imageUrl = function () {
		var url = this.ImageUrl;
		if (this.get_enabled())
			return url;

		return url.replace('icons_standard', 'icons_standard_disabled');
	}
}
catch (e) {
}
