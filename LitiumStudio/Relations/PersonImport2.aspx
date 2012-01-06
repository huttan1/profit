<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_PersonImport2, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>


<%@ Reference Page="~/LitiumStudio/Relations/PersonImport.aspx" %>
<%@ Import Namespace="System.Web.UI.WebControls" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemBack" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" alt="" class="litIconRelationsPerson" /><Foundation:ModuleString ID="ModuleString2" Name="PersonsImport" runat="server" /><span class="litTextNormalWeight">&nbsp;(<Foundation:ModuleString ID="ModuleString3" Name="PersonsImportPage2SubHeader" runat="server"/>)</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <asp:Panel id="c_panelError" runat="server" visible="false"> 
            <span class="litErrorMsg"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><asp:Label id="c_labelError" runat="server"/></span>
        </asp:Panel>
        <!-- Import result -->
        <div id="ImportResult" style="width: 98%;">
            <asp:Panel id="c_panelResult" runat="server" visible="false"> 
                <span class="litBoldText"><asp:label runat="server" id="c_ImportResultHeader"><Foundation:ModuleString ID="ModuleString1" Name="PersonsImportResult" runat="server" /></asp:label></span>
            </asp:Panel>
            <div class="litText"><asp:label runat="server" id="c_ImportResultLabel"></asp:label></div>
            <br />
            <asp:Panel id="c_panelFollowing" runat="server" visible="false"> 
                <span class="litBoldText"><asp:Label runat="server" ID="c_FollowingErrors"></asp:Label></span>
            </asp:Panel>
            <asp:Panel id="c_panelFirstLastName" runat="server" visible="false"> 
                <span class="litText"><asp:Label runat="server" ID="c_ColumnsErrorFirstLastName"></asp:Label></span>
            </asp:Panel>
            <asp:Panel id="c_panelColumnsError" runat="server" visible="false"> 
                <div class="litText"><asp:Label runat="server" ID="c_ColumnsError"></asp:Label></div>
                <div class="litText"><asp:Label runat="server" ID="c_ColumnsErrorInfo"></asp:Label></div>
            </asp:Panel>
            <br />
            <div>
                <span class="litBoldText"><asp:Label runat="server" ID="c_ErrorOther"></asp:Label></span>
                <br />
                <asp:GridView id="c_ImportResultGrid" runat="server" AutoGenerateColumns="false" gridlines="both" CssClass="Grid" showheader="true">
                    <headerstyle CssClass="HeadingRow"/>
                     <Columns>
                         <asp:templatefield>
                            <itemtemplate>
                              <table>
                                <tr>
                                    <td style="width: 120px;">
                                        <span class="litText"><asp:label id="FirstNameLabel" Text= '<%# Eval("errorRow") %>' runat="server"/> </span>
                                    </td>
                                    <td>
                                        <span class="litText"><asp:label id="Label1" Text= '<%# Eval("errorDescription") %>' runat="server"/> </span>
                                    </td>
                                </tr>
                              </table>
                            </itemtemplate>
                          </asp:templatefield>
                     </Columns>
                </asp:GridView> 
            </div>
        </div>
    </div>
</asp:Content>