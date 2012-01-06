<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_PredefinedVersionAddEdit, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
<script type = "text/javascript">

    // Called from the onToolbarItemSelect event of the toolbar in the current page.
    function toolbarItemSelected(sender, eventArgs)
    {
        var toolbarItem = eventArgs.get_item().get_id();  
//        if(toolbarItem == 'c_toolbarItemCancel')
//        {
//            __doPostBack('cancel', '');
//        }
//        else if(toolbarItem == 'c_toolbarItemSave')
//        {
//            if(Page_IsValid)
//            {
//                __doPostBack('save', '');
//            }      
//        }
    }
    
    </script>

  <ComponentArt:ToolBar ID="c_toolbarPredefinedVersionAddEdit"
		runat="server" OnItemCommand="c_toolbarPredefinedVersionAddEdit_ItemCommand"
		CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
		DefaultItemDisabledCssClass="litToolbarItemDisabled" 
		ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
		Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem ID="c_toolbarItemCancel" runat="server"
			    ImageUrl="icons_standard/sign_stop.png" CausesValidation="False"
			    AutoPostBackOnSelect = "true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem ID="c_toolbarItemSave" runat="server" ImageUrl="icons_standard/floppy_disk_blue.png"
			    CausesValidation="true" AutoPostBackOnSelect = "true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
		<ClientEvents>
            <ItemSelect EventHandler="toolbarItemSelected" />
        </ClientEvents>
        <ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
		                    </td>
		                    <td class="ca_tb_txt ToolbarItemMain">
		                        <nobr>## DataItem.get_text() ##</nobr>
		                    </td>
		                    <td class="ToolbarItemRight">
		                        &nbsp;
		                    </td>
		                </tr>
		            </tbody>
		         </table>			       
		    </ComponentArt:ClientTemplate>
		</ClientTemplates>
	</ComponentArt:ToolBar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">  
	<Foundation:ModuleString ID="c_moduleStringAddEditVersionHeader" runat="server" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
<div class="lsContentScroll">
    <table>
    <tr>
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringName" Name="Name" Runat="server"/>
            <img src="~/LitiumStudio/Images/icons_standard/Required.png" runat="server" id="c_imageRequiredAddress1" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
            <asp:TextBox CssClass="litInputText200" runat="server" MaxLength = "200" ID="c_textBoxName"></asp:TextBox>
            <asp:RequiredFieldValidator ID="c_validatorName" ControlToValidate = "c_textBoxName" runat="server" Display = "Dynamic">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString Name="RequiredField" runat="server" ID="Systemstring1"/>
            </asp:RequiredFieldValidator>
            <br />
            <br />
        </td>
    </tr>
    <tr>        
        <td class="litBoldHeader">
                <Foundation:ModuleString ID="c_scaleOptions" Name="ScaleOptions" Runat="server"/><img src="~/LitiumStudio/Images/icons_standard/Required.png" runat="server" id="Img1" style="vertical-align:middle;" class="litIconRequired" alt="" />:             
                <br />
        </td>     
    </tr>
    <tr class="litText">
        <td>
             <asp:RadioButton ID="c_radioButtonMaxHeightWidth" GroupName="PredifinedVersionGroup" runat="server" OnCheckedChanged="c_radioButtonMaxHeightWidth_Checked" Checked="true" AutoPostBack="true"/><Foundation:ModuleString ID="ModuleString1" Name="Pixels" Runat="server"/>
             <br />
        </td>
    </tr>
    <tr class="litText">
        <td>
             <asp:RadioButton ID="c_radioButtonPercent" GroupName="PredifinedVersionGroup" runat="server" OnCheckedChanged = "c_radioButtonPercentage_Checked" AutoPostBack="true"/><Foundation:ModuleString ID="ModuleString2" Name="Percentage" Runat="server"/>
        </td>
    </tr>
    <tr id="c_trPixels" runat="server">
        <td>
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMaxWidth" Name="MaxWidth" Runat="server"/>:</div>
            <asp:TextBox CssClass="litInputText200"  MaxLength = "200" runat="server" ID="c_textBoxMaxWidth"></asp:TextBox>                           
            <asp:RegularExpressionValidator ID="c_validatorMaxWidthContent" runat="server" ControlToValidate="c_textBoxMaxWidth" Display="Dynamic" ValidationExpression="^\d+$">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString Name="MessageNumericInputValidationError" runat="server"/>
            </asp:RegularExpressionValidator>
            <asp:CustomValidator ID="c_validatorMaxWidthSize" Runat="server" ControlToValidate="c_textBoxMaxWidth" Display="Dynamic" OnServerValidate="Validate_MaxWidth">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString Name="MessageInvalidSize" runat="server"/>
            </asp:CustomValidator>
            
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMaxHeight" Name="MaxHeight" Runat="server"/>:</div>
            <asp:TextBox CssClass="litInputText200"  MaxLength = "15" runat="server" ID="c_textBoxMaxHeight"></asp:TextBox>            	                
            <asp:RegularExpressionValidator ID="c_validatorMaxHeightContent" runat="server" ControlToValidate="c_textBoxMaxHeight" Display="Dynamic" ValidationExpression="^\d+$">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString Name="MessageNumericInputValidationError" runat="server" ID="Modulestring4"/>
            </asp:RegularExpressionValidator>
            <asp:CustomValidator ID="c_validatorMaxHeightSize" Runat="server" ControlToValidate="c_textBoxMaxHeight" Display="Dynamic" OnServerValidate="Validate_MaxHeight">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString ID="ModuleString5" Name="MessageInvalidSize" runat="server"/>
            </asp:CustomValidator>            
            
            <br />
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringKeepAspectRatio" Name="KeepAspectRatio" Runat="server"/>:</div>
            <asp:CheckBox ID="c_checkBoxKeepAspectRatio" runat="server" Checked="true" />
        </td>
    </tr>
    <tr  id="c_trMaxPercentage" runat="server" visible="false">
        <td>                       
            <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString13" Name="Percentage" Runat="server"/>
            <img src="~/LitiumStudio/Images/icons_standard/Required.png" runat="server" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
            <asp:TextBox  CssClass="litInputText200"  MaxLength = "15" runat="server" ID="c_textBoxPercentage"></asp:TextBox>
            <asp:RequiredFieldValidator ID="c_validatorPercentage" ControlToValidate = "c_textBoxPercentage" runat="server" Display="Dynamic">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString Name="RequiredField" runat="server"/>
            </asp:RequiredFieldValidator>
            <asp:RegularExpressionValidator ID="c_validatorPercentageContent" runat="server" ControlToValidate="c_textBoxPercentage" Display="Dynamic" ValidationExpression="^\d+$">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString Name="c_validatorPercentage" runat="server" ID="Modulestring14"/>
            </asp:RegularExpressionValidator>
            <asp:CustomValidator ID="c_validatorPercentageSize" Runat="server" ControlToValidate="c_textBoxPercentage" Display="Dynamic" OnServerValidate="Validate_Percent">
                <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
				<Foundation:ModuleString Name="MessageInvalidPercentValue" runat="server"/>
            </asp:CustomValidator>
        </td>
    </tr>
</table>
</div>
</asp:Content>

