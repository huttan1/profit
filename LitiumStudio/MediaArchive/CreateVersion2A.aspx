<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateVersion2A, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemBack" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">     
        <Foundation:ModuleString ID="ModuleString9" Name="CreateVersionPageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString10" Name="CreateVersionPage2SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:ModuleString Name="CreateVersionPage2Description1" runat="server" ID="Modulestring2"/><br /><br /></span>
        <table border="0" cellspacing="0" cellpadding="0" ID="Table1">
	        <tr>
		        <td colspan="2" class="litText"><b><Foundation:ModuleString Name="Width" runat="server" ID="Modulestring1"/>:</b></td>
	        </tr>
	        <tr>
		        <td><asp:TextBox Runat="server" ID="mc_textBoxWidth" CssClass="litInputText" Style="width:60px;" />&nbsp;<span class="litText">px</span></td>
		        <td style="padding-left:10px;" class="litErrorMsg"><asp:RequiredFieldValidator Runat="server" ID="mc_validatorRequiredWidth" Display="Dynamic" ControlToValidate="mc_textBoxWidth"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Systemstring1"/></asp:RequiredFieldValidator><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorWidth" ControlToValidate="mc_textBoxWidth" ValidationExpression="[0-9+]*" ><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="ValidationOnlyNumeric" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator></td>
	        </tr>
        </table><br />
        <table border="0" cellspacing="0" cellpadding="0" ID="Table2">
	        <tr>
		        <td colspan="2" class="litText"><b><Foundation:ModuleString Name="Height" runat="server" ID="Modulestring3"/>:</b></td>
	        </tr>
	        <tr>
		        <td><asp:TextBox Runat="server" ID="mc_textBoxHeight" CssClass="litInputText" Style="width:60px;" />&nbsp;<span class="litText">px</span></td>
		        <td style="padding-left:10px;" class="litErrorMsg"><asp:RequiredFieldValidator Runat="server" ID="mc_validatorRequiredHeight" Display="Dynamic" ControlToValidate="mc_textBoxHeight"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Systemstring2"/></asp:RequiredFieldValidator><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorHeight" ControlToValidate="mc_textBoxHeight" ValidationExpression="[0-9+]*" ><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="ValidationOnlyNumeric" runat="server" ID="Modulestring7"/></asp:RegularExpressionValidator></td>
	        </tr>
        </table><br />
        <script type="text/javascript">
        //<!--
        widthValue = 0;
        heightValue = 0;
        function sizeBlur(changedControl, widthID, heightID, checkboxID, originalWidth, originalHeight)
        {
            // Get new height and width
            widthValue = parseInt(document.getElementById(widthID).value);
            heightValue = parseInt(document.getElementById(heightID).value);
            
            // Alert if new image size is bigger than original
            if (widthValue > originalWidth || heightValue > originalHeight) 
            {
                alert('<Foundation:ModuleString Name="ValidationResizeImage" runat="server" ID="Modulestring333"/>');
            }
	        if(document.getElementById(checkboxID).checked == true) 
	        {
	            // Maintain aspects ratio
		        if (changedControl == "width") 
		        {
			        if (widthValue != NaN)
			        {
				        document.getElementById(heightID).value = Math.round(originalHeight * (widthValue/originalWidth));
			        }
		        }
		        else 
		        {
			        if (heightValue != NaN) 
			        {
				        document.getElementById(widthID).value = Math.round(originalWidth * (heightValue/originalHeight));
			        }
		        }
	        }
        }
        //-->
        </script>
        <table border="0" cellspacing="0" cellpadding="0" ID="Table3">
	        <tr>
		        <td class="litText"><asp:CheckBox Runat="server" ID="mc_checkboxKeepRatio" Checked="true" /> <Foundation:ModuleString Name="LabelKeepRatio" runat="server" ID="Modulestring8"/></td>
	        </tr>
        </table>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById("<% Response.Write(mc_textBoxWidth.ClientID.ToString()); %>");
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>