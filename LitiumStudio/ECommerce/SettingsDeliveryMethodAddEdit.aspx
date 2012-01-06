<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_SettingsDeliveryMethodAddEdit, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.ECommerce.Common.Constants"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <ComponentArt:ToolBar ID="c_toolbarSettingsDeliveryMethodAddEdit"
		OnItemCommand="c_toolbarSettingsDeliveryMethodAddEdit_ItemCommand" runat="server" 
		CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
		DefaultItemDisabledCssClass="litToolbarItemDisabled" 
		ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
		Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
		<Items runat="server">
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemCancel" ImageUrl="icons_standard/sign_stop.png"
			    CausesValidation="False" AutoPostBackOnSelect = "true"  ClientSideCommand="cancelClick()"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
			<ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemSave" ImageUrl="icons_standard/floppy_disk_blue.png"
			    AutoPostBackOnSelect="true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
		</Items>
		<ClientTemplates>
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonTemplate">
		        <table cellspacing="0" cellpadding="0" border="0" style="margin: 0px; margin-right: auto;">
		            <tbody>
		                <tr>
		                    <td class="ToolbarItemLeft">
		                        &nbsp;
		                    </td>
		                    <td class="ca_tb_img ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_imageUrl() ##" alt="" style="display: block;"/>
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
	
	<script type="text/javascript">
	    function cancelClick() {
	        document.location = '<%=UrlConstants.SETTINGS_DELIVERY_METHODS_NAME %>';
            return false;
        }
	</script>
</asp:Content>

 <asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconECommerce" />
	 <asp:Label runat="server" ID="c_header" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
  <div class="lsContentScroll">
            <div class="litBoldHeader">
                <Foundation:ModuleString ID="ModuleString15" Name="Description" runat="server" />:<img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />
            </div>
            <div>
                <asp:TextBox CssClass="litInputText175" runat="server" ID="c_textboxDescription"></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorDescription" ControlToValidate="c_textboxDescription" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
            </div>         
            <div class="litBoldHeader">
                <Foundation:ModuleString ID="ModuleString4" Name="DeliveryVAT" runat="server" />:<img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />
            </div>
            <div>
                <asp:TextBox CssClass="litInputText175" runat="server" ID="c_textBoxDeliveryVAT" MaxLength = "5" ></asp:TextBox>
                <asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorDeliveryVAT" ControlToValidate="c_textBoxDeliveryVAT" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>	                	                
                <asp:CompareValidator Display="Dynamic" ID="c_compareValidatorDeliveryVAT" runat="server" ControlToValidate="c_textBoxDeliveryVAT" Operator="DataTypeCheck" Type="Double" ErrorMessage="*"></asp:CompareValidator>
                <asp:RangeValidator ID="c_rangeValidatorDeliveryVAT" Display="Dynamic" Type="Double" runat="server" MinimumValue="0" MaximumValue="99.99" CultureInvariantValues="true" ControlToValidate = "c_textBoxDeliveryVAT" ErrorMessage="*"></asp:RangeValidator>
            </div>
            <div class="litBoldHeader">
                <Foundation:ModuleString ID="ModuleString1" Name="DeliveryProvider" runat="server" />:
            </div>
            <div>
				<asp:DropDownList runat="server" CssClass="litInputText175" ID="c_deliveryProvider" DataTextField="Name" DataValueField="ID" />
            </div>
    </div>
   
</asp:Content>

