// HTTPrequests
var http_request;
function MakeHttpRequest(url, refFunction, postdata) {
    if (window.XMLHttpRequest) { // Mozilla, Safari,... 
        http_request = new XMLHttpRequest();
    } else if (window.ActiveXObject) { // IE 
        http_request = new ActiveXObject("Microsoft.XMLHTTP");
    }
    http_request.onreadystatechange = refFunction;
    if (postdata == null) {
        http_request.open('GET', url, true);
        http_request.send(null);
    } else {
        http_request.open('POST', url, true);
        http_request.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
        http_request.send(postdata);
    }
}
/*
function retFunction() { 
if (http_request.readyState == 4) { 
if (http_request.status == 200) { 
alert(http_request.responseText); 
} else { 
alert('There was a problem with the request.'); 
} 
} 

} 
*/
// IE 5.5+, Netscape 6+, and Mozilla
function utf8(wide) {
    var c, s;
    var enc = "";
    var i = 0;
    while (i < wide.length) {
        c = wide.charCodeAt(i++);
        // handle UTF-16 surrogates
        if (c >= 0xDC00 && c < 0xE000) continue;
        if (c >= 0xD800 && c < 0xDC00) {
            if (i >= wide.length) continue;
            s = wide.charCodeAt(i++);
            if (s < 0xDC00 || c >= 0xDE00) continue;
            c = ((c - 0xD800) << 10) + (s - 0xDC00) + 0x10000;
        }
        // output value
        if (c < 0x80) enc += String.fromCharCode(c);
        else if (c < 0x800) enc += String.fromCharCode(0xC0 + (c >> 6), 0x80 + (c & 0x3F));
        else if (c < 0x10000) enc += String.fromCharCode(0xE0 + (c >> 12), 0x80 + (c >> 6 & 0x3F), 0x80 + (c & 0x3F));
        else enc += String.fromCharCode(0xF0 + (c >> 18), 0x80 + (c >> 12 & 0x3F), 0x80 + (c >> 6 & 0x3F), 0x80 + (c & 0x3F));
    }
    return enc;
}

// Mimics function encodeURIComponent in IE 5.5+, Netscape 6+, and Mozilla
function encodeURIComponentNew(s) {
    var s = utf8(s);
    var c;
    var enc = "";
    for (var i = 0; i < s.length; i++) {
        if ("ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz0123456789_-".indexOf(s.charAt(i)) == -1)
            enc += "%" + "0123456789ABCDEF".charAt(s.charCodeAt(i) >> 4) + "0123456789ABCDEF".charAt(s.charCodeAt(i) & 0xF);
        else
            enc += s.charAt(i);
    }
    return enc;
}
if (!(typeof encodeURIComponent == "function"))
    encodeURIComponent = encodeURIComponentNew;