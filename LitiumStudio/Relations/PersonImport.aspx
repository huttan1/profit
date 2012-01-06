<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_PersonImport1, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>


<%@ Import Namespace="System.Web.UI.WebControls" %>

<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <script type="text/javascript">
	    function progressActivate(){
		    progressDisableTags("SELECT");
		    progressDisableTags("INPUT");
		    var img = document.getElementById('imageProgress');
		    if(img){
			    img.src = 'Images/progress.gif';
			    img.style.display = 'inline';
		    }
		    if(document.getElementById('textProgress'))
			    document.getElementById('textProgress').style.display = 'inline';
	    }
	    function progressDisableTags(tagName){
		    var tag = document.getElementsByTagName(tagName);
		    for(i=0;i<tag.length;i++)
			    tag[i].disabled = true;
	    }
    </script>
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemImport_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconImport2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemImport" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" alt="" class="litIconRelationsPerson" /><Foundation:ModuleString ID="ModuleString1" Name="PersonsImport" runat="server" /><span class="litTextNormalWeight">&nbsp;(<Foundation:ModuleString ID="ModuleString5" Name="PersonsImportPage1SubHeader" runat="server"/>)</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litBoldText"><Foundation:ModuleString Name="PersonsImportFile" runat="server" />:<br /></span>
        <asp:FileUpload class="litInputFile" size="63" ID="c_importFile" style="margin-bottom:5px;" runat="server" />
        <span class="litErrorMsg"><img src="images/transparent.gif" runat="server" style="vertical-align:middle;" id="c_imgNoFile" class="litIconError" alt="" /><asp:Label id="c_labelError" runat="server"/></span>
        <br /><br />
        <asp:UpdatePanel runat="server" ChildrenAsTriggers="true" UpdateMode="Conditional">
			<ContentTemplate>
				<span class="litBoldText"><Foundation:ModuleString ID="ModuleString2" Name="Group" runat="server" />:<br /></span>
				<div style="padding-bottom:5px;"><asp:RadioButton runat="server" AutoPostBack="true" ID="c_noGroup" GroupName="GroupSelection" Checked="true" CssClass="litText" /></div>
				<asp:RadioButton runat="server" AutoPostBack="true" ID="c_selectGroup" GroupName="GroupSelection" CssClass="litText" />
				<asp:DropDownList runat="server" id="c_selectedGroup" CssClass="litInputSelect" style="width:auto;" />
				<span class="litErrorMsg"><img src="images/transparent.gif" runat="server" style="vertical-align:middle;" id="c_imgNoGroup" class="litIconError" alt="" visible="false" /><asp:Label id="c_labelNoGroup" runat="server"/></span>
			</ContentTemplate>
		</asp:UpdatePanel>
        <br /><br />
        <span class="litBoldText"><Foundation:ModuleString ID="ModuleString3" Name="FieldTemplate" runat="server" />:<br /></span>
        <span class="litText"><Foundation:ModuleString ID="ModuleString4" Name="FieldTemplateImport" runat="server" /></span> <asp:DropDownList runat="server" id="c_defaultTemplate" CssClass="litInputSelect" style="width:auto;" />
    </div>
</asp:Content>