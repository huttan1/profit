<%@ page validaterequest="false" language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_Start, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>
<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    
	<ComponentArt:ToolBar ID="c_toolbarRight"
        OnItemCommand="c_toolbarRight_ItemCommand"
		runat="server"
		CssClass="litToolbar"
		DefaultItemCssClass="litToolbarItemNew"
		DefaultItemHoverCssClass="litToolbarItemOnMouseOver"
		DefaultItemActiveCssClass="litToolbarItemOnMouseDown"
		DefaultItemDisabledCssClass="litToolbarItemDisabled"
		ImagesBaseUrl="~/LitiumStudio/Images/"
		DefaultItemExpandedCssClass="litToolbarItemOnMouseDown"
		ItemSpacing="0" UseFadeEffect="false" Orientation="Horizontal" DefaultItemImageWidth="16"
		DefaultItemImageHeight="16">
		<Items runat="server">
		    <ComponentArt:ToolBarItem ID="c_toolbarItemRemoveFromCategorySeperator" runat="server" ItemType="Separator" CssClass="" ImageUrl="toolbar/break.gif"
				ImageHeight="16" ImageWidth="2" />
            <ComponentArt:ToolBarItem runat="server" ID="c_toolbarItemRemoveFromCategory" ImageUrl="icons_standard/branch_delete.png"
				AutoPostBackOnSelect="true" Style="padding: 1px 3px;" ClientTemplateId="c_toolbarLeftTreeItemButtonTemplate"/>
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

<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Image runat="server" ImageUrl="Images/transparent.gif" AlternateText="" ID="c_imageHeaderIcon" />
	<asp:Label runat="server" ID="mc_labelParentName" />
</asp:Content>

<asp:Content ID="Content3" runat="server" ContentPlaceHolderID="LitiumStudioFilterArea">
	<LS:FilterAreaSetting runat="server" ID="c_filterState" FilterAreaState="Closed" />
	<Foundation:ModuleString ID="ModuleString1" runat="server" Name="GridPageSize" /> <asp:DropDownList ID="c_pageSize" runat="server" onchange="DropDownChanged()" style="margin-right: 15px;min-width: 80px;" /> 
	<Foundation:ModuleString ID="ModuleString2" runat="server" Name="GridIconSize" /> <asp:DropDownList ID="c_iconSize" runat="server" onchange="DropDownChanged()" style="margin-right: 15px;min-width: 80px;" /> 
</asp:Content>


