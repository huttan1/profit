<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_EditPrice, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>




<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
<script type="text/javascript">   

   function PriceChanged(textboxPriceClientId, textboxVatPercentageClientId, textboxPriceWithVatClientId, priceListClientId)
   {		
		var textboxPrice = document.getElementById(textboxPriceClientId);
		var textboxVatPercentage = document.getElementById(textboxVatPercentageClientId);
		var textboxPriceWithVat = document.getElementById(textboxPriceWithVatClientId);
		var priceListId = document.getElementById(priceListClientId).value;

		var price = textboxPrice.value;
		var vatPercentage = textboxVatPercentage.value;
		
        if(vatPercentage == '')
        {
            vatPercentage = 0;
        }
        PageMethods.FormatValue(priceListId, price, vatPercentage, null, function(d) {
			textboxPrice.value = d[0];
			textboxVatPercentage.value = d[1];
			textboxPriceWithVat.value = d[2];
			textboxVatPercentage.focus();
		}, function(f) { });
   }

   function VatPercentageChanged(textboxPriceClientId, textboxVatPercentageClientId, textboxPriceWithVatClientId, priceListClientId)
   {	
	var textboxPrice = document.getElementById(textboxPriceClientId);
	var textboxVatPercentage = document.getElementById(textboxVatPercentageClientId);
	var textboxPriceWithVat = document.getElementById(textboxPriceWithVatClientId);
	var priceListId = document.getElementById(priceListClientId).value;

	var price = textboxPrice.value;
	var vatPercentage = textboxVatPercentage.value;
	if(vatPercentage == '')
    {
        vatPercentage = 0;
    }

    PageMethods.FormatValue(priceListId, price, vatPercentage, null, function(d) {
		textboxPrice.value = d[0];
		textboxVatPercentage.value = d[1];
		textboxPriceWithVat.value = d[2];
		textboxPriceWithVat.focus();
	}, function(f) { });
   }

   function PriceWithVatChanged(textboxPriceClientId, textboxVatPercentageClientId, textboxPriceWithVatClientId, priceListClientId)
   {
       var textboxPrice = document.getElementById(textboxPriceClientId);
       var textboxVatPercentage = document.getElementById(textboxVatPercentageClientId);
       var textboxPriceWithVat = document.getElementById(textboxPriceWithVatClientId);
       var priceListId = document.getElementById(priceListClientId).value;
   	    var priceWithVat = textboxPriceWithVat.value;
   	    var vatPercentage = textboxVatPercentage.value;
   	    if(vatPercentage == '')
        {
            vatPercentage = 0;
        }
        PageMethods.FormatValue(priceListId, null, vatPercentage, priceWithVat, function(d) {   	    
   		    textboxPrice.value = d[0];
   		    textboxVatPercentage.value = d[1];
   		    textboxPriceWithVat.value = d[2];
   	    }, function(f) { });
   }
   
