<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" inherits="LitiumStudio_ProductCatalog_SettingsStockKeepingUnitAddEdit, Litum.Studio.Web" enableeventvalidation="false" validaterequest="false" %>
    
<%@ Import Namespace="Litium.Studio.UI.ProductCatalog.Common.Constants"%>

<%@ MasterType VirtualPath="~/LitiumStudio/Framework/ControlPanel.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <ComponentArt:ToolBar ID="ListToolbar" AutoPostBackOnSelect="true" OnItemCommand="ToolBar_ItemCommand"
        runat="server" CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew"
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
        DefaultItemDisabledCssClass="litToolbarItemDisabled" ImagesBaseUrl="~/LitiumStudio/Images/"
        ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
        DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem ID="Abort" runat="server" ImageUrl="icons_standard/sign_stop.png" CausesValidation="False"
                KeyboardShortcut="Esc" ClientSideCommand="cancelClick()" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
            <ComponentArt:ToolBarItem ID="Save" runat="server" ImageUrl="icons_standard/floppy_disk_blue.png"
                KeyboardShortcut="Enter"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
    
	<script type="text/javascript">
	    function cancelClick() {
	        document.location = '<%=UrlConstants.SKU_LIST %>';
            return false;
        }
	</script>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Foundation:ModuleString ID="ModuleString2" runat="server" Name="StockKeepingUnit" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="lsContentScroll">
            <div class="litBoldHeader">
                <Foundation:ModuleString runat="server" Name="StockKeepingUnitCode" /><img src="images/transparent.gif" style="vertical-align: middle;" class="litIconRequired"
							alt="" />
            </div>
            <div>
                <asp:TextBox runat="server" ID="c_skuCode" CssClass="litInputSelect" />
                &nbsp;
                <asp:RequiredFieldValidator ID="c_reqCode" ControlToValidate="c_skuCode" runat="server" Display="Dynamic" />
                <asp:CustomValidator Display="Dynamic" ID="c_custCode" ControlToValidate="c_skuCode" runat="server" OnServerValidate="CodeDuplicateCheck" />
                <asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorSkuCode" ControlToValidate="c_skuCode" ValidationExpression="[^<>\']*">
					<img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
					<Foundation:SystemString Name="MessageMaliciousInput" runat="server" ID="Modulestring18"/>
				</asp:RegularExpressionValidator>
                 <asp:RegularExpressionValidator ID="c_lengthValidatorTemplateName" runat="server"
                                    ControlToValidate="c_skuCode"     
                                    ValidationExpression="^.{1,50}$" >
                    <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
					<Foundation:SystemString Name="ValueOutOfRange" runat="server" ID="SystemString1"/>
				</asp:RegularExpressionValidator>  
			</div>
            <div class="litBoldHeader">
                <Foundation:ModuleString ID="ModuleString1" runat="server" Name="StockKeepingUnitDecimalDigits" />
            </div>
            <div>
                <asp:DropDownList runat="server" ID="c_decimalDigits" CssClass="litInputSelect">
                    <asp:ListItem Value="0" Text="0" />
                    <asp:ListItem Value="1" Text="1" />
                    <asp:ListItem Value="2" Text="2" />
                    <asp:ListItem Value="3" Text="3" />
                    <asp:ListItem Value="4" Text="4" />
                </asp:DropDownList>
            </div>
            <div class="litBoldHeader">
                <Foundation:ModuleString runat="server" Name="Description" />
            </div>
            <asp:DataList runat="server" ID="c_descriptions" RepeatDirection="Horizontal" CellPadding="0"
                CellSpacing="0" OnItemCreated="Description_ItemCreated" DataKeyField="ID">
                <ItemStyle Width="210" />
                <ItemTemplate>
                    <div class="litText">
                        <%#Eval("Name") %></div>
                    <asp:TextBox runat="server" ID="c_description" CssClass="litInputSelect" />
                     <asp:RegularExpressionValidator ID="c_lengthValidatorTemplateName" runat="server"
                                    ControlToValidate="c_description"     
                                    ValidationExpression="^.{0,50}$" >
                    <img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" />
					<Foundation:SystemString Name="ValueOutOfRange" runat="server" ID="SystemString1"/>
				</asp:RegularExpressionValidator>  
                </ItemTemplate>
            </asp:DataList>
    </div>
</asp:Content>
