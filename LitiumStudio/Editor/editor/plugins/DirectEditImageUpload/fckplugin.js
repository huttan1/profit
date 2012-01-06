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
FCKCommands.RegisterCommand( 'DirectEditImageUpload', new FCKDialogCommand( 'DirectEditImageUpload', FCKLang.ImageUploadDlgTitle, FCKPlugins.Items['DirectEditImageUpload'].Path + 'DirectEditImageUpload.aspx?PC_TYPE=' + FCK.PropertyCollectionType + '&OWNER_ID=' + FCK.OwnerID + '&MA_INST=' + FCK.MediaArchiveInstalled , 700, 540 ) ) ;

// Create the "ImageUpload" toolbar button.
var oImageUploadItem = new FCKToolbarButton( 'DirectEditImageUpload', FCKLang.ImageProperties, FCKLang.ImageUploadDlgTitle, null, null, true, 37 ) ;
// oImageUploadItem.IconPath = FCKPlugins.Items['DirectEditImageUpload'].Path + 'DirectEditImageUpload.gif' ;

FCKToolbarItems.RegisterItem( 'DirectEditImageUpload', oImageUploadItem) ;


