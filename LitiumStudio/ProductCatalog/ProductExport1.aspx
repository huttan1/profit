<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_ProductExport1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>





<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconExport2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemExport" OnClick="ToolbarItemExport_Click" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" class="litIconExport2" alt="" runat="server" style="vertical-align:middle;" id="c_imageIcon" /><Foundation:ModuleString ID="ModuleString1" Name="ExportProducts" Runat="server"/>    
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
		<Foundation:InformationGroup runat="server" ID="c_informationGroup1" Width="600px" >
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
	        <tr>
		        <td valign="top">
		            <div class="litDescriptionText"><Foundation:ModuleString ID="ModuleString2" Name="ExportDescription" Runat="server"/></div>
		            <div class="litBoldHeader" style="margin-top:30px;"><Foundation:ModuleString ID="ModuleString3" Name="Language" Runat="server"/></div>
		            <asp:ListBox Runat="server" ID="c_listBoxLanguage1" SelectionMode="Single" Rows="1" CssClass="litInputSelect" />
		            <div class="litText" style="margin-top:15px;">
		                <asp:CheckBox cssclass="litInputCheckBox" id="c_checkBoxRecursive" runat="server" Checked="true"/> 
		                <asp:Label ID="Label1" runat="server" AssociatedControlID="c_checkBoxRecursive"><Foundation:ModuleString ID="ModuleString4" Name="ExportRecursive" Runat="server"/></asp:Label>
		            </div>
		            <div class="litText" style="margin-top:5px;">
		                <asp:CheckBox cssclass="litInputCheckBox" id="c_checkBoxOnlyPublishedArticles" runat="server" Checked="true"/> 
		                <asp:Label ID="Label3" runat="server" AssociatedControlID="c_checkBoxOnlyPublishedArticles"><Foundation:ModuleString ID="ModuleString7" Name="ExportOnlyPublishedProducts" Runat="server"/></asp:Label>
		            </div>
		            <div class="litText" style="margin-top:5px;">
		                <asp:CheckBox cssclass="litInputCheckBox" id="c_checkBoxTransformOutput" runat="server" /> 
		                <asp:Label ID="c_labelTransformOutput" runat="server" AssociatedControlID="c_checkBoxTransformOutput"><Foundation:ModuleString ID="ModuleStringExportTransformOutput" Name="ExportTransformOutput" Runat="server"/></asp:Label>
		            </div>
                    <div class="litBoldText" style="margin-top:30px;">
		                <asp:CheckBox cssclass="litInputCheckBox" id="c_checkBoxSaveImageToDisc" runat="server" /> 
		                <asp:Label ID="Label2" runat="server" AssociatedControlID="c_checkBoxSaveImageToDisc"><Foundation:ModuleString ID="ModuleString5" Name="ExportSaveToDisc" Runat="server"/></asp:Label>
		            </div>		            
		            
		            <div style="margin-top:5px;">
		                <asp:Label ID="Label4" CssClass="litText" runat="server" AssociatedControlID="c_textBoxFilePath"><Foundation:ModuleString ID="ModuleString6" Name="ExportFilePath" Runat="server"/></asp:Label><br />
                        <asp:TextBox cssclass="litInputText" id="c_textBoxFilePath" runat="server"/> <asp:RequiredFieldValidator runat="server" SetFocusOnError="true" ID="c_RequiredFieldValidatorInputFile" CssClass="litErrorMsg" ControlToValidate="c_textBoxFilePath" Display="Dynamic" />
                    </div>
                    <div style="margin-top:30px;">
                        <div class="litBoldText" style="margin-bottom:5px;"><Foundation:ModuleString ID="ModuleString8" Name="ExportFilesDescription" Runat="server"/></div>
                        <asp:RadioButton runat="server" ID="c_radioButtonLink" Checked="true" CssClass="litInputRadio" GroupName="ExportFiles" /><asp:Label ID="Label5" runat="server" CssClass="litText" AssociatedControlID="c_radioButtonLink"><Foundation:ModuleString ID="ModuleString9" Name="ExportSaveAsLink" Runat="server"/></asp:Label><br />
                        <asp:RadioButton runat="server" ID="c_radioButtonBinaryData" CssClass="litInputRadio" GroupName="ExportFiles" /><asp:Label ID="Label6" runat="server" CssClass="litText" AssociatedControlID="c_radioButtonBinaryData"><Foundation:ModuleString ID="ModuleString10" Name="ExportSaveAsBinaryData" Runat="server"/></asp:Label>
                    </div>
		            <asp:Panel id="c_panelError" runat="server">
		                <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring2"/></b></legend><img src="images/transparent.gif" width="5" alt="" /><br />
			                <asp:Label id="c_labelError" runat="server"/>
			            </fieldset>
		            </asp:Panel>
		        </td>
	        </tr>
        </table>
        </Foundation:InformationGroup>
    </div>
    <script type="text/javascript">
        //var focusObject = document.getElementById("<%// Response.Write(c_dropDownListDefinition.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemExport.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        //if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>
