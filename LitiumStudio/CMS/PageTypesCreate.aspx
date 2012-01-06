<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PageTypesCreate, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<%@ Register TagPrefix="Pages" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink"
	        ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
	        ID="c_toolbarItemCancel" runat="server"/>
	    <Toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" 
	        runat="server" />
	    <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" 
	        ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif"
	        ID="c_toolbarItemSave" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconPageType" />
	<Foundation:ModuleString Name="PageTypeCreate" runat="server" ID="Systemstring2"/>
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">    
        <div class="lsContentScroll">
            <div style="margin-bottom: 15px;">
	            <fieldset class="litFieldset">
		            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString31" Name="PageTypeCategory" runat="server"/></legend>
		            <img src="images/transparent.gif" width="5" alt="" /><br />
			            <div style="width: 450px;">
					        <div style="padding-left: 75px;">
					            <asp:DropDownList cssclass="litText" ID="c_dropDownListCategory" AutoPostBack="true" OnSelectedIndexChanged="Category_Changed" Width="200" runat="server" />
					        </div>
					    </div>
			        <asp:Panel id="Panel3" visible="False" runat="server"> 
		                <fieldset class="litErrorFieldset">
		                    <legend class="litErrorFieldsetMsg">
		                        <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><b><Foundation:SystemString ID="SystemString1" Name="UnknownError" runat="server"/></b>
		                    </legend>
		                    <img src="Images/transparent.gif" width="5" alt="" /><br />
			                <asp:Label id="c_labelCategoryError" runat="server"/>
		                </fieldset>
	                </asp:Panel> 
		        </fieldset>
	        </div>
	        <div style="margin-bottom: 15px;">
	            <fieldset class="litFieldset">
		            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString30" Name="PageTypeName" runat="server"/></legend>
		            <img src="images/transparent.gif" width="5" alt="" /><br />
			            <div style="width: 450px;">
					        <div style="padding-left: 75px;">
					            <asp:TextBox cssclass="litInputText200" ID="c_name" runat="server" />
					            <Pages:LitCustomValidator ID="c_validatorPagesTypeName" runat="server" ControlToValidate="c_name" ValidateEmptyText="true" OnServerValidate="ValidateName" cssClass="litErrorMsg"/>
					        </div>
					    </div>
			        <asp:Panel id="Panel2" visible="False" runat="server"> 
		                <fieldset class="litErrorFieldset">
		                    <legend class="litErrorFieldsetMsg">
		                        <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><b><Foundation:SystemString ID="SystemString4" Name="UnknownError" runat="server"/></b>
		                    </legend>
		                    <img src="Images/transparent.gif" width="5" alt="" /><br />
			                <asp:Label id="c_labelNameError" runat="server"/>
		                </fieldset>
	                </asp:Panel> 
		        </fieldset>
	        </div>
	        <div style="margin-bottom: 15px;">
	            <fieldset class="litFieldset">
		            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString5" Name="PageTypeNameLanguageDefined" runat="server"/></legend>
		            <img src="images/transparent.gif" width="5" alt="" /><br />
		            <asp:Repeater id="c_repeaterPageTypeNames" runat="server">
			            <ItemTemplate>
			                <div>
					            <table border="0" cellpadding="0" >
					            <tr>
					            <td style="width:75px; padding-top: 3px;"><asp:Label ID="Label1" runat="server" CssClass="litText" style="margin-bottom:5px;"><%# DataBinder.Eval(Container.DataItem,"Name") %></asp:Label></td>
					            <td>
					                <asp:TextBox cssclass="litInputText200" ID="c_shortName" runat="server" />
					                <asp:Label runat="server" Visible="false" ID="c_labelLanguageID"></asp:Label>
					                <Pages:LitCustomValidator ID="c_validatorPagesTypeName" runat="server"  ControlToValidate="c_shortName"  ValidateEmptyText="true" cssClass="litErrorMsg"/>
					            </td>
					            </tr>
					            </table>					            
					        </div>
			            </ItemTemplate>
			        </asp:Repeater>
			        <asp:Panel id="Panel1" visible="False" runat="server"> 
		                <fieldset class="litErrorFieldset">
		                    <legend class="litErrorFieldsetMsg">
		                        <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><b><Foundation:SystemString ID="SystemString3" Name="UnknownError" runat="server"/></b>
		                    </legend>
		                    <img src="Images/transparent.gif" width="5" alt="" /><br />
			                <asp:Label id="c_labelShortNameError" runat="server"/>
		                </fieldset>
	                </asp:Panel> 
		        </fieldset>
	        </div>
	        <div style="margin-bottom: 15px;">
		        <fieldset class="litFieldset">
		            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString1" Name="PageTypeEditProperties" runat="server"/></legend>
		            <img src="images/transparent.gif" width="5" alt="" /><br />
		            <table>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeArchived" runat="server" />
		                        <Foundation:ModuleString ID="ModuleString3" Name="PageTypeEditCanBeArchived" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <Foundation:ModuleString ID="ModuleString15" Name="PageTypeEditAutoArchiveWeeks1" runat="server"/>
		                        <asp:TextBox cssclass="litInputText30" runat="server" ID="c_autoArchiveWeeks" ></asp:TextBox>
		                        <Foundation:ModuleString ID="ModuleString17" Name="PageTypeEditAutoArchiveWeeks2" runat="server"/>
		                        <span style="padding-left:10px; font-size: 110%;" class="litErrorMsg">
		                            <img id="c_imageErrorAutoArchive" runat="server" visible="false" src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError"/>
		                            <Pages:LitCustomValidator ID="c_validatorAutoArchive" runat="server" ControlToValidate="c_autoArchiveWeeks" OnServerValidate="ValidateAutoArchive" cssClass="litErrorMsg"/>
		                        </span>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeMovedToTrashcan" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString8" Name="PageTypeEditCanBeMovedToTrashcan" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeMasterPage" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString22" Name="PageTypeEditCanBeMasterPage" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeInMenu" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString4" Name="PageTypeEditCanBeInMenu" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeInSiteMap" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString6" Name="PageTypeEditCanBeInSiteMap" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeLinkedTo" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString7" Name="PageTypeEditCanBeLinkedTo" runat="server"/>
		                    </td>
		                </tr>
		                
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBePrinted" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString9" Name="PageTypeEditCanBePrinted" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeSearched" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString10" Name="PageTypeEditCanBeSearched" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeVersioned" runat="server" />
		                        <Foundation:ModuleString ID="ModuleString11" Name="PageTypeEditCanBeVersioned" runat="server"/>,
		                        <Foundation:ModuleString ID="ModuleString16" Name="PageTypeEditVersionsToKeep" runat="server"/>:
		                        <asp:TextBox cssclass="litInputText30" runat="server" ID="c_versionsToKeep" ></asp:TextBox>
		                        <span style="padding-left:10px; font-size: 110%;" class="litErrorMsg">
		                            <img id="Img1" runat="server" visible="false" src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError"/>
		                            <Pages:LitCustomValidator ID="c_validatorVersions" runat="server" ControlToValidate="c_versionsToKeep" OnServerValidate="ValidateNumberOfVersions" cssClass="litErrorMsg"/>
		                        </span>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkCanBeInVisitStatistics" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString12" Name="PageTypeEditCanBeInVisitStatistics" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" id="c_checkEditableInGui" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString13" Name="PageTypeEditEditableInGui" runat="server"/>
		                    </td>
		                </tr>
		            </table>
		        </fieldset>
		    </div>
		    <div style="margin-bottom: 15px;">
		        <fieldset class="litFieldset">
		            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString24" Name="PageTypeEditPossibleChildPageTypes" runat="server"/></legend>
		            <img src="images/transparent.gif" width="5" alt="" /><br />
		            <table cellpadding="0" cellspacing="0">
		                <tr>
		                    <td style="padding-bottom: 4px;">
		                        <asp:ListBox Runat="server" ID="c_listBoxChildPageTypes" Rows="13" CssClass="litInputSelect" SelectionMode="Multiple"/>	                    		                    
		                    </td>
		                    <td valign="top" style="padding-left: 10px;">
		                        <div class="litText" style="margin-bottom: 50px;">
		                            <Foundation:ModuleString ID="ModuleString20" Name="InfoMultipleSelect" runat="server"/>
		                        </div>
		                        <div class="litText">
		                            <a href="#" onclick="javascript: SelectAllChildren();"><Foundation:ModuleString ID="ModuleString21" Name="SelectAll" runat="server"/></a>
		                        </div>
		                        <div class="litText">
		                            <a href="#" onclick="javascript: DeselectAllChildren();"><Foundation:ModuleString ID="ModuleString28" Name="DeselectAll" runat="server"/></a>
		                        </div>
		                    </td>
		                </tr>
		            </table>
		        </fieldset>
		    </div>
		    <div style="margin-bottom: 15px;">
		        <fieldset class="litFieldset">
		            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString25" Name="PageTypeEditPossibleParentPageTypes" runat="server"/></legend>
		            <img src="images/transparent.gif" width="5" alt="" /><br />
		            <table cellpadding="0" cellspacing="0">
		                <tr>
		                    <td style="padding-bottom: 4px;">
		                        <asp:ListBox Runat="server" ID="c_listBoxParentPageTypes" Rows="13" CssClass="litInputSelect" SelectionMode="Multiple"/>	                    		                    		                        		                    		                    		                    
		                    </td>
		                    <td valign="top" style="padding-left: 10px;">
		                        <div class="litText" style="margin-bottom: 50px;">
		                            <Foundation:ModuleString ID="ModuleString26" Name="InfoMultipleSelect" runat="server"/>
		                        </div>
		                        <div class="litText">
		                            <a href="#" onclick="javascript: SelectAllParents();"><Foundation:ModuleString ID="ModuleString27" Name="SelectAll" runat="server"/></a>
		                        </div>
		                        <div class="litText">
		                            <a href="#" onclick="javascript: DeselectAllParents();"><Foundation:ModuleString ID="ModuleString29" Name="DeselectAll" runat="server"/></a>
		                        </div>
		                    </td>
		                </tr>
		            </table>
		        </fieldset>
		    </div>
		    <div>
		        <fieldset class="litFieldset">
		            <legend class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="PageTypeEditOther" runat="server"/></legend>
		            <img src="images/transparent.gif" width="5" alt="" /><br />
		            <table cellpadding="0" cellspacing="0">
		                <tr>
		                    <td class="litText">
		                        <Foundation:ModuleString ID="ModuleString18" Name="PageTypeEditEditPage" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td style="padding-bottom: 4px;">
		                        <asp:TextBox cssclass="litInputText200" runat="server" ID="c_editPage"></asp:TextBox>		                    
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <Foundation:ModuleString ID="ModuleString19" Name="PageTypeEditContentPanel" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td style="padding-bottom: 4px;">
		                        <asp:TextBox cssclass="litInputText200" runat="server" ID="c_contentPanel"></asp:TextBox>		                    
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <Foundation:ModuleString ID="ModuleString23" Name="PageTypeEditSettingsPanel" runat="server"/>
		                    </td>
		                </tr>
		                <tr>
		                    <td style="padding-bottom: 4px;">
		                        <asp:TextBox cssclass="litInputText200" runat="server" ID="c_settingsPanel"></asp:TextBox>		                    		                    		                    
		                    </td>
		                </tr>
		                <tr>
		                    <td class="litText">
		                        <asp:CheckBox cssclass="litInputCheckbox" Checked="true" id="c_checkCanDeletePageType" runat="server"/>
		                        <Foundation:ModuleString ID="ModuleString14" Name="PageTypeEditCanDeletePageType" runat="server"/>
		                    </td>
		                </tr>
		            </table>
		        </fieldset>
		    </div>
    </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>
