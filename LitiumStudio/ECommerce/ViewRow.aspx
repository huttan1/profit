<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_ViewRow, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <%--<asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
        <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" alt="" class="litIconError" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring2"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
            <asp:Label id="c_labelMajorError" runat="server"/>
        </fieldset>
    </asp:Panel>--%>

     <ComponentArt:ToolBar ID="c_toolbarAddEditOrder" AutoPostBackOnSelect="true" 
        OnItemCommand="c_toolbarViewRow_ItemCommand" runat="server" 
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" 
        DefaultItemHoverCssClass="litToolbarItemOnMouseOver" 
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" 
        DefaultItemDisabledCssClass="litToolbarItemDisabled" 
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" 
        Orientation="Horizontal" DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items runat="server">
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemBack" ImageUrl="icons_standard/arrow_left_blue_16px.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemEdit" ImageUrl="icons_standard/pencil.png"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate" />
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

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <table cellpadding="0" cellspacing="0" border="0" width="100%">
        <tr>
            <td valign="middle" style="height:34px;" class="litPageStatusHeaderV2">
                <div class="litModuleContentWithTreeTopAreaSingleRowV2 ">
                    <div class="litLeftArea">
                        <span class="litContentTopHeader"><img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" />
                        <Foundation:ModuleString ID="c_moduleStringHeader" Name="Order" runat="server" />: <asp:Label runat="server" ID="c_labelHeader" class="litPageStatusHeaderV2"/></span>            
                    </div>
                </div>
            </td>
        </tr>
    </table>
 </asp:Content>
                
 <asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="litModuleContentWithTreeMainSizeV2New">
        <table>
            <tr>
                <td>
                    <div style="float: left; width: 250px; padding-right: 15px;">  
                        <!-- General --> 
                        <Foundation:InformationGroup runat="server" ID="c_informationGroupOrderItem" HeaderText = "" Width="250">
		                    <div style="padding-top:10px;">
		                        <asp:Panel runat="server" ID="c_panelOrderItem" Visible="true">
                                    <table border="0" cellspacing="0" cellpadding="0" width="100%">
			                            <tr>
				                            <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top" width = "40%"><Foundation:ModuleString ID="c_moduleStringDescription" Name="Description" runat="server" />:</td>
				                            <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelDescription" Text = "test" /></td>
			                            </tr>
			                            <tr>
				                            <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="c_moduleStringQuantity" Name="Quantity" runat="server" />:</td>
				                            <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelQuantity" /></td>
			                            </tr>
			                            <tr>
				                            <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="c_moduleStringRowDiscount" Name="DiscountPercentage" runat="server" />:</td>
				                            <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelRowDiscount" /></td>
			                            </tr>
			                            <tr>
				                            <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="c_moduleStringOrderRowTotal" Name="OrderRowTotal" runat="server" />:</td>
				                            <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelOrderRowTotal" /></td>
			                            </tr>
			                            <tr>
				                            <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="c_moduleStringComment" Name="Comment" runat="server" />:</td>
				                            <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelComment" /></td>
			                            </tr>
			                            <tr id = "trStatus" runat = "server" visible = "false">
				                            <td style="padding-bottom:5px; white-space:nowrap;" class="litBoldText" valign="top"><Foundation:ModuleString ID="c_moduleStringStatus" Name="Status" runat="server" />:</td>
				                            <td style="padding-bottom:5px;padding-left:5px;width:100%;" class="litText"><asp:label runat="server" id="c_labelStatus" /></td>
			                            </tr>
                                    </table>
                                </asp:Panel>
                            </div>
                        </Foundation:InformationGroup>
                        <br />
                	</div>	
                </td>
            </tr>
        </table>
    </div>
</asp:Content>

