<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Add1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>



<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
   	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>	
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
         <img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" /><asp:Label runat="server" ID="c_labelAddPageHeader" /><span class="litTextNormalWeight">&nbsp;(<asp:Label runat="server" ID="c_labelAddPageSubHeader" />)</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <div class="litDescriptionText"><asp:Label ID="c_labelPageDescription" runat="server" /></div>
        
        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="Template" Runat="server"/></div>
        <asp:DropDownList id="c_dropDownFieldTemplate" cssclass="litInputText200" runat="server"/>
        
        <div style="margin-top:5px;" class="litErrorMsg"><asp:Label runat="server" ID="c_labelChangeMessage" Visible="false"><Foundation:ModuleString ID="ModuleString2" Name="PersonAddPage1ChangeTemplate" runat="server" /></asp:Label></div>
    </div>
</asp:Content>