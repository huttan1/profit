<%@ page title="" language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_ECommerce_SettingsReportAddEdit, Litum.Studio.Web" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
    <Toolbar:HorizontalToolbar runat="server">
        <Toolbar:ToolbarItem OnClick="ToolbarItemAbort_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
            Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected"
            ImageURL="Images/transparent.gif" ID="c_toolbarItemAbort" runat="server" />
        <Toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarDivider"
            runat="server" ID="Divideritem1" />
        <Toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
            Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue"
            SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
            ID="c_toolbarItemSave" CausesValidation="true" runat="server" />
    </Toolbar:HorizontalToolbar>
</asp:Content>

 <asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" alt="" class="litIconECommerce" />
	 <asp:Label runat="server" ID="c_header" />
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="lsContentScroll">
            <div class="litBoldHeader">
                <Foundation:ModuleString ID="ModuleString15" Name="ReportActive" runat="server" />:
            </div>
            <div>
                <asp:CheckBox runat="server" ID="c_active" CssClass="litInputSelect" />
            </div>
            <div class="litBoldHeader">
                <Foundation:ModuleString ID="ModuleString4" Name="ReportName" runat="server" />:
            </div>
            <div>
                <asp:TextBox runat="server" ID="c_reportName" CssClass="litInputSelect" />
            </div>
            <div>
                <asp:Repeater runat="server" ID="c_translations" OnItemDataBound="Translation_DataBound">
                    <ItemTemplate>
                        <div style="float: left; width: 230px;">
                            <div class="litBoldHeader">
                                <asp:label ID="c_translatedNameLabel" runat="server" />:
                            </div>
                            <div>
                                <asp:TextBox runat="server" ID="c_transladedName" CssClass="litInputSelect" />
                            </div>
                        </div>
                    </ItemTemplate>
                </asp:Repeater>                
            </div>
            
            <!--[if IE 6]>
            <div class="litBoldHeader" style="clear: both;">
            <![endif]--> 
            <!--[if IE 7]>
            <div class="litBoldHeader" style="clear: both; padding-top:15px;">
            <![endif]-->
            <!--[if IE 8]>
            <div class="litBoldHeader" style="clear: both; padding-top:15px;">
            <![endif]-->
            <!--[if !IE]>-->
            <div class="litBoldHeader" style="clear: both; padding-top:15px;">
            <!--<![endif]-->            
                <Foundation:ModuleString ID="ModuleString2" Name="ReportLink" runat="server" />:<img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />
            </div>
            <div>
                <asp:TextBox runat="server" ID="c_link" CssClass="litInputSelect" />
                <asp:RequiredFieldValidator runat="server" ID="c_linkValidator" ControlToValidate="c_link" />
            </div>
    </div>
</asp:Content>
