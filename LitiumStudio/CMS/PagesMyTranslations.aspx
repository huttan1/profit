<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesMyTranslations, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register assembly="Litum.Studio.Web"  TagPrefix="LS" Namespace="Litium.Studio.UI" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarTasks" runat="server">
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
	<img src="Images/transparent.gif" alt="" class="litIconPSTranslation" />
	<asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">

	<script type="text/javascript">
		function GotoPage(pageID, hasWebSiteSeePermission) {
			if (hasWebSiteSeePermission == '1') {
				document.location = 'Pages.aspx?CMS_SP_ID=' + pageID;
				return false;
			}
			else {
				alert('<Foundation:ModuleString name="WebSiteReadAccessDenied" runat="server"/>');
			}
		}
    </script>

    <div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" ID="m_cmsHelper" AssociatedControlID="m_cms" OnNeedData="grid_NeedData" DataKeyName="ID" />
		<Telerik:RadGrid runat="server" ID="m_cms">
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridBoundColumn DataField="ID" Visible="false" />
					<Telerik:GridBoundColumn DataField="OriginalFlagPath" Visible="false" />
                    <Telerik:GridBoundColumn DataField="TranslationFlagPath" Visible="false" />
                    <Telerik:GridImageColumn DataImageUrlFields="OriginalFlagPath" DataImageUrlFormatString="~\{0}" DataType="System.String" HeaderStyle-Width="13%" ItemStyle-Width="13%" />
                    <Telerik:GridImageColumn DataImageUrlFields="TranslationFlagPath" DataImageUrlFormatString="~\{0}" DataType="System.String" HeaderStyle-Width="13%" ItemStyle-Width="13%" />
                    <Telerik:GridBoundColumn DataField="Name" HeaderStyle-Width="21%" ItemStyle-Width="21%" />
                    <Telerik:GridBoundColumn DataField="Place" HeaderStyle-Width="50%" ItemStyle-Width="50%" />
                    <Telerik:GridHyperLinkColumn DataNavigateUrlFormatString='javascript:GotoPage("{0}", {1});' DataNavigateUrlFields="ID,Visible" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" HeaderStyle-Width="3%" ItemStyle-Width="3%" />
                    <Telerik:GridBoundColumn DataField="Visible" Visible="false" />
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