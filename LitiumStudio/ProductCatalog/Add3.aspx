<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_Add3, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>


<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateAbort" OnClick="ToolbarItemAbort_Click" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreatePrevious" OnClick="ToolbarItemCreatePrevious_Click" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateSave" OnClick="ToolbarItemCreateSave_Click" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem4"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateView" OnClick="ToolbarItemCreateView_Click" runat="server"/>
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem3"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreateTranslate" OnClick="ToolbarItemCreateTranslate_Click" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" class="litIconProductGroup" alt="" runat="server" id="c_imageIcon" /><Foundation:ModuleString ID="ModuleString1" Name="AddHeader" Runat="server"/>&nbsp;<asp:label id="c_label" runat="server" /><span class="litTextNormalWeight">&nbsp;<Foundation:ModuleString ID="ModuleString2" Name="HeaderStepThreeOfThree" Runat="server"/></span>   
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="440px" >
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
	        <tr>
		        <td valign="top" class="litGuideStars2">
		            <div class="litDescriptionText"><Foundation:ModuleString ID="ModuleString3" Name="Add3Description" Runat="server"/>&nbsp;<strong><asp:Label id="c_selectedLanguage" runat="server" /></strong>.</div>
		            <div class="litDescriptionText" style="margin-top:20px; font-weight:bold;" runat="server" id="c_noInformation" visible="false"><Foundation:ModuleString ID="ModuleString4" Name="MissingDefinitionFields" Runat="server"/></div>
                     <asp:Repeater id="c_PropertiesRepeater" runat="server" OnItemDataBound="PropertiesRepeater_ItemBound" OnItemCommand="PropertiesRepeater_ItemCommand">
		                <ItemTemplate>
		                    <div style="clear:both;"></div>
		                    <div style="margin-top:15px;"><asp:Label runat="server" id="repeaterLabel" CssClass="litBoldText"/><asp:Label runat="server" id="repeaterLabelRequired" CssClass="litText" Visible="false"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequiredForPublishing" alt="" /></asp:Label></div>
                            <div style="float:left;width:406px;">
                                <asp:HiddenField runat="server" id="templateFieldId" visible="false"/>
                                <asp:HiddenField runat="server" id="languageId" visible="false"/>
                                
                                <asp:TextBox runat="server" id="textbox" cssclass="litInputText" visible="false" />
                                <asp:DropDownList runat="server" id="dropDownList" cssClass="litInputSelect" style="width:406px;" Visible="false" />
                                <LS:HtmlEditor runat="server" ID="editor" Visible="false" Width="400px" Height="300px" />
                                <asp:RadioButtonList id="trueFalse" runat="server" cssclass="litInputRadio" visible="false"/> 
                                
                                <asp:FileUpload runat="server" id="fileupload" cssclass="litInputFile" visible="false" style="float:left; width:350px;"/>
                                <div runat="server" id="mediabankfiles" visible="false" style="clear:both;">
                                    <input type="text" runat="server" readonly="readonly" id="mediabankfiledispname" class="litInputText100" style="width:276px;"/>
                                    <input type="button" runat="server" id="mediabankbutton" class="litInputText" style="width:auto;margin-left:-2px;" visible="true" />
                                    <input type="hidden" runat="server" id="mediabankfileid"/>
                                    <input type="hidden"  runat="server" id="mediabankversionid"/>
                                </div>
                                
                                <asp:Image id="fileImage" runat="server" visible="false" style="vertical-align:middle; margin-top:4px;"/>
                                <asp:HyperLink runat="server" id="fileLink" cssclass="litText" visible="false" style="margin-top:4px;"/><asp:label runat="server" id="fileText" cssclass="litText" visible="false"/>
                                <asp:ImageButton visible="false" imageurl="Images/transparent.gif" runat="server" id="button" causesvalidation="False" cssclass="litIconDelete" borderwidth="0" style="vertical-align:middle; margin-top:4px;" />
                                
                                <ComponentArt:Calendar id="pickerDateTime" Visible="false" runat="server" />
                                <img id="imageSetDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" /><img id="imageClearDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar_clear.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" />
                                <ComponentArt:Calendar runat="server" id="calendarDateTime" visible="false" />
                            </div>
                            <asp:RegularExpressionValidator display="dynamic" SetFocusOnError="true" runat="server" cssclass="litErrorMsg" id="regexpvalidator" style="float:left; padding-left:10px; padding-top:2px;"/>
                            <asp:RequiredFieldValidator display="dynamic" SetFocusOnError="true" runat="server" cssclass="litErrorMsg" id="requiredvalidator" style="float:left; padding-left:10px; padding-top:2px;"/>
                            <asp:Label runat="server" ID="labelVariantField" Visible="false" cssclass="litText" style="float:left; padding-left:10px; padding-top:2px;"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconLockOpen" alt="" /><Foundation:ModuleString ID="ModuleString6" Name="VariantField" Runat="server"/></asp:Label>
		                </ItemTemplate>
		            </asp:Repeater>
		        </td>
	        </tr>
        </table>
         </Foundation:InformationGroup>
    </div>
    <script type="text/javascript">
        var firstCustomFieldClientId = '<% Response.Write(firstCustomFieldClientId); %>';
        var focusObject = null;
        if (firstCustomFieldClientId.length > 0)
            focusObject = document.getElementById("<% Response.Write(firstCustomFieldClientId); %>");
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
     <MediaArchive:MediaArchiveDialog id="mediabankdialog" runat="server"/>
</asp:Content>