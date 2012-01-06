Type.registerNamespace('Litium.Studio.UI');
Litium.Studio.UI.FilterArea = function(element) {
	Litium.Studio.UI.FilterArea.initializeBase(this, [element]);

	this.ClientID = null;
	this.SplitterID = null;
	this.ContainerID = null;
	this.IconImageID = null;
	this.ConfigID = null;
	this._lastHeight = null;
	this._margin = 16;
}
Litium.Studio.UI.FilterArea.prototype = {
	initialize: function() {
		Litium.Studio.UI.FilterArea.callBaseMethod(this, 'initialize');
		this.Hide();
	},
	dispose: function() {
		Litium.Studio.UI.FilterArea.callBaseMethod(this, 'dispose');
	},
	PersistIn: function(configID, noMargin) {
		this.ConfigID = configID;

		if (noMargin) {
			this._margin = 0;
			$get(this.ContainerID).className += " lsFilterNoMargin";
		}
	},
	Switch: function() {
		if (this._lastHeight == null) {
			this.Open();
		} else {
			this.Close();
		}
	},
	Show: function() {
		$get(this.IconImageID).style.display = '';
		if (this._lastHeight == null) {
			$get(this.IconImageID).className = 'lsFilterAreaOpen';
		} else {
			$get(this.IconImageID).className = 'lsFilterAreaClose';
		}
	},
	Open: function() {

		$get(this.IconImageID).className = 'lsFilterAreaClose';
		$get(this.ContainerID).style.display = 'block';

		if (this._lastHight != null) {
			return;
		}

		var ps = $get(this.ContainerID).offsetHeight;
		var s = $find(this.SplitterID);
		var sp = s.getStartPane();
		var ep = s.getEndPane();

		this._lastHeight = ps + this._margin; // 16 = padding top and bottom 8px each for the filterarea

		sp.set_height(sp.get_height() + this._lastHeight);
		ep.set_height(ep.get_height() - this._lastHeight + 1);

		if (this.ConfigID) {
			$get(this.ConfigID).value = "Open";
		}
	},
	Close: function() {
		var c = $get(this.ContainerID);
		c.style.display = 'none';

		$get(this.IconImageID).className = 'lsFilterAreaOpen';

		if (this._lastHeight == null) {
			return;
		}

		var s = $find(this.SplitterID);
		var sp = s.getStartPane();
		var ep = s.getEndPane();

		sp.set_height(sp.get_height() - this._lastHeight);
		ep.set_height(ep.get_height() + this._lastHeight - 1);

		this._lastHeight = null;

		if (this.ConfigID) {
			$get(this.ConfigID).value = "Closed";
		}
	},
	Hide: function() {
		this.Close();
		$get(this.IconImageID).style.display = 'none';
		if (this.ConfigID) {
			$get(this.ConfigID).value = "Hidden";
		}

	}
}
Litium.Studio.UI.FilterArea.descriptor = {
	properties: [
		{ name: 'ClientID', type: String },
		{ name: 'SplitterID', type: String },
		{ name: 'ContainerID', type: String },
		{ name: 'IconImageID', type: String }
    ],
	events: []
}
Litium.Studio.UI.FilterArea.registerClass('Litium.Studio.UI.FilterArea', Sys.UI.Control);
if (typeof (Sys) !== 'undefined') Sys.Application.notifyScriptLoaded();