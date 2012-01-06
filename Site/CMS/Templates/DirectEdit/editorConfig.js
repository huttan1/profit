FCKConfig.DocType = '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">' ;
FCKConfig.SkinPath = FCKConfig.BasePath + 'skins/litiumstudio/' ;

FCKConfig.Plugins.Add('CMSInternalLink', 'sv,en') ; 
FCKConfig.Plugins.Add('DirectEditImageUpload', 'sv,en') ; 

FCKConfig.ProtectedSource.Add( /<script[\s\S]*?<\/script>/gi ) ; // <SCRIPT> tags.
FCKConfig.AutoDetectLanguage = false ;
FCKConfig.DefaultLanguage = 'sv' ;
FCKConfig.TemplateReplaceAll = false;
FCKConfig.DisableFFTableHandles = false ;
FCKConfig.TemplateReplaceCheckbox = false ;
FCKConfig.ProcessHTMLEntities	= false ;
FCKConfig.IncludeLatinEntities	= false ;
FCKConfig.IncludeGreekEntities	= false ;
FCKConfig.ToolbarSets["Default"] = [
	['Bold','Italic',"-",'Undo','Redo',"-",'CMSInternalLink','Unlink','Anchor','DirectEditImageUpload',"-",'Cut','Copy','Paste','PasteText'],['OrderedList','UnorderedList',"-",'Source',"-",'FontFormat']
] ;
FCKConfig.ToolbarSets["Basic"] = [
    ['Cut','Copy','Paste','PasteText','PasteWord'],
	['Undo','Redo'],
	['Bold','Italic','OrderedList','UnorderedList','Outdent','Indent'],
	['Link','Unlink','Anchor','FontFormat']
] ;

FCKConfig.FontFormats	= 'p;h1;h2;h3' ;

// The option switches between trying to keep the html structure or do the changes so the content looks like it was in Word
FCKConfig.CleanWordKeepsStructure = true ;

FCKConfig.LinkUpload = false;
FCKConfig.LinkBrowser = false;
FCKConfig.ImageUpload = true;

// Set opacity for dialogs opened by editor
FCKConfig.BackgroundBlockerColor = '#333333' ;
FCKConfig.BackgroundBlockerOpacity = 0.40 ;

FCKConfig.BodyStyle = 'background-color:#ffffff!important;' ;