<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesPublishSubPages, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>
<%@ Register TagPrefix="Status" TagName="StatusArea" Src="~/LitiumStudio/CMS/WebUserControls/StatusArea.ascx" %>
<%@ Register TagPrefix="Status" TagName="StatusAreaInfo" Src="~/LitiumStudio/CMS/WebUserControls/StatusAreaInfo.ascx" %>
<asp:Content ID="Content2" ContentPlaceHolderID="LitiumStudioFilterArea" runat="server">
	<LS:FilterAreaSetting ID="FilterAreaSetting1" runat="server" FilterAreaState="Closed" />
	<Status:StatusAreaInfo runat="server" ID="c_statusArea2" />
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarCreate" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>
		<toolbar:ToolbarItem OnClick="ToolbarItemPublish_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconPublish" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemPublish" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Status:StatusArea runat="server" ID="c_statusArea" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
		<script type="text/javascript">
			//<![CDATA[
			function checkMultiple(currentCheckBox) {
				var checkBoxAll = document.getElementById('<%= c_checkBoxAll.ClientID%>');
				if (currentCheckBox.checked == false) checkBoxAll.checked = false;
				var checkboxObjects = document.getElementsByTagName("INPUT");
				var found = false;
				if (checkboxObjects) {
					for (var i = 0; i < checkboxObjects.length; i++) {
						obj = checkboxObjects[i];
						if (obj.type == "checkbox" && obj != checkBoxAll) {
							if (obj.checked) {
								found = true;
								break;
							}
						}
					}
					if (found) toolbarItemAction('activate', '1_2');
					else {
						toolbarItemAction('disable', '1_2');
						checkBoxAll.checked = false;
					}
				}
			}
			function checkAll() {
				var checkBoxAll = document.getElementById('<%= c_checkBoxAll.ClientID%>');
				var checkboxObjects = document.getElementsByTagName("INPUT");
				if (checkboxObjects) {
					for (var i = 0; i < checkboxObjects.length; i++) {
						obj = checkboxObjects[i];
						if (obj.type == "checkbox" && obj != checkBoxAll) obj.checked = checkBoxAll.checked;
					}
					if (checkBoxAll.checked) toolbarItemAction('activate', '1_2');
					else toolbarItemAction('disable', '1_2');
				}
			}
			//]]>
        </script>
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
			<tr>
			    <td valign="top">
			        <table cellpadding="0" cellspacing="0" border="0" style="width:100%;">
			            <tr>
				            <td class="litHeader3" style="width:100%;"><Foundation:ModuleString ID="ModuleString1" name="SelectPublishingPages" runat="server"/><br /><hr /></td>
			            </tr>
			            <tr>
			                <td valign="top" style="width:100%;padding-top:10px;">
			                    <div class="litListWithTreeAreaV2">
			                        <table cellpadding="0" cellspacing="0" border="0">
			                            <tr>
			                                <th align="left" class="lsListHeader" style="width:16px;"><asp:CheckBox runat="server" ID="c_checkBoxAll" OnClick="checkAll();" Checked="true" /></th>
			                                <th align="left" class="lsListHeader" style="padding-left:5px;"><img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconPSUnpubl" alt="" /><Foundation:ModuleString ID="ModuleString11" Name="UnpublishedPages" runat="server" /></th>
			                            </tr>
	                                   <asp:Repeater ID="c_repeaterSubPages" Runat="server">
							                <ItemTemplate>
			                                    <tr>
			                                        <td class="litListContent" style="width:16px;"><asp:CheckBox OnClick="checkMultiple(this);" ID="c_checkBox" Checked="true" Runat="server" /><asp:HiddenField runat="server" ID="c_hiddenFieldId" Value='<%# DataBinder.Eval(Container.DataItem, "ID")%>' /></td>
                                                    <td class="litListContent" style="padding-left:5px;"><asp:Label ID="c_labelPagePath" runat="server"></asp:Label></td>
			                                    </tr>
			                                 </ItemTemplate>
				                        </asp:Repeater>
			                        </table>
			                    </div>
			                </td>
			            </tr>
			        </table>
			    </td>
			</tr>
		</table>
    </div>
    <script type="text/javascript">
    	var submitObject = document.getElementById("<% Response.Write(c_toolbarItemPublish.ClientID.ToString()); %>");
    	var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
    	document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
    </script>
</asp:Content>