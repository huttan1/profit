<%@ page validaterequest="false" language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_SearchFilePointerResult, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarTasks" runat="server" >
		<Toolbar:ToolbarItem OnClick="ToolbarItemDelete_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
		    Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDelete2"
		    SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemDelete" runat="server"/>
		<Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server"
		    ID="Divideritem2"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
		    Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
		    SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server"> 
        <asp:Label Runat="server" ID="mc_labelName"></asp:Label>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_searcFilePointer" ID="m_searcFilePointerHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_searcFilePointer">
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridImageColumn DataImageUrlFields="IconUrl" DataImageUrlFormatString="{0}" HeaderStyle-Width="30" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridHyperLinkColumn DataTextField="Place" DataNavigateUrlFormatString="{0}"
				        DataNavigateUrlFields="UrlToItem"/>
					<Telerik:GridBoundColumn DataField="FileType"/>
					<Telerik:GridBoundColumn DataField="FileLocation"/>
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
</asp:Content>