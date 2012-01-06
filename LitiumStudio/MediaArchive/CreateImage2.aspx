<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateImage2, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>


<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI"%>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
	    <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemBack" runat="server"/>
	    <toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemNext" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">     
     <Foundation:ModuleString ID="ModuleString3" Name="CreateImagePageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString7" Name="CreateImagePage2SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:ModuleString Name="CreateImagePage2Description1" runat="server" ID="Modulestring1"/><br /><br /></span>
        <asp:Repeater ID="mc_repeaterImages" Runat="server" OnItemDataBound="mc_repeaterImages_ItemDataBound">
	        <ItemTemplate>
		        <table border="0" cellspacing="0" cellpadding="0" ID="Table1">
			        <tr>
				        <td valign="middle" align="center" style="padding-right:10px; width:104px;"><MediaArchive:File runat="server" id="ImageControl1" MaxHeight="94" MaxWidth="94" CssClass="litImageBorder" UseStaticThumbnail="true" /><asp:Label runat="server" ID="mc_labelNonPreviewableVersion" Visible="false" CssClass="litText" /></td>
				        <td valign="top">
				            <span class="litText"><b><Foundation:ModuleString Name="Name" runat="server" ID="Modulestring13"/>:</b><br /></span><asp:TextBox TextMode="SingleLine" ID="mc_textBoxImageName" Runat="server" CssClass="litInputText200" style="margin-bottom:5px;" /><br />
				            <span class="litText"><b><Foundation:ModuleString Name="FileName" runat="server" ID="Modulestring14"/>:</b> <%#DataBinder.Eval(Container.DataItem, "FileName")%></span><br />
				            <span class="litText"><b><Foundation:ModuleString Name="Size" runat="server" ID="Modulestring15"/>:</b> <asp:Label runat="server" id="mc_labelFileSize" /> kB</span>
				        </td>
				        <td valign="top" style="padding-left:10px;padding-bottom:6px;" class="litErrorMsg"><br /><asp:RequiredFieldValidator Runat="server" ID="mc_validatorRequiredName" Display="Dynamic" ControlToValidate="mc_textBoxImageName"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="RequiredField" runat="server" ID="Modulestring2"/></asp:RequiredFieldValidator><asp:RegularExpressionValidator Runat="server" Display="Dynamic" ID="mc_validatorErrorImageName" ControlToValidate="mc_textBoxImageName" ValidationExpression="[^<>\']*" ><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><Foundation:ModuleString Name="MessageMaliciousInput" runat="server" ID="Modulestring6"/></asp:RegularExpressionValidator></td>
			        </tr>
		        </table><br />
	        </ItemTemplate>
        </asp:Repeater>
    </div>
    <input type="hidden" id="c_inputHiddenHasRequestedVersion" runat="server" value="1" />
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemNext.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
    <script type="text/javascript" src="<%=Page.ResolveUrl("~/LitiumStudio/FlexUpload/js/AC_OETags.js")%>"></script>
    <script type="text/javascript">
    <!--
            var requiredMajorVersion = 9;
            var requiredMinorVersion = 0;
            var requiredRevision = 124;
            var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);
            if (!hasRequestedVersion)
            {
                var inputHiddenHasRequestedVersion = document.getElementById('<%=c_inputHiddenHasRequestedVersion.ClientID%>');
                if (inputHiddenHasRequestedVersion)
                    inputHiddenHasRequestedVersion.value = '0';
            }   
    // -->
    </script>
</asp:Content>