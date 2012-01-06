var litium = {};

litium.templates = {
	include: (function () {
		var self = {};
		var defaults = { iframeHeight: '600px' };

		self.resize = function (iframe, iframeHeight) {
			try {
				iframe.style.height = iframe.contentWindow.document.body.scrollHeight + 'px';
			} catch (e) {
				iframe.style.height = iframeHeight;
			}
		};

		self.init = function (options) {
			///<summary>
			/// Initialises the resizing of iframes in the document.
			/// Parameters: options: { iframeHeight: height declaration, e.g. '600px' }
			///</summary>
			var i;
			var iframe;
			var iframes = document.getElementsByTagName('iframe');
			var settings = jQuery.extend({}, defaults, options);
			var onloadValue = 'litium.templates.include.resize(this, "' + settings.iframeHeight + '");'

			for (i = 0; iframe = iframes[i]; i++) {
				iframe.setAttribute('onload', onloadValue);
			}
		};

		return self;
	})(),

	orderhistory: (function () {
		var self = {};

		var showOrder = function () {
			var orderId = document.location.hash;
			if (orderId.length > 1) {				
				var $order = $(document.location.hash);
				if ($order.length) {
					$(document.location.hash).show();
					window.self.location = orderId;
				}
			}
		};

		self.init = function (options) {
			///<summary>
			/// Initialises the links to order details.
			///</summary>
			$(document).ready(function () {
				$('ul.orders > li').hide();
				showOrder();

				$('ul.ordermenu > li > a').each(function () {
					$(this).click(function () {
						$('ul.orders > li:visible').hide();
						$($(this).attr('href')).show();
					});
				});
			});
		};

		return self;
	})()
};
