<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditAddressControl, Litum.Studio.Web" %>
<%@ Register Src="AddressInformation.ascx" TagName="AddressInformation" TagPrefix="uc2" %>

<script type="text/javascript">
	var billingAddress = '<%= c_billingAddressInformation.ClientID %>' + '_c_comboBoxLanguage';
	var deliveryAddress = '<%= c_deliveryAddressInformation.ClientID %>' + '_c_comboBoxLanguage';

	function setTopPossitionCollapse() {
		if (navigator.userAgent.indexOf("MSIE") == -1 && navigator.userAgent.indexOf("Chrome") == -1) {
			setTopPossition();
		}
	}

	function setTopPossition() {
		var addressDiv = document.getElementById('person_address');

		var comboBoxBilling = document.getElementById(billingAddress);
		var comboBoxDataBilling = document.getElementById(billingAddress + '_DropDown');

		var comboBoxDelivery = document.getElementById(deliveryAddress);
		var comboBoxDataDelivery = document.getElementById(deliveryAddress + '_DropDown');

		var posTop;

		if (comboBoxDataBilling.clientHeight >= comboBoxDataDelivery.clientHeight) {
			posTop = findPos(comboBoxBilling)[1] + comboBoxDataBilling.clientHeight;
		}
		else {
			posTop = findPos(comboBoxDelivery)[1] + comboBoxDataDelivery.clientHeight;
		}

		addressDiv.scrollTop = 0;
		addressDiv.scrollTop = posTop;
	}

	function ComboBoxScroll(obj) {
		var addressDiv = obj;

		var comboBox = document.getElementById(billingAddress);
		var comboBoxData = document.getElementById(billingAddress + '_DropDown');
		setTopAfterScroll(addressDiv, comboBox, comboBoxData);

		comboBox = document.getElementById(deliveryAddress);
		comboBoxData = document.getElementById(deliveryAddress + '_DropDown');
		setTopAfterScroll(addressDiv, comboBox, comboBoxData);
	}

	function setTopAfterScroll(addressDiv, comboBox, comboBoxData) {
		var divTop = addressDiv.scrollTop;
		var comboBoxTop = findPos(comboBox)[1];
		var mainTop = comboBoxTop - divTop + comboBox.offsetHeight;

		comboBoxData.style.top = mainTop + 'px';
	}

	function findPos(obj) {
		var curleft = curtop = 0;
		if (obj.offsetParent) {
			do {
				curleft += obj.offsetLeft;
				curtop += obj.offsetTop;
			}
			while (obj = obj.offsetParent);
		}
		return [curleft, curtop];

	}
	////////////////////////
	function ComboBox1_onLoad(sender, e) {
		sender._OriginalExpand = sender.Expand;
		sender.Expand = function() {
			FixCAExpandPosition(this);
			this._OriginalExpand();
		};
	}
	function FixCAExpandPosition(sender) {
		var point = GetScrollOffsetPosition(document.getElementById(sender.Id));
		sender.DropDownOffsetX = -point.x;
		sender.DropDownOffsetY = -point.y;
	}
	function Point(x, y) {
		this.x = x;
		this.y = y;
	}

	function GetScrollOffsetPosition(obj, position) {
		if (!position) { var position = new Point(0, 0); }

		if (obj.scrollLeft)
			position.x += obj.scrollLeft;
		if (obj.scrollTop)
			position.y += obj.scrollTop;

		if (navigator.appVersion.indexOf("MSIE") < 0 || navigator.appVersion.indexOf("MSIE 8") > 0) {
			if (obj.parentNode) {
				return GetScrollOffsetPosition(obj.parentNode, position);
			}
			else {
				return position;
			}
		}
		else {

			if (obj.offsetParent) {
				return GetScrollOffsetPosition(obj.offsetParent, position);
			}
			else {
				return position;
			}
		}
	}
	/////////////////////
</script>
<div class="lsTabContent">
    <br />
    <table cellpadding="15" cellspacing="0" border="0">
	    <tr>
		    <td valign="top">
			    <div style="float: left; width: 250px; margin-right: 20px;" runat="server" id="c_billingAddressPanel">
				    <uc2:AddressInformation ID="c_billingAddressInformation" runat="server" />
			    </div>
			    <div style="float: left; width: 250px;" runat="server" id="c_deliveryAddressPanel">
				    <uc2:AddressInformation ID="c_deliveryAddressInformation" runat="server" />
			    </div>
			    <div style="clear: both;">
			    </div>
		    </td>
	    </tr>
    </table>
</div>