<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_Circular_SearchResult, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
	<asp:Label runat="server" ID="c_labelHeader"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">

	<Telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
		<script language="javascript" type="text/javascript">
			function RowSelected(sender, args, gridHelper) {
				setCommonToolbarButtonEnabled('c_toolbarItemView', true);
				setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
				if (args.getDataKeyValue("CanEdit") == "True") {
					setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
				}
			}
			function RowDeselected(sender, args, gridHelper) {
				setCommonToolbarButtonEnabled('c_toolbarItemView', false);
				setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
				setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
			}
		</script>
	</Telerik:RadCodeBlock>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="m_circular" ID="m_circularHelper"
			OnNeedData="GetData" DataKeyName="ID;CanEdit" />
		<Telerik:RadGrid runat="server" ID="m_circular" OnItemCreated="GridItemCreated" OnPageIndexChanged="GridPageIndexChanged" OnSortCommand="GridSort">
			<ClientSettings>
				<ClientEvents OnRowSelecting="RowSelected" OnRowDeselecting="RowDeselected" />
				<Selecting allowrowselect="True" />
			</ClientSettings>
			<MasterTableView runat="server">
				<Columns>
					<Telerik:GridBoundColumn UniqueName="ID" DataField="Id" Visible="false" />
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="30" />
					<Telerik:GridImageColumn DataImageUrlFields="IconImageUrl" DataImageUrlFormatString="{0}" HeaderStyle-Width="30px" ItemStyle-Width="30px" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="TypeName" />
					<Telerik:GridBoundColumn DataField="RecipientCountString" HeaderStyle-Width="140px" />
					<Telerik:GridBoundColumn DataField="StatusName" HeaderStyle-Width="120px" />
					<Telerik:GridBoundColumn DataField="LastRegistrationDateString" HeaderStyle-Width="120px" />
					<Telerik:GridTemplateColumn DataField="Referer" HeaderStyle-Width="50px" ItemStyle-Width="50px">
					    <ItemTemplate>  
                              <asp:HyperLink runat="server" ID="EditButton" NavigateUrl='<%# Eval("EditUrl") %>' runat="server">
                                   <img ID="EditImage" class='litIconPencil' src='Images/transparent.gif' />
                              </asp:HyperLink>  
                         </ItemTemplate>
                     </Telerik:GridTemplateColumn>					
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="{0}" DataNavigateUrlFields="ViewUrl" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;" HeaderStyle-Width="50px" ItemStyle-Width="50px"/>
					<Telerik:GridBoundColumn UniqueName="EditUrl" DataField="EditUrl" Visible="false" />
					<Telerik:GridBoundColumn UniqueName="ViewUrl" DataField="ViewUrl" Visible="false" />

				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>

</asp:Content>

