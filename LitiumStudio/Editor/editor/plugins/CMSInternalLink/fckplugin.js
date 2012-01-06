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
FCKCommands.RegisterCommand('CMSInternalLink', new FCKDialogCommand('CMSInternalLink', FCKLang.InternalLinkDlgTitle, FCKPlugins.Items['CMSInternalLink'].Path + 'CMSInternalLink.aspx?PC_TYPE=' + FCK.PropertyCollectionType + '&OWNER_ID=' + FCK.OwnerID + '&MA_INST=' + FCK.MediaArchiveInstalled + '&CMS_INST=' + FCK.CMSInstalled, 650, 450));

// Create the "InternalLink" toolbar button.
var oInternalLinkItem = new FCKToolbarButton( 'CMSInternalLink', FCKLang.InternalLinkBtn, FCKLang.InsertLink, null, null, true, 34 ) ;
// oInternalLinkItem.IconPath = FCKPlugins.Items['CMSInternalLink'].Path + 'CMSInternalLink.gif' ;
FCKToolbarItems.RegisterItem( 'CMSInternalLink', oInternalLinkItem) ;


