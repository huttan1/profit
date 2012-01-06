/****************************************************
* Spell Checker Client JavaScript Code
****************************************************/
// spell checker constants
var showCompleteAlert = true;
// global elements to check
var dialog = window.parent ;
var oEditor = dialog.InnerDialogLoaded() ;
var FCKLang = oEditor.FCKLang ;
var FCKPlaceholders = oEditor.FCKPlaceholders ;


function getText()
{
	var sText = oEditor.FCK.EditorDocument.body.innerHTML;
	return sText;
}

function setText(text)
{
	oEditor.FCK.EditorDocument.body.innerHTML = text;
	return;
}

/****************************************************
* Spell Checker Suggestion Window JavaScript Code
****************************************************/
function initialize()
{
    var spellMode = document.getElementById("SpellMode").value;

    switch (spellMode)
    {
        case "start" :
            //do nothing client side
            break;
        case "suggest" :
            //update text from parent document
            updateText();
            //wait for input
            break;
        case "no":
			break;
        case "end" :
            //update text from parent document
            updateText();
            break;
        default :
            //get text block from parent document
            if(loadText())
                document.SpellingForm.submit();
            break;
    }
}

function loadText()
{
    var newText = getText();
    if (newText.length > 0)
	{
		updateSettings(newText, 0, "start");
		document.getElementById("StatusText").innerText = txtCheckText;
		return true;
	}
	return false;
}

function updateSettings(currentText, wordIndex, mode)
{
    document.getElementById("CurrentText").value = currentText;
    document.getElementById("WordIndex").value = wordIndex;
    document.getElementById("SpellMode").value = mode;
}

function updateText()
{
	var newText = document.getElementById("CurrentText").value;
    setText(newText);
}

function changeWord(oElement)
{
    var k = oElement.selectedIndex;
    oElement.form.ReplacementWord.value = oElement.options[k].value;
}
