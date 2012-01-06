<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_ViewPayment, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    
    <ComponentArt:ToolBar ID="c_toolbarViewPayment"
        OnItemCommand="c_toolbarViewPayment_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemBack" ImageUrl="icons_standard/arrow_left_blue_16px.png"
                AutoPostBackOnSelect = "true"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
     <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <span class="litContentTopHeader">
                <Foundation:ModuleString ID="c_moduleStringHeader" Name="PaymentForOrder" runat="server" />:<asp:Label runat="server" ID="c_labelHeader" class="litPageStatusHeaderV2"/></span> 
            </td>
        </tr>
    </table>     
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
<div class="lsContentScroll" >
    <table >
        <tr>
            <td valign="top">
            <div style="padding-right: 15px;">
                <Foundation:InformationGroup runat="server" ID="c_informationGroupPaymentInfo" Width="250" HeaderText="PaymentInfo123">
                    <table>
                         <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAmount" Name="Amount" Runat="server"/>:</div>
                                <asp:Label ID="c_labelAmount" runat="server" CssClass="litText"></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPaymentDate" Name="PaymentDate" Runat="server"/>:</div>
                                <asp:Label ID="c_labelPaymentDate" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPaymentMethod" Name="PaymentMethod" Runat="server"/>:</div>
                                <asp:Label ID="c_labelPaymentMethod" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPaymentProvider" Name="PaymentProvider" Runat="server"/>:</div>
                                <asp:Label ID="c_labelPaymentProvider" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPaymentStatus" Name="PaymentStatus" Runat="server"/>:</div>
                                <asp:Label ID="c_labelPaymentStatus" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringVatAmount" Name="TotalVATAmount" Runat="server"/>:</div>
                                <asp:Label ID="c_labelVatAmount" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringVatPercentage" Name="VatPercentage" Runat="server"/>:</div>
                                <asp:Label ID="c_labelVatPercentage" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringTransactionReference" Name="TransactionReference" Runat="server"/>:</div>
                                <asp:Label ID="c_labelTransactionReference" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr id = "c_rowExternalMessage" runat = "server">
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringExternalMessage" Name="ExternalMessage" Runat="server"/>:</div>
                                <asp:Label ID="c_labelExternalMessage" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                    </table>
                </Foundation:InformationGroup>   
                </div>             
            </td>
            <td valign = "top">
                <Foundation:InformationGroup runat="server" ID="c_informationGroupBillingAddress" Width="250" HeaderText="Billing Address123">
                    <table>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringFirstName" Name="FirstName" Runat="server"/>:</div>
                                <asp:Label ID="c_labelFirstName" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringLastName" Name="LastName" Runat="server"/>:</div>
                                <asp:Label ID="c_labelLastName" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                         <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddressRow1" Name="AddressRow1" Runat="server"/>:</div>
                                <asp:Label ID="c_labelAddressRow1" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringAddressRow2" Name="AddressRow2" Runat="server"/>:</div>
                                <asp:Label ID="c_labelAddressRow2" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringZip" Name="Zip" Runat="server"/>:</div>
                                <asp:Label ID="c_labelZip" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCity" Name="City" Runat="server"/>:</div>
                                <asp:Label ID="c_labelCity" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCountry" Name="Country" Runat="server"/>:</div>
                                <asp:Label ID="c_labelCountry" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringPhone" Name="Phone" Runat="server"/>:</div>
                                <asp:Label ID="c_labelPhone" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>    
                        <tr>
                            <td>
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringMobile" Name="MobilePhone" Runat="server"/>:</div>
                                <asp:Label ID="c_labelMobilePhone" runat="server" CssClass="litText" ></asp:Label>
                            </td>
                        </tr>                         
                    </table>
                </Foundation:InformationGroup>
            </td>            
        </tr>
        <tr>
            <td>
                <Foundation:InformationGroup runat="server" ID="c_informationGroupInvoice" Width="250" HeaderText="Invoice123">
                    <table>
                        <tr>
                            <td>
                                 <div class = "litBoldHeader"><asp:HyperLink ID="c_hyperlinkInvoice" runat="server" Text = "Invoice" Target = "_blank" NavigateUrl = "http://www.kreditor.se"></asp:HyperLink></div>
                            </td>
                        </tr>
                    </table>
                </Foundation:InformationGroup> 
            </td>
        </tr>
        <tr>
            <td valign = "top" colspan = "2">
                <div id="c_divAdditionalInfo" runat="server">
                    <Foundation:InformationGroup runat="server" ID="c_informationGroupAdditionalInfo" Width="505" HeaderText="PaymentsAdditionalInfo">
                        <asp:Repeater ID="c_repeaterAdditionalInfo" runat="server">
                            <ItemTemplate>
                                <div class="litBoldHeader">
                                <asp:Label ID="c_labelAdditionalInfoKey" runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Key")%>'></asp:Label>:</div>
                                <asp:Label ID="c_labelAdditionalInfoValue"  runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value")%>'></asp:Label>
                            </ItemTemplate>
                        </asp:Repeater>
                    </Foundation:InformationGroup>
                </div>
            </td>
        </tr>
    </table>
    </div>
    <Foundation:InformationGroup runat="server" ID="InformationGroupRows" HeaderTextName="PaymentInfoRows">                    
    <br />
		    <LS:GridHelperAjax runat="server" AssociatedControlID="c_rowGrid" ID="c_rowGridHelper"
			    OnNeedData="grid_NeedData" AllowPaging="false" FullHeight="false" PreserveSelectedItems="false"
                AllowRowSelect="false" AllowScroll="false"/>
		    <Telerik:RadGrid runat="server" ID="c_rowGrid">
			    <MasterTableView runat="server">
				    <Columns>
					    <Telerik:GridBoundColumn DataField="Description" HeaderStyle-Width="40%" AllowSorting="false" ItemStyle-CssClass="DataCellTextInCoupleLines"/>
                        <Telerik:GridBoundColumn DataField="VatPercentage" HeaderStyle-Width="15%" AllowSorting="false" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="right"/>
                        <Telerik:GridBoundColumn DataField="TotalVatAmount" HeaderStyle-Width="15%" AllowSorting="false" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="right"/>                        
                        <Telerik:GridBoundColumn DataField="Quantity" HeaderStyle-Width="15%" AllowSorting="false" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="right"/>
                        <Telerik:GridBoundColumn DataField="TotalPrice" HeaderStyle-Width="15%" AllowSorting="false" ItemStyle-HorizontalAlign="right" HeaderStyle-HorizontalAlign="right"/>                                               
				    </Columns>
			    </MasterTableView>
		    </Telerik:RadGrid>	                
    </Foundation:InformationGroup> 
</asp:Content>

