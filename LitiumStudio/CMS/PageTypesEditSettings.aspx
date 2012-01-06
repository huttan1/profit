<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PageTypesEditSettings, Litum.Studio.Web" %>

<%@ Register TagPrefix="treeview" Namespace="Litium.Foundation.Modules.MediaArchive.WebControls.AdminTreeView"  Assembly="Litium.Studio.WebControls"%>	
<%@ Register TagPrefix="WebControls" Namespace="Litium.Studio.UI.CMS.Pages.WebControls" Assembly="Litium.Studio.UI"%>
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem" Class="litToolbarItem" 
            LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected"
            ImageURL="images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconPageType" />
	<Foundation:ModuleString Name="PageTypeEditSettings" runat="server" ID="Systemstring2"/> "<asp:Label ID="c_labelPageTypeItemName" Runat="server"/>"
</asp:Content>

<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll" id="PageTypeContent">
	        <!-- Add new property -->
	        <div style="float:left;">
	            <span class="litBoldText"><Foundation:ModuleString Name="Name" runat="server" ID="ModuleString9"/>:</span><br />
	            <asp:TextBox CssClass="litInputText200" ID="c_newPropertyName" runat="server"></asp:TextBox>
	        </div>
	        <div style="float:left;">
	            <asp:Panel id="c_panelNameErrorMessage" style="padding-left:10px; padding-top:17px;" visible="False" runat="server"> 
                    <div class="litErrorMsg" id="c_validateNewPropertyName" runat="server"></div>
                </asp:Panel>
            </div>
            <div style="float:left; padding-left:10px;">
                <span class="litBoldText"><Foundation:ModuleString Name="Type" runat="server" ID="ModuleString10"/>:</span><br />
                <asp:DropDownList CssClass="litText" id="c_dropAddContentField" runat="server" Width="130px"></asp:DropDownList>
            </div>
	        <asp:Button ID="c_addContentField" runat="server" CssClass="litInputButton" style="float:left; width:auto; margin-top:13px; margin-left:10px;" CommandName="AddContentField" />
	        <div style="clear:both; height:20px;"></div>
            <!-- Properties -->
            <table cellpadding="0" border="0" cellspacing="0" style="width:950px;">
                <!-- Property headers -->
                <tr>
                    <th style="width:140px;" class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString2" name="Name" runat="server" /></th>
                    <asp:Repeater runat="server" ID="c_languageNames">
                        <ItemTemplate>
                            <th style="width:140px;" class="lsListHeader" align="left">
                                <asp:Label ID="c_labelLanguageName" runat="server"></asp:Label>
                            </th>
                        </ItemTemplate>
                    </asp:Repeater>
                    <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString3" name="Type" runat="server" /></th>
                    <th style="width:85px;" class="lsListHeader" align="center"><Foundation:ModuleString ID="ModuleString4" name="MandatoryInfo" runat="server" /></th>
                    <th style="width:50px;" class="lsListHeader" align="center"><Foundation:ModuleString ID="ModuleString5" name="Array" runat="server" /></th>
                    <th style="width:110px; white-space:nowrap;" class="lsListHeader" align="center"><Foundation:ModuleString ID="ModuleString6" name="ShowInGuide" runat="server" /></th>
                    <th colspan="3" class="lsListHeader">&nbsp;</th>
                </tr>
                <!-- Property values -->
                <asp:Repeater id="c_repeaterProperties" runat="server">
                    <ItemTemplate>
                        <tr>
                            <td style="width:140px;"> 
                                <asp:TextBox EnableViewState="false" CssClass="litInputText" style="width:130px;" ID="c_propertyName" Text='<%# DataBinder.Eval(Container.DataItem,"PropertyName") %>' runat="server"></asp:TextBox>
                                <asp:Label ID="c_labelID" runat="server" Visible="false" Text='<%# DataBinder.Eval(Container.DataItem,"PropertyID") %>'></asp:Label>
                            </td>
                            <asp:Repeater runat="server" ID="c_pageTypeStrings" DataSource='<%# DataBinder.Eval(Container.DataItem, "[\"PropertyLanguageString\"]")%>'>
                                <ItemTemplate>
                                    <td style="width:140px;">
                                        <asp:TextBox CssClass="litInputText" style="width:130px;" ID="c_pageTypeString" runat="server"></asp:TextBox>
                                        <asp:Label ID="c_labelPageTypeStringKey" runat="server" Visible="false"></asp:Label>
                                        <asp:Label ID="c_labelPageTypeStringLanguageID" runat="server" Visible="false"></asp:Label>
                                    </td>
                                </ItemTemplate>
                            </asp:Repeater>
                            <td><asp:DropDownList CssClass="litInputSelect" style="width:130px;" runat="server" ID="c_propertyType"></asp:DropDownList></td>
                            <td style="width:85px;" align="center"><asp:CheckBox runat="server" id="c_isMandatory" /></td>
                            <td style="width:50px;" align="center"><asp:CheckBox runat="server" id="c_isArray" /></td>
                            <td style="width:110px;" align="center"><asp:CheckBox runat="server" id="c_showInGuide" /></td>
                            <td style="width:16px;"><asp:ImageButton id="c_imageButtonUp" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconArrowUpBlue" runat="server" CommandName="MoveUp" CommandArgument="MoveUp" style="padding: 0px;"/></td>
                            <td style="width:16px;"><asp:ImageButton id="c_imageButtonDown" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconArrowDownBlue" runat="server" CommandName="MoveDown" CommandArgument="MoveDown" style="padding: 0px;"/></td>
                            <td style="width:16px;"><asp:ImageButton id="c_imageButtonDelete" ImageUrl="~/LitiumStudio/CMS/Images/transparent.gif" ImageAlign="AbsMiddle" BorderWidth="0" cssclass="litIconDelete" runat="server" CommandName="DeleteRow" style="margin:0px;" CommandArgument="DeleteRow"/></td>
                        </tr>
                    </ItemTemplate>
		        </asp:Repeater> 
		    </table>
    </div>    
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(c_addContentField.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>
