<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesMyWorkingCopies, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register assembly="Litum.Studio.Web"  TagPrefix="LS" Namespace="Litium.Studio.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarTasks" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemUpdate_Click" 
							 DisabledClass="litToolbarItem litToolbarItemDisabled" 
							 Class="litToolbarItem" 
							 LinkClass="litToolbarLink" 
							 ImageClass="litIconRefresh" 
							 SelectedClass="litToolbarItem litToolbarItemSelected" 
							 ImageURL="Images/transparent.gif" 
							 ID="c_toolbarItemUpdate" 
							 runat="server" />
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconWorkingCopy" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" ID="m_cmsHelper" AssociatedControlID="m_cms" OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_cms">
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
					<Telerik:GridBoundColumn DataField="Place" HeaderStyle-Width="50%" ItemStyle-Width="50%" />
					<Telerik:GridBoundColumn DataType="System.String" DataField="DateUpdated" HeaderStyle-Width="24%" ItemStyle-Width="24%" />
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="PagesEditText.aspx?CMS_STARTED=true&CMS_SP_ID={0}" DataNavigateUrlFields="ID" Text="&lt;img class='litIconPencil' src='Images/transparent.gif' &gt;" HeaderStyle-Width="3%" ItemStyle-Width="3%" />
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="PagesWorkingCopy.aspx?CMS_SP_ID={0}" DataNavigateUrlFields="ID" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" HeaderStyle-Width="3%" ItemStyle-Width="3%" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>
    
    <script type="text/javascript">
    //<![CDATA[
    // Image preloading
    var img1 = new Image();
    img1.src = '../../LitiumStudio/Images/grid/spinner.gif';
    //]]>    
    </script>
</asp:Content>