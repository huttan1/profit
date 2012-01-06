/****************************************************
* Spell Checker Client JavaScript Code
****************************************************/
// spell checker constants
var spellURL = ((typeof(FCKPlugins) == "object" && FCKPlugins.Items != null) ? FCKPlugins.Items['NetSpell'].Path : "") + "SpellCheck.aspx";
var fckSpellcheckerNetspell = new FCKDialogCommand( 'SpellChecker', FCKLang.NetspellTitle, spellURL + "?Language=" + FCKURLParams["SPELL_LANGUAGE"], 400, 415 );

var FCKSpellCheckCommand = function() {
    this.Name = "SpellCheck";
    this.IsEnabled = (FCKConfig.SpellChecker == "NetSpell") && FCKURLParams["SPELL_LANG_COUNT"] != "0";
};
FCKSpellCheckCommand.prototype.Execute = function() {
    switch (FCKConfig.SpellChecker) {
    case "NetSpell":
        fckSpellcheckerNetspell.Execute();
        break;
    }
};
FCKSpellCheckCommand.prototype.GetState = function() {
    if (FCK.EditMode != 0) return -1;
    return this.IsEnabled ? 0 : -1;
};
FCKConfig.SpellChecker = "NetSpell";