</script>
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server" >
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click" runat="server"/>	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<img src="Images/transparent.gif" class="litIconArticle" alt="" runat="server" id="imageIcon"/><asp:Label runat="server" ID="c_labelHeader" />       
</asp:Content>
<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
     <div class="lsContentTabScroll">
		<div class="lsTabContainer">
			<WebControls:TabListContainer ID="m_tabs" runat="server">
				<tabitems>
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemGeneral" OnClick="TabItemGeneral_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemIncludedArticles" OnClick="TabItemIncludedArticles_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemPrice" OnClick="TabItemPrice_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                    <WebControls:TabListItem CausesValidation="true" ID="c_tabItemSettings" OnClick="TabItemSettings_Click" LinkClass="litTabItemLink" LinkSelectedClass="litTabItemLink litTabItemCurrentLink" ListClass="litTabItemLI" ListSelectedClass="litTabItemLI litTabItemLICurrent" runat="server" />
                </tabitems>
			</WebControls:TabListContainer>
            <div class="lsContentNoScroll">
                <table cellpadding="15" cellspacing="0" border="0" style="width:100%;">
                    <tr id = "c_rowAddToNewPriceList" runat="server">
                        <td  class="lsContentScroll">
                            <div class="litBoldText">
                                <Foundation:ModuleString ID="AddToPriceList" Name="AddToPriceList" Runat="server"/>                            
                            </div>
                            <asp:DropDownList ID="c_dropdownListPriceLists" runat="server" CssClass="litInputSelect" />
                            <asp:Button ID="c_buttonAddNewPriceList" CssClass="litInputButton" runat="server" Text = "Add" OnClick="c_buttonAddNewPriceList_Click" style="margin-left: 5px; width: auto;"/>
                        </td>
                    </tr>
	                <tr>
		                <td valign="top" style="padding-top: 5px;">
		                <asp:GridView runat="server" ID="c_pricelist" Width="100%" CellPadding="0" CellSpacing="0" AutoGenerateColumns="false" GridLines="Horizontal" CssClass="priceListTbl" OnRowDataBound="c_pricelist_RowDataBound" OnRowDeleting="c_pricelist_RowDeleting">
								<Columns>
									<asp:TemplateField  HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem"  HeaderStyle-Width="15%">
										<HeaderTemplate>
											<Foundation:ModuleString ID="ModuleString1" runat="server" Name="PriceList" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:literal runat="server" ID="c_name" />
											<asp:HiddenField id="c_hiddenPriceListId" runat="server" />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField  HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem"  HeaderStyle-Width="15%">
										<HeaderTemplate>
											<Foundation:ModuleString ID="ModuleString6" runat="server" Name="PriceListCurrency" />
										</HeaderTemplate>
										<ItemTemplate>
										<asp:Literal runat="server" ID="c_currency" />
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField  HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem"  HeaderStyle-Width="10%">
										<HeaderTemplate>
											<Foundation:ModuleString ID="ModuleString7" runat="server" Name="Price" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:TextBox ID="c_textboxPrice" runat="server" Width="100" CssClass="litInputText"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField  HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem"  HeaderStyle-Width="10%">
										<HeaderTemplate>
											<Foundation:ModuleString ID="ModuleString8" runat="server" Name="VAT%" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:TextBox ID="c_textboxVatPercentage" runat="server" Width="100" CssClass="litInputText"></asp:TextBox>											
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField  HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem"  HeaderStyle-Width="15%">
										<HeaderTemplate>
											<Foundation:ModuleString ID="ModuleString7" runat="server" Name="PriceWithVat" />
										</HeaderTemplate>
										<ItemTemplate>
											<asp:TextBox ID="c_textboxPriceWithVat" runat="server" Width="100" CssClass="litInputText"></asp:TextBox>
										</ItemTemplate>
									</asp:TemplateField>
									<asp:TemplateField  HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" ItemStyle-HorizontalAlign="Left"  HeaderStyle-Width="55%">
										<HeaderTemplate>
											
										</HeaderTemplate>
										<ItemTemplate>
											<asp:ImageButton ID = "c_imageButtonDelete" CommandName = "Delete" runat = "server" ImageUrl="~/LitiumStudio/Images/icons_standard/delete.png"/>
										</ItemTemplate>
									</asp:TemplateField>
								</Columns>
							</asp:GridView>
		                </td>
	                </tr>
	                <tr>
	                    <td valign="top" style="padding-top: 15px;">
						    <asp:GridView runat="server" ID="c_warehouse" Width="100%" CellPadding="0" CellSpacing="0" AutoGenerateColumns="false" GridLines="Horizontal" CssClass="priceListTbl">
							    <Columns>
								    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="15%">
									    <HeaderTemplate>
										    <Foundation:ModuleString ID="ModuleString10" runat="server" Name="Warehouse" />
									    </HeaderTemplate>
									    <ItemTemplate>
										    <%#Eval("WarehouseName")%></ItemTemplate>
								    </asp:TemplateField>
								    <asp:TemplateField HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="15%">
									    <HeaderTemplate>
										    <Foundation:ModuleString ID="ModuleString11" runat="server" Name="StockBalance" />
									    </HeaderTemplate>
									    <ItemTemplate>
										    <%# Eval("StockBalance")%></ItemTemplate>
								    </asp:TemplateField>
								    <asp:TemplateField  HeaderStyle-CssClass="priceListTblHeader" ItemStyle-CssClass="priceListTblItem" HeaderStyle-Width="70%">
										<HeaderTemplate>
											
										</HeaderTemplate>
										<ItemTemplate>
										</ItemTemplate>
									</asp:TemplateField>
							    </Columns>
						    </asp:GridView>
	                    </td>
	                </tr>
                </table>
			</div>
        </div>
    </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>