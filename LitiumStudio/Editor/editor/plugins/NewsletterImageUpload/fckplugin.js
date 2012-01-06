/*
 * FCKeditor - The text editor for internet
 * Copyright (C) 2003-2006 Frederico Caldeira Knabben
 * 
 * Licensed under the terms of the GNU Lesser General Public License:
 * 		http://www.opensource.org/licenses/lgpl-license.php
 * 
 * For further information visit:
 * 		http://www.fckeditor.net/
 * 
 * "Support Open Source software. What about a donation today?"
 * 
 * File Name: fckplugin.js
 * 	Plugin to insert "Placeholders" in the editor.
 * 
 * File Authors:
 * 		
 */

// Register the related command.
FCKCommands.RegisterCommand( 'NewsletterImageUpload', new FCKDialogCommand( 'NewsletterImageUpload', FCKLang.ImageUploadDlgTitle, FCKPlugins.Items['NewsletterImageUpload'].Path + 'NewsletterImageUpload.aspx?OWNER_ID=' + FCK.OwnerID + '&MA_INST=' + FCK.MediaArchiveInstalled , 700, 540 ) ) ;

// Create the "ImageUpload" toolbar button.
var oImageUploadItem = new FCKToolbarButton( 'NewsletterImageUpload', FCKLang.ImageProperties, FCKLang.ImageUploadDlgTitle, null, null, true, 37 ) ;
// oImageUploadItem.IconPath = FCKPlugins.Items['NewsletterImageUpload'].Path + 'NewsletterImageUpload.gif' ;

FCKToolbarItems.RegisterItem( 'NewsletterImageUpload', oImageUploadItem) ;


