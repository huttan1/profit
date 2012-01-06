function simulateClick(obj) {
    if (obj) {
        if (document.createEvent) {
            var evt = document.createEvent("MouseEvents");
            evt.initMouseEvent("click", true, true, window, 0, 0, 0, 0, 0, false, false, false, false, 0, null);
        }
        if (evt) {
            obj.dispatchEvent(evt);
            var canceled = !obj.dispatchEvent(evt);
        }
        else {
            event.returnValue = false;
            event.cancel = true;
            obj.click();
        }
    }
}


var dt = new Date();
function openURLInNewWindow(url, params) {
	var wndName = "wnd" + dt.getTime();
	openURLInNewWindow(url, params, wndName);
}

function openURLInNewWindow(url, params, wndName) {
	var wnd = window.open("", wndName, "menubar=yes,toolbar=yes,location=yes," +
     "status=yes,scrollbars=yes,resizable=yes");
	if (wnd == null) {
		return;
	}

	try {
		var d = wnd.document;
	}
	catch (e) {
		// the window already exists with different location, reuse it.
		wnd.focus();
		return;
	}

	d.open();
	d.writeln("<HTML><HEAD><TITLE></TITLE>");
	d.writeln('</HEAD><BODY onload="document.forms._form.submit();">');
	d.writeln('<script type="text/javascript">');
	d.writeln("var x,y,left,top;");
	d.writeln("if (self.innerHeight) {");
	d.writeln("  x=self.innerWidth; y=self.innerHeight;");
	d.writeln("} else if (document.documentElement && " + "document.documentElement.clientHeight) {");
	d.writeln("  x=document.documentElement.clientWidth;");
	d.writeln("  y=document.documentElement.clientHeight;");
	d.writeln("} else if (document.body) {");
	d.writeln("  x=document.body.clientWidth;");
	d.writeln("  y=document.body.clientHeight;");
	d.writeln("}");
	d.writeln("top = (y/2) - 50; left = (x/2) - 150;");
	d.writeln("left = left <= 10 ? 10 : left;");
	d.writeln("</script>");
	d.writeln('<FORM method="post" action="' + unescape(url) + '" name="_form">');
	d.writeln("" + params + "");
	d.writeln("</FORM></BODY></HTML>");
	d.close();
	wnd.focus();
}