<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
    <input type="hidden" id="MediaArchive_FileID" name="MediaArchive_FileID" />
    <Telerik:RadScriptBlock ID="RadScriptBlock1" runat="server">
        <script type="text/javascript">
        	//<![CDATA[

    		var cancelDeselect = false;
    		var cancelSelect = false;
    		var selectedFileCount = 0;
        
            function DropDownChanged() {
            $find("<%=c_fileGrid.ClientID %>").get_masterTableView().rebind();
        }

        var selectedItemCount = 0;

        function selectGridItem(sender, eventArgs, gridHelper) {
            selectedItemCount = gridHelper.GetSelectedKeys().length;
            c_toolbarMACommon.beginUpdate();
            c_toolbarRight.beginUpdate();
            if (selectedItemCount == 1) {
                setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
                setCommonToolbarButtonEnabled('c_toolbarItemView', true);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCopy').set_enabled(true);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCut').set_enabled(true);
            }
            else {
                setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
                setCommonToolbarButtonEnabled('c_toolbarItemView', false);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCopy').set_enabled(false);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCut').set_enabled(false);
            }
            c_toolbarRight.get_items().getItemById('c_toolbarItemRemoveFromCategory').set_enabled(true);
            setCommonToolbarButtonEnabled('c_toolbarItemDelete', true);
            c_toolbarRight.endUpdate();
            c_toolbarMACommon.endUpdate();

            $get('MediaArchive_FileID').value += eventArgs._dataKeyValues.ID + ';';

            RowSelecting(sender, eventArgs, gridHelper);
        }
        function RowSelecting(sender, args, gridHelper) {
        	if (args._domEvent.type != null) {
        		PageMethods.UpdateSelectedFiles(args._dataKeyValues.ID, 'true', callMethod_Success, callMethod_Failure);
        	}
        	else {
        		if (cancelSelect)
        			args.set_cancel(true);
        	}
        }

        function unselectGridItem(sender, eventArgs, gridHelper) {
            selectedItemCount = gridHelper.GetSelectedKeys().length;
            c_toolbarMACommon.beginUpdate();
            c_toolbarRight.beginUpdate();
            if (selectedItemCount == 1) {
                setCommonToolbarButtonEnabled('c_toolbarItemEdit', true);
                setCommonToolbarButtonEnabled('c_toolbarItemView', true);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCopy').set_enabled(true);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCut').set_enabled(true);
            }
            else if (selectedItemCount > 0) {
                setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
                setCommonToolbarButtonEnabled('c_toolbarItemView', false);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCopy').set_enabled(false);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCut').set_enabled(false);
            }
            else {
                setCommonToolbarButtonEnabled('c_toolbarItemView', false);
                setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
                setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCopy').set_enabled(false);
                c_toolbarMACommon.get_items().getItemById('c_toolbarItemCut').set_enabled(false);
                c_toolbarRight.get_items().getItemById('c_toolbarItemRemoveFromCategory').set_enabled(false);
            }
            c_toolbarRight.endUpdate();
            c_toolbarMACommon.endUpdate();

            $get('MediaArchive_FileID').value = $get('MediaArchive_FileID').value.replace(eventArgs._dataKeyValues.ID + ';', '');

            RowDeselecting(sender, eventArgs, gridHelper)
        }
        function RowDeselecting(sender, args, gridHelper) {
        	if (args._domEvent.type != null) {
        		var items = gridHelper.GetSelectedKeys();
        		if (items.length == 0) {
        			PageMethods.ClearSelectedFiles(callMethod_Success, callMethod_Failure);
        		}
        		else {
        			PageMethods.UpdateSelectedFiles(args._dataKeyValues.ID, 'false', callMethod_Success, callMethod_Failure);
        		}
        	}
        	else {
        		if (cancelDeselect) {
        			args.set_cancel(true);
        		}
        	}
        }

        c_toolbarMACommon.beginUpdate();
        c_toolbarRight.beginUpdate();
        if (selectedItemCount != 1) {
            setCommonToolbarButtonEnabled('c_toolbarItemEdit', false);
            setCommonToolbarButtonEnabled('c_toolbarItemView', false);
            c_toolbarMACommon.get_items().getItemById('c_toolbarItemCopy').set_enabled(false);
            c_toolbarMACommon.get_items().getItemById('c_toolbarItemCut').set_enabled(false);
        }
        if (selectedItemCount == 0) {
            setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
            c_toolbarRight.get_items().getItemById('c_toolbarItemRemoveFromCategory').set_enabled(false);
        }
        c_toolbarRight.endUpdate();
        c_toolbarMACommon.endUpdate();



        function HeaderShowing(sender, args) {
        	$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedFileCount == $find("<%= c_fileGrid.ClientID %>").get_masterTableView()._virtualItemCount;
        }

        function SelectAllClick(sender) {
        	if (sender.checked) {
        		SelectAllFiles();
        	}
        	else {
        		ClearSelectedFiles();
        	}
        }

        function SelectAllFiles() {
        	var tableView = $find("<%= c_fileGrid.ClientID %>").get_masterTableView();
        	tableView.clearSelectedItems();
        	cancelDeselect = true;
        	tableView.selectAllItems();
        	PageMethods.SelectAllFiles(callMethod_Success, callMethod_Failure);
        	cancelDeselect = false;
        }

        function ClearSelectedFiles() {
        	var tableView = $find("<%= c_fileGrid.ClientID %>").get_masterTableView();
        	cancelSelect = true;
        	tableView.clearSelectedItems();
        	if (tableView.get_selectedItems().length > 0)
        		tableView.selectAllItems();
        	cancelSelect = false;
        	PageMethods.ClearSelectedFiles(callMethod_Success, callMethod_Failure);
        }

        function RowDeselected(sender, args, gridHelper) {
        	if ($get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked)
        		$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = false;
        }

        function callMethod_Success(results, userContext, methodName) {
        	selectedFileCount = parseInt(results);
        	$get($get('<%= c_hiddenSelectAllClientID.ClientID %>').value).checked = selectedFileCount == $find("<%= c_fileGrid.ClientID %>").get_masterTableView()._virtualItemCount && selectedFileCount != 0;
        	if (selectedFileCount == 0) {
	            setCommonToolbarButtonEnabled('c_toolbarItemDelete', false);
	            c_toolbarRight.get_items().getItemById('c_toolbarItemRemoveFromCategory').set_enabled(false);
	            $find("<%=c_fileGridHelper.ClientID %>_ClientState").ClearSelectedKeys();
			}
        }
        function callMethod_Failure(errors, userContext, methodName) {
        	alert(errors.get_message());
        }
   
        //]]>
	    </script>
	</Telerik:RadScriptBlock>
	<div class="lsContentNoScroll">
		<LS:GridHelperAjax runat="server" AssociatedControlID="c_fileGrid" ID="c_fileGridHelper"
			OnNeedData="grid_NeedData" DataKeyName="ID" PageSize="10" />
		<Telerik:RadGrid 
			OnRowDrop="FileGrid_RowDrop"   
			AllowPaging="true" 
			AllowMultiRowSelection="true" 
			runat="server"
			ID="c_fileGrid"
			OnItemCreated="fileGrid_ItemCreated"
		>
			<ClientSettings  AllowRowsDragDrop="true">	
				<Selecting AllowRowSelect="true" />
				<ClientEvents OnRowDropping="onRowDropping" OnRowSelecting="selectGridItem" OnRowDeselecting="unselectGridItem" OnRowCreating="HeaderShowing" OnRowDeselected="RowDeselected" />
			</ClientSettings>
			<MasterTableView runat="server" ClientDataKeyNames="ID">
				<Columns>
					<Telerik:GridClientSelectColumn UniqueName="ClientSelectColumn" HeaderStyle-Width="25" />
					<Telerik:GridBoundColumn DataField="ImageTag" ItemStyle-HorizontalAlign="Center" ItemStyle-VerticalAlign="Middle" />
					<Telerik:GridBoundColumn DataField="Name" />
					<Telerik:GridBoundColumn DataField="FileName" />
					<Telerik:GridBoundColumn DataField="Dimensions" HeaderStyle-Width="120px" ItemStyle-Width="120px"/>
					<Telerik:GridBoundColumn DataField="FileLength" HeaderStyle-Width="75px" ItemStyle-Width="75px" />
					<Telerik:GridBoundColumn AllowSorting="false" DataField="HasVersions" HeaderStyle-Width="60px" ItemStyle-Width="60px" />
					<Telerik:GridBoundColumn DataField="User" />
					<Telerik:GridBoundColumn DataField="Date" HeaderStyle-Width="125px" ItemStyle-Width="125px" />
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="~/MediaBinaryLoader.axd?MediaArchive_FileID={0}&MediaArchive_ForceDownload=true"
						DataNavigateUrlFields="ID" Text="&lt;img class='litIconDownload' src='Images/transparent.gif' &gt;"
						HeaderStyle-Width="25px" ItemStyle-Width="25px" />
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="EditImage.aspx?MediaArchive_FolderID={0}&MediaArchive_FileID={1}"
						DataNavigateUrlFields="FolderID,ID" Text="&lt;img class='litIconPencil' src='Images/transparent.gif' &gt;"
						HeaderStyle-Width="25px" ItemStyle-Width="25px" />
					<Telerik:GridHyperLinkColumn DataNavigateUrlFormatString="ShowImage.aspx?MediaArchive_FolderID={0}&MediaArchive_FileID={1}"
						DataNavigateUrlFields="FolderID,ID" Text="&lt;img class='litIconNavRightBlue' src='Images/transparent.gif' &gt;"
						HeaderStyle-Width="25px" ItemStyle-Width="25px" />
					<Telerik:GridBoundColumn DataField="ID" Visible="false" />
				</Columns>
			</MasterTableView>
		</Telerik:RadGrid>
	</div>	
	
    	<asp:HiddenField ID="c_hiddenSelectAllClientID" value="" runat="server" />

</asp:Content>