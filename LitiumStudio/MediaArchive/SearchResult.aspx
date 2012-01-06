<%@ page validaterequest="false" language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_SearchResult, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <Toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <Toolbar:ToolbarItem OnClick="ToolbarItemShow_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="Images/transparent.gif" ID="mc_toolbarItemShow" runat="server"/>
	    <Toolbar:DividerItem ID="DividerItem1" ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <Toolbar:ToolbarItem OnClick="ToolbarItemEdit_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
	        LinkClass="litToolbarLink" ImageClass="litIconPencil" SelectedClass="litToolbarItem litToolbarItemSelected"
	        ImageURL="Images/transparent.gif" ID="mc_toolbarItemEdit" runat="server"/>
	    <Toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink"
	        ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
	        ID="mc_toolbarItemDelete" runat="server"/>
    </Toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
    <img src="Images/transparent.gif" style="vertical-align:middle; margin-right:5px;" class="litIconDocumentFind2" alt="" />
        <Foundation:ModuleString ID="ModuleString6" Name="SearchResult" Runat="server"/>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <script type="text/javascript">
    //<!--
    var lrSelectedRow = null;
    var myForm = null;
    function listRow_onClick(t) {
	    t.className = 'litImageList litListRowSelected';
	    if ((lrSelectedRow != null) && (lrSelectedRow != t))
		    lrSelectedRow.className = 'litImageList litListRow';
	    lrSelectedRow = t;
	    document.forms[0].MediaArchive_FileID.value = t.id.substr(t.id.length - 36);
	    if (window.list_onClick) {
		    list_onClick(t.id.substr(t.id.length - 36));
	    }
    }
    function listRow_onDblClick(t) {
	    listRow_onClick(t);
    }
    function listRow_onMouseOver(t) {
		    t.style.cursor='hand';
		    t.className = 'litImageList litListRowSelected';
    }
    function listRow_onMouseOut(t) {
	    if (lrSelectedRow != t)
		    t.className = 'litListRow litImageList';
    }
    function list_selectedRowExists() {
	    var myForm = null;
	    var selectedRow = null;
	    var selectedValue = 0;

	    if (window.navigator.appName.toLowerCase().indexOf("netscape") > -1) {
		    myForm = document.forms[0];
		    selectedValue = (myForm.MediaArchive_FileID) ? myForm.MediaArchive_FileID.value : 0;
		    selectedRow = returnSelectedRow(selectedValue);
	    }
	    else {
		    myForm = document.forms[0];
		    selectedValue = (myForm.MediaArchive_FileID) ? new String(myForm.MediaArchive_FileID.value) : "0";
		    selectedRow = returnSelectedRow(selectedValue);
	    }
	    return (selectedRow != null);
    }
    function list_onLoad() {
	    var myForm = null;
	    var selectedRow = null;
	    var selectedValue = 0;

	    if (window.navigator.appName.toLowerCase().indexOf("netscape") > -1) {
		    myForm = document.forms[0];
		    selectedValue = (myForm.MediaArchive_FileID) ? myForm.MediaArchive_FileID.value : 0;
		    selectedRow = returnSelectedRow(selectedValue);
	    }
	    else {
		    myForm = document.forms[0];
		    selectedValue = (myForm.MediaArchive_FileID) ? new String(myForm.MediaArchive_FileID.value) : "0";
		    selectedRow = returnSelectedRow(selectedValue);
	    }
	    if (selectedRow)
		    selectedRow.click();
    }
    function returnSelectedRow(selectedRowID) {
	    if (selectedRowID.length > 10)
	    {
		    var inputElements = document.getElementsByTagName("tr");
		    for(var i = 0; i < inputElements.length; i++)
		    {
			    var id = inputElements.item(i).getAttribute("ID");
			    if (id && id.indexOf(selectedRowID) > -1)
				    return inputElements.item(i);
		    }
	    }
	    return null;
    }
    //-->
    </script>
	<div class="lsContentScroll">
				        <asp:Repeater ID="mc_repeaterList" Runat="server">
					        <HeaderTemplate>
						        <table border="0" cellspacing="0" cellpadding="0">
							        <tr>
								        <th style="width:94px;" align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString1" Name="Image" runat="server"/></th>
								        <th style="width:40%;" align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString2" Name="Name" runat="server"/></th>
								        <th style="width:40%;" align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString3" Name="FileName" runat="server"/></th>
								        <th style="width:40%;"align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString5" Name="Folder" runat="server"/></th>
							        </tr>
					        </HeaderTemplate>
					        <ItemTemplate>
						        <tr id="tr" runat="server" class="litImageList" onMouseOut="listRow_onMouseOut(this);" onMouseOver="listRow_onMouseOver(this);" >
							        <td class="litListContent" align="center"><img id="img" runat="server" style="margin-top:5px;margin-bottom:5px;" class="litImageBorder" alt="" /></td>
							        <td class="litListContent"><asp:Label id="labelName" Runat="server"/> <a href="#" id="linkDownload" runat="server"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a></td>
							        <td class="litListContent"><asp:Label id="labelFileName" Runat="server"/></td>
							        <td class="litListContent"><a href="#" id="linkFolder" runat="server"><asp:Label id="labelFolderLink" Runat="server"/></a><asp:Label id="labelFolderNoLink" Runat="server"/></td>
						        </tr>
					        </ItemTemplate>
					        <FooterTemplate>
						        </table>
					        </FooterTemplate>
				        </asp:Repeater>
	</div>
    <input type="hidden" name="MediaArchive_FileID" value="<%=SelectedImageID%>"/>
    <script type="text/javascript">
	    list_onLoad();
    </script>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemShow.ClientID.ToString()); %>");
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>