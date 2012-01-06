<%@ Page Language="C#" CodeFile="ObjectPostReportedAdmin.aspx.cs" MasterPageFile="~/Extensions/Pages/Common/ObjectPostBase1.master" Inherits="Extensions.Pages.ObjectPostReportedAdmin" %>
<%@ Import Namespace="Litium.Foundation"%>
<%@ Import Namespace="Litium.Plus.Utilities"%>
<%@ Register TagPrefix="ex" Namespace="Litium.Plus.CMS.WebControls" Assembly="Litium.Plus" %>
<%@ Register TagPrefix="ext" Namespace="Litium.Extensions.WebControls" Assembly="Litium.Extensions" %>

<asp:Content ContentPlaceHolderID="ToolbarRight" runat="server">
	<Toolbar:DividerItem ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	<div class="extensions litToolbarItem">
		<asp:Label AssociatedControlID="m_dropDownListWebsites" runat="server">
			<Foundation:SystemString Name="extensions_op_settings_website" runat="server"/>
		</asp:Label>
		<asp:DropDownList ID="m_dropDownListWebSites" AutoPostBack="true" OnSelectedIndexChanged="DropDownListWebSites_OnSelectedIndexChanged" runat="server" />
	</div>
	<Toolbar:DividerItem ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	<div class="extensions litToolbarItem">
		<asp:Label AssociatedControlID="m_dropDownListObjectPostTypes" runat="server">
			<Foundation:SystemString Name="Extensions_OP_Settings_Object_Post_Type" runat="server" />
		</asp:Label>
		<asp:DropDownList AutoPostBack="true" ID="m_dropDownListObjectPostTypes" OnSelectedIndexChanged="DropDownListObjectType_OnSelectedIndexChanged" runat="server" />
	</div>
	<Toolbar:DividerItem ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	<Toolbar:HorizontalToolbar id="c_toolbar" ToolbarIndex="1" runat="server" >
		<Toolbar:ToolbarItem OnClick="ToolbarItemApprove_Click" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconOk" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="m_toolbarItemApprove" runat="server"/>
		<Toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="m_toolbarItemEdit" runat="server"/>
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" Enabled="false" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="m_toolbarItemDelete" runat="server"/>
	</Toolbar:HorizontalToolbar>    
</asp:Content>

<asp:Content ContentPlaceHolderID="LitiumStudioContentHeading" runat="server">
	<img src="<%= ResolveUrl("~/Extensions/Common/Images/object_post.png") %>" alt="" /><Foundation:SystemString Name="Extensions_OP_Settings_Header" runat="server" />:
	<Foundation:SystemString Name="extensions_op_settings_subheader_list" runat="server"/>
</asp:Content>

