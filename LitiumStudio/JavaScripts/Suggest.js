function SuggestUrlName(url, value, culture, arrayWithClientIDsToFill) {

    MakeHttpRequest(url, function() {
        if (http_request.readyState == 4) {
            if (http_request.status == 200) {
                var responseValue = http_request.responseText;
                for (var i = 0; i < arrayWithClientIDsToFill.length; i++) {
                    var textbox = $get(arrayWithClientIDsToFill[i].toString());
                    if (!textbox)
                        continue;
                    var isChangedAttribute = (typeof (textbox.isTextChanged) == "undefined") ? true : textbox.isTextChanged;
                    if (textbox.value == "" || isChangedAttribute == null || isChangedAttribute == false)
                        textbox.value = responseValue;
                }
            }
        }
    }, "culture=" + culture + "&value=" + encodeURIComponent(value));

}