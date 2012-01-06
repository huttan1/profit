<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_LanguageEdit1, Litum.Studio.Web" %>

<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
        <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
		    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
		    <toolbar:DividerItem ID="DividerItem1" ImageURL="../images/transparent.gif" Class="litToolbarSpace" runat="server" />
		    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="../../LitiumStudio/Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
	    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconLanguages" /><asp:Label
		runat="server" ID="c_labelHeader" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
        <table border="0" cellspacing="0" cellpadding="0">
	        <tr>
		        <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString6" Name="DefaultLanguage" runat="server"/>:</td>
	        </tr>
	        <tr>
		        <td><asp:CheckBox cssclass="litInputCheckbox" id="c_checkBoxDefaultLanguage" runat="server"/></td>
		        <td style="padding-left:10px;" class="litErrorMsg"></td>
	        </tr>
        </table><br />
        <table border="0" cellspacing="0" cellpadding="0">
	        <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString Name="LanguageName" runat="server" ID="Systemstring4"/><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
		    </tr>
		    <tr>
			    <td><asp:TextBox cssclass="litInputText200" id="c_textBoxLanguageName" runat="server"/></td>
			    <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorLanguageName" runat="server" ControlToValidate="c_textBoxLanguageName" OnServerValidate="ValidateLanguageName" cssClass="error"/></td>
		    </tr>
	    </table><br />
	    <table border="0" cellspacing="0" cellpadding="0">
		    <tr>
			    <td colspan="2" class="litBoldText"><Foundation:SystemString ID="SystemString1" Name="SelectCulture" runat="server" />:</td>
		    </tr>
		    <tr>
			    <td><ComponentArt:ComboBox TextBoxEnabled = "false" 
                Id="c_dropDownListCulture"
                RunAt="Server"
                Width="200"
                Height="20"
                AutoHighlight="false"
                AutoComplete="true"
                AutoFilter="true"
                ItemClientTemplateId="LanguageItemTemplate"
                ItemCssClass="ddn-item"
                ItemHoverCssClass="ddn-item-hover"
                CssClass="cmb"
                HoverCssClass="cmb-hover"
                TextBoxCssClass="txt"
                DropHoverImageUrl="../../LitiumStudio/Images/combobox/ddn-hover.png"
                DropImageUrl="../../LitiumStudio/Images/combobox/ddn.png"
                DropDownResizingMode="bottom"
                DropDownWidth="200"
                DropDownHeight="160"
                DropDownCssClass="ddn"
                DropDownContentCssClass="ddn-con">
              <ClientTemplates>
                    <ComponentArt:ClientTemplate ID="LanguageItemTemplate">
                        <img src="../images/icons_standard/flags/##DataItem.get_id()##.png" class="icon" width="16" height="16" alt="##DataItem.get_id()##" title="##DataItem.get_id()##" />
                        ## DataItem.get_text() ##
                    </ComponentArt:ClientTemplate>
               </ClientTemplates>
            <DropDownFooter><div class="ddn-ftr"></div></DropDownFooter>
        </ComponentArt:ComboBox></td>
			    <td style="padding-left:10px;" class="litErrorMsg"></td>
		    </tr>
	    </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(c_textBoxLanguageName.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
        if (focusObject && !focusObject.disabled) { focusObject.focus(); }
    </script>
</asp:Content>