<%@ page language="C#" masterpagefile="~/LitiumStudio/ECommerce/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_Reports, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/ECommerce/Framework/Base1.master" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    
      <ComponentArt:ToolBar ID="c_toolbarReport" AutoPostBackOnSelect="true" runat="server"
        CssClass="litToolbar" DefaultItemCssClass="litToolbarItemNew" DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
        DefaultItemActiveCssClass="litToolbarItemOnMouseDown" DefaultItemDisabledCssClass="litToolbarItemDisabled"
        ImagesBaseUrl="~/LitiumStudio/Images/" ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal"
        DefaultItemImageWidth="16" DefaultItemImageHeight="16">
        <Items>
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarDummyButton" Visible="false" Enabled="false"  ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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
		    <ComponentArt:ClientTemplate ID="c_toolbarLeftTreeItemButtonDropDownTemplate">
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
		                    <td rowspan="1" class="ca_tb_ddn ToolbarItemMain">
		                        <img height="16" width="16" border="0" src="../Images/## DataItem.get_dropDownImageUrl() ##" alt="" style="display: block;" title="## DataItem.get_toolTip() ##"/>
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
<asp:Content runat="server" ContentPlaceHolderID="LitiumStudioContentHeading">
    <asp:Panel runat="server" ID="c_headerPanel" Visible="false">
            <img src="Images/transparent.gif" style="vertical-align: middle; margin-right: 5px;"
                class="litIconLineChart" alt="" />
            <span style="font-weight:bold;"><asp:Label ID="c_heading" runat="server" /></span>
    </asp:Panel>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" runat="Server">
    <asp:PlaceHolder ID="c_placeHolderReport" runat="server" />
</asp:Content>