<asp:Content ContentPlaceHolderID="MainContent" Runat="Server">
    <script type="text/javascript" src="<% = ResolveUrl("~/Extensions/Common/Scripts/jquery-1.3.2.min.js") %>"></script>
	<style type="text/css">
		.checkBoxColumn{ width:10px; }
	</style>
    <div class="litModuleContentTabAreaV2 SectionContainer">
        <div class="litModuleContentTopAreaV2">
            <div class="litRightArea">
			    <asp:linkbutton id="c_pageSelectorAll1" Enabled="<%# ShowAll %>" cssClass="litContentPager" runat="server"  CommandName="ShowAll" OnCommand="List_Command"><asp:Label id="c_labelShowAll" runat="server"/></asp:linkbutton>
			    <asp:linkbutton id="c_pageSelectorAll2" Enabled="<%# ShowAll %>" cssClass="litContentPager" runat="server"  CommandName="ShowAll" OnCommand="List_Command"><asp:Image ImageUrl="images/transparent.gif" CssClass="litIconUpDown" Runat="server" ID="c_AllButton" ImageAlign="AbsMiddle" /></asp:linkbutton>
			    <span class="litDivider"><img src="images/transparent.gif" style="vertical-align:middle;" height="12" width="1" alt="" /></span>
			    <asp:linkbutton id="c_pageSelectorPrev1" Enabled="<%# c_list.CheckPagerBoundaries(-1)%>" cssClass="litContentPager" runat="server" CommandArgument="-1" CommandName="GoTo"	OnCommand="List_Command"><asp:Image ImageUrl="images/transparent.gif" CssClass="litIconArrowLeft" Runat="server" ID="c_PreviousButton1" ImageAlign="AbsMiddle" /></asp:linkbutton><asp:linkbutton id="c_pageSelectorPrev2" Enabled="<%# c_list.CheckPagerBoundaries(-1)%>" cssClass="litContentPager" runat="server" CommandArgument="-1" CommandName="GoTo"	OnCommand="List_Command"><Foundation:SystemString Name="Previous" runat="server" ID="Systemstring2"/></asp:linkbutton>
			    &nbsp;<span class="litDivider"><img src="images/transparent.gif" style="vertical-align:middle;" height="12" width="1" alt="" /></span>&nbsp;
			    <asp:linkbutton id="c_pageSelectorNext1" Enabled="<%# c_list.CheckPagerBoundaries(1)%>" cssClass="litContentPager" runat="server" CommandArgument="1" CommandName="GoTo" OnCommand="List_Command"><Foundation:SystemString Name="Next" runat="server" ID="Systemstring3"/></asp:linkbutton>
			    <asp:linkbutton id="c_pageSelectorNext2" Enabled="<%# c_list.CheckPagerBoundaries(1)%>" cssClass="litContentPager" runat="server" CommandArgument="1" CommandName="GoTo" OnCommand="List_Command"><asp:Image ImageUrl="images/transparent.gif" CssClass="litIconArrowRight" Runat="server" ID="c_NextButton1" ImageAlign="AbsMiddle" /></asp:linkbutton>
		    </div>
		    <div class="clear"></div>
        </div>
        <div class="litModuleContentMainTab2AreaV2 litListAreaV2">
            <ext:List id="c_list" SortAscendingClass="litIconSortAscending" SortDescendingClass="litIconSortDescending" PageSize="20" EnableViewState="True" Runat="server">
			    <HeaderTemplate>
				    <table border="0" cellspacing="0" cellpadding="0">
					    <tr>
						    <th class="litListHeader">&nbsp;</th>
						    <th class="litListHeader date"><ext:ListColumn id="c_listColumn1" runat="server" OnCommand="List_Command" CommandName="OrderBy" CommandArgument="c1" /><asp:Image id="c_imageDescListColumn1" ImageUrl="images/transparent.gif"  BorderWidth="0" ImageAlign="absmiddle" CssClass="litIconSortAscending" runat="server"/></th>
						    <th class="litListHeader"><ext:ListColumn id="c_listColumn2" runat="server" OnCommand="List_Command" CommandName="OrderBy" CommandArgument="c2" /><asp:Image id="c_imageDescListColumn2" ImageUrl="images/transparent.gif"  BorderWidth="0" ImageAlign="absmiddle" CssClass="litIconSortAscending" runat="server"/></th>
						    <th class="litListHeader"><ext:ListColumn id="c_listColumn3" runat="server" OnCommand="List_Command" CommandName="OrderBy" CommandArgument="c3" /><asp:Image id="c_imageDescListColumn3" ImageUrl="images/transparent.gif"  BorderWidth="0" ImageAlign="absmiddle" CssClass="litIconSortAscending" runat="server"/></th>						    
						    <th class="litListHeader"><ext:ListColumn id="c_listColumn4" runat="server" OnCommand="List_Command" CommandName="OrderBy" CommandArgument="c4" /><asp:Image id="c_imageDescListColumn4" ImageUrl="images/transparent.gif"  BorderWidth="0" ImageAlign="absmiddle" CssClass="litIconSortAscending" runat="server"/></th>
						    <th class="litListHeader"><ext:ListColumn id="c_listColumn5" runat="server" OnCommand="List_Command" CommandName="OrderBy" CommandArgument="c5" /><asp:Image id="c_imageDescListColumn5" ImageUrl="images/transparent.gif"  BorderWidth="0" ImageAlign="absmiddle" CssClass="litIconSortAscending" runat="server"/></th>						    
					    </tr>
			    </HeaderTemplate>
			    <ItemTemplate>
				    <ext:ListRow ID="ListRow1" ColumnCssClass="litListContent" CheckBoxColumnCssClass="litListContent checkBoxColumn" runat="server"/>
			    </ItemTemplate>
			    <FooterTemplate>
				    </table>
			    </FooterTemplate>
		    </ext:List>
		    <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
			    <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring9"/></b></legend><img src="images/transparent.gif" width="5" alt="" /><br />
				    <asp:Label id="c_labelMajorError" runat="server"/>
			    </fieldset>
		    </asp:Panel>
        </div>
        <div class="litModuleContentBottomAreaV2">
		    <div class="litLeftArea litContentInfo"><Foundation:SystemString Name="NowShowingPage" runat="server" ID="Systemstring5"/> <%# c_list.PageSelected %> <Foundation:SystemString Name="of" runat="server" ID="Systemstring6"/> <%# c_list.PageCount %> (<Foundation:SystemString Name="extensions_op_object_post" runat="server" ID="Systemstring7"/> <%# StartIndex %>-<%# c_list.EndIndex %> <Foundation:SystemString Name="of" runat="server" ID="Systemstring8"/> <%# c_list.PageItemCount %>)</div>
		    <div class="litRightArea">
			    <asp:linkbutton id="c_pageSelectorPrev3" Enabled="<%# c_list.CheckPagerBoundaries(-1)%>" cssClass="litContentPager" runat="server" CommandArgument="-1" CommandName="GoTo" OnCommand="List_Command"><asp:Image ImageUrl="images/transparent.gif" CssClass="litIconArrowLeft" Runat="server" ID="c_PreviousButton2" ImageAlign="AbsMiddle" /></asp:linkbutton><asp:linkbutton id="c_pageSelectorPrev4" Enabled="<%# c_list.CheckPagerBoundaries(-1)%>"  cssClass="litContentPager" runat="server" CommandArgument="-1" CommandName="GoTo" OnCommand="List_Command"><Foundation:SystemString Name="Previous" runat="server" ID="Systemstring4"/></asp:linkbutton>
			    &nbsp;<span class="litDivider"><img src="images/transparent.gif" style="vertical-align:middle;" height="12" width="1" alt="" /></span>&nbsp;
			    <asp:linkbutton id="c_pageSelectorNext3" Enabled="<%# c_list.CheckPagerBoundaries(1)%>" cssClass="litContentPager" runat="server" CommandArgument="1" CommandName="GoTo" OnCommand="List_Command"><Foundation:SystemString Name="Next" runat="server" ID="Systemstring11"/></asp:linkbutton>
			    <asp:linkbutton id="c_pageSelectorNext4" Enabled="<%# c_list.CheckPagerBoundaries(1)%>" cssClass="litContentPager" runat="server" CommandArgument="1" CommandName="GoTo" OnCommand="List_Command"><asp:Image ImageUrl="images/transparent.gif" CssClass="litIconArrowRight" Runat="server" ID="c_NextButton2" ImageAlign="AbsMiddle" /></asp:linkbutton>
		    </div>
	    </div>
    </div>
</asp:Content>
