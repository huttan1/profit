<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesPublish, Litum.Studio.Web" %>
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
		<toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<Status:StatusArea runat="server" ID="c_statusArea" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
        <script type="text/javascript">
        	//<![CDATA[
        	function CheckedChanged(sender) {
        		var myControl;
        		var myControls = document.getElementsByTagName("input");
        		for (i = 0; i < myControls.length; i++) {
        			myControl = myControls[i];
        			if (myControl && myControl.type == "checkbox") {
        				if (!myControl.disabled)
        					myControl.checked = sender.checked;
        			}
        		}
        	}
        	//]]>
        </script>
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainSizeV2">
			<tr>
			    <td valign="top">
			        <table cellpadding="0" cellspacing="0" border="0">
	                    <tr style="padding-bottom:10px;">
					        <td valign="top">
						        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString3" name="PublishPageSubHeader" runat="Server" /></span><br />
						        <asp:Label CssClass="litText" ID="c_labelDescription" runat="server" /><br />
					        </td>
				        </tr>
				        <tr valign="top">
		                    <td valign="top">
			                    <div class="litListWithTreeAreaV2">
			                        <asp:Repeater ID="c_repeaterTranslationPages" Runat="server">
			                            <HeaderTemplate>
						                    <table border="0" cellspacing="0" cellpadding="0">
							                    <tr>
							                         <th align="left"><input type="checkbox" onclick="CheckedChanged(this);" /></th> 
							                         <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString11" Name="WebSite" runat="server" /></th>
		                                             <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString10" Name="Language" runat="server" /></th>
							                         <th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString1" Name="Location" runat="server" /></th>
		                                        </tr>
		                                 </HeaderTemplate>
				                         <ItemTemplate>
                                            <tr>
                                                <td class="litListContent"><asp:CheckBox id="checkBoxTranslate" runat="server" /></td>
                                                <td class="litListContent"><asp:Label id="labelWebSiteName" runat="server" /></td>
                                                <td class="litListContent"><img id="imgWebSiteFlag" style="vertical-align:middle;" runat="server"/>&nbsp;<asp:Label id="labelWebSiteLanguage" runat="server"/></td>
                                                <td class="litListContent"><asp:Label ID="labelLocation" runat="server" /></td>
                                            </tr>
                                        </ItemTemplate>
			                            <FooterTemplate>		
						                    </table>
					                    </FooterTemplate>	
					                </asp:Repeater>
			                    </div>
		                    </td>
	                    </tr>
                    </table>
			    </td>
			</tr>
		</table>
    </div>
    <script type="text/javascript">
    	var submitObject = document.getElementById("<% Response.Write(c_toolbarItemSave.ClientID.ToString()); %>");
    	var cancelObject = document.getElementById("<% Response.Write(c_toolbarItemCancel.ClientID.ToString()); %>");
    	document.onkeypress = function(e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
    </script>
</asp:Content>