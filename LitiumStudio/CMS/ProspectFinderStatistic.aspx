<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_ProspectFinderStatistic, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <script type="text/javascript">
    	function openPF() {
    		openURLInNewWindow('https%3A%2F%2Fpf3.enecto.com',
				'<input type="hidden" name="j_username" value="' + unescape("<%=System.Web.HttpUtility.UrlEncode(m_currentModule.ProspectFinderManager.WebSites[m_selectedPage.WebSiteID].Username) %>") + '"/>' +
				'<input type="hidden" name="j_password" value="' + unescape("<%=System.Web.HttpUtility.UrlEncode(m_currentModule.ProspectFinderManager.WebSites[m_selectedPage.WebSiteID].Password) %>") + '"/>' +
				'');
    		return;
    	}
    </script>
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarStatistic" runat="server" >
		<toolbar:ToolbarItem URL="javascript:openPF();" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemProspectFinder" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" ID="m_cmsHelper" AssociatedControlID="m_cms" OnNeedData="grid_NeedData" DataKeyName="ID" AllowPaging="false" />
		<Telerik:RadGrid runat="server" ID="m_cms">
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridBoundColumn DataField="ID" Visible="false" AllowSorting="false" />
					<Telerik:GridImageColumn DataImageUrlFields="FlagImageName" SortExpression="Country" DataImageUrlFormatString="../../LitiumStudio/Images/icons_standard/flags/{0}.png" DataType="System.String" HeaderStyle-Width="10%" ItemStyle-Width="10%" />
					<Telerik:GridBoundColumn DataField="CompanyName" SortExpression="CompanyName" HeaderStyle-Width="20%" ItemStyle-Width="20%" />
					<Telerik:GridBoundColumn DataType="System.String" DataField="StartDate" SortExpression="StartDate" HeaderStyle-Width="15%" ItemStyle-Width="15%" />
					<Telerik:GridBoundColumn DataType="System.String" DataField="SpentTime"  AllowSorting="false" HeaderStyle-Width="15%" ItemStyle-Width="15%"/>
				    <Telerik:GridTemplateColumn DataField="Referer">
				        <ItemTemplate>
				            <input type="text" value='<%# Eval("Referer") %>' readonly="readonly"/>				        
				        </ItemTemplate>
				    </Telerik:GridTemplateColumn>
					<Telerik:GridBoundColumn DataField="SearchWord" HeaderStyle-Width="20%" ItemStyle-Width="20%" AllowSorting="false" />
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
