Type.registerNamespace('Litium.Studio.UI');
Litium.Studio.UI.FastSearch = function(element) {
	Litium.Studio.UI.FastSearch.initializeBase(this, [element]);

	this.ClientID = null;
	this.HeaderID = null;
	this.ContainerID = null;
	this.ResultID = null;
	this.SearchBoxID = null;
	this.SplitterID = null;
	this.FastSearchModuleID = null;
	this.ResultPage = null;
	this.NoResultText = null;

	this.LayoutTable = null;
	this.LayoutRow = null;

	this.Header = null;
	this.Container = null;
	this.Result = null;
	this.SearchBox = null;
	this._maxHeight = 200;
}
Litium.Studio.UI.FastSearch._timer = null;
Litium.Studio.UI.FastSearch._instance = null;
Litium.Studio.UI.FastSearch.NavigateTo = function(url) {
	window.open(url, '_self');
}
Litium.Studio.UI.FastSearch.prototype = {
	initialize: function() {
		Litium.Studio.UI.FastSearch.callBaseMethod(this, 'initialize');
		Litium.Studio.UI.FastSearch._instance = this;

		this.Header = $get(this.HeaderID);
		this.Container = $get(this.ContainerID);
		this.Result = $get(this.ResultID);
		this.SearchBox = $get(this.SearchBoxID);

		var resultHTML = this.Result.innerHTML;
		var searchHTML = resultHTML.toLowerCase();

		this.LayoutTable = resultHTML.substring(0, searchHTML.indexOf("<tbody>")) + "#" + resultHTML.substring(searchHTML.indexOf("</tbody>") + 8);
		var trStart = searchHTML.indexOf("<tbody>") + 7;
		this.LayoutRow = resultHTML.substring(trStart, searchHTML.indexOf("</tbody>"));

		$addHandler(this.SearchBox, "keyup", this.SearchBoxKeyDown);
		$addHandler(window, "resize", this.WindowResize);
		$addHandler(window.document, "mouseup", this.WindowMouseClick);
	},

	dispose: function() {
		Litium.Studio.UI.FastSearch.callBaseMethod(this, 'dispose');
	},

	SearchBoxKeyDown: function(e) {
		if (e.keyCode == 13) {
			Litium.Studio.UI.FastSearch._instance.HideSearchResult();
			return;
		}
		if (Litium.Studio.UI.FastSearch._timer != null)
			clearTimeout(Litium.Studio.UI.FastSearch._timer);
		if (Litium.Studio.UI.FastSearch._instance.SearchBox.value == "")
			Litium.Studio.UI.FastSearch._instance.HideSearchResult();
		else {
			Litium.Studio.UI.FastSearch._timer = setTimeout(function() { Litium.Studio.UI.FastSearch._instance.Search() }, 250);
		}
	},

	Search: function() {
		var selectedItem = $find(this.FastSearchModuleID).get_selectedItem();
		var id = selectedItem.get_value();
		Litium.Studio.UI.FastSearch._instance.Header.innerHTML = selectedItem.get_text();
		jQuery.ajax({ type: "POST", dataType: "json", url: this.ResultPage, data: "SearchWord=" + encodeURIComponent(this.SearchBox.value) + "&ModuleID=" + id, success: this.DisplaySearchResult });
	},

	DisplaySearchResult: function(data) {
		Litium.Studio.UI.FastSearch._instance.Container.style.display = 'block';
		var html = "";
		if (data == null || data.length == 0) {
			html = Litium.Studio.UI.FastSearch._instance.NoResultText;
		} else {
			var rows = "";
			var row = Litium.Studio.UI.FastSearch._instance.LayoutRow;
			//for (var j = 0; j < 5; j++) // only to multiply the result with 5 to get more items than the screen can display
			for (i in data) {
				var item = data[i];
				rows += row.replace("#link#", item.Link)
						.replace("#imageUrl#", "<img src=\"" + item.ImageUrl + "\" style=\"max-width: 16px; max-height: 16px;\" />")
						.replace("#text1#", item.Text1)
						.replace("#text2#", item.Text2);
			}
			html = Litium.Studio.UI.FastSearch._instance.LayoutTable.replace("#", rows);
		}
		var result = Litium.Studio.UI.FastSearch._instance.Result
		result.style.height = "";
		result.innerHTML = html;

		var h = $find(Litium.Studio.UI.FastSearch._instance.SplitterID).getStartPane().get_height() - 50;
		if (result.offsetHeight < h)
			result.style.height = (result.offsetHeight + 2) + 'px';
		else
			result.style.height = (h + 2) + 'px';
		result.style.maxHeight = h + 'px';
	},

	HideSearchResult: function() {
		this.Container.style.display = 'none';
	},

	WindowResize: function() {
		Litium.Studio.UI.FastSearch._instance.HideSearchResult();
	},

	WindowMouseClick: function() {
		Litium.Studio.UI.FastSearch._instance.HideSearchResult();
	}
}
Litium.Studio.UI.FastSearch.descriptor = {
	properties: [
		{ name: 'ClientID', type: String },
		{ name: 'ContainerID', type: String },
		{ name: 'HeaderID', type: String },
		{ name: 'ResultID', type: String },
		{ name: 'SearchBoxID', type: String },
		{ name: 'ResultPage', type: String },
		{ name: 'NoResultText', type: String },
		{ name: 'SplitterID', type: String },
		{ name: 'FastSearchModuleID', type: String }
    ],
	events: []
}
Litium.Studio.UI.FastSearch.registerClass('Litium.Studio.UI.FastSearch', Sys.UI.Control);
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();