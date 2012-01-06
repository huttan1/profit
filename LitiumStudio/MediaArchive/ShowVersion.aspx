<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_ShowVersion, Litum.Studio.Web" %>

<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>
<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Studio.UI.MediaArchive.WebControls" Assembly="Litium.Studio.UI" %>
<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" runat="Server">
	<Toolbar:HorizontalToolbar ToolbarIndex="1" ID="mc_toolbarRight" runat="server">
		<Toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem"
			LinkClass="litToolbarLink" ImageClass="litIconDelete2" SelectedClass="litToolbarItem litToolbarItemSelected"
			ImageURL="Images/transparent.gif" ID="mc_toolbarItemDelete" runat="server" />
		<Toolbar:DividerItem ID="DividerItem1" ImageURL="Images/transparent.gif" Class="litToolbarDivider"
			runat="server" />
		<Toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled"
			Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft"
			SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif"
			ID="mc_toolbarItemBack" runat="server" />
	</Toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<asp:Label runat="server" ID="mc_labelImageName" />
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" runat="Server">
	<div class="lsContentScroll">
		<table border="0" cellspacing="0" cellpadding="0" width="100%">
			<tr>
				<td align="center" style="border: none;" class="litText">
					<MediaArchive:FileVersion runat="Server" ID="mc_imageVersion" CssClass="litImageBorder"
						MaxHeight="540" MaxWidth="720" Vspace="5"></MediaArchive:FileVersion>
					<br />
					<b>
						<MediaArchive:FileVersionFileName runat="server" ID="mc_imageFileName" />
					</b>(<asp:Label runat="server" ID="mc_labelImageVersionDimensions" /><MediaArchive:FileVersionFileSize
						runat="server" ShowKilobyte="true" ID="mc_imageFileSize" />
					kB) <a href="#" id="mc_linkDownload" runat="server">
						<img src="Images/transparent.gif" style="vertical-align: middle; border: none;" class="litIconDownload"
							alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a><asp:Panel
								Visible="false" ID="mc_panelImageResized" runat="server" Style="padding-top: 5px;
								color: black!important;">
								<img src="Images/transparent.gif" style="vertical-align: middle;" class="litIconWarning"
									alt="" /><asp:Label runat="server" ID="mc_labelImageResized" CssClass="litText" /></asp:Panel>
				</td>
			</tr>
		</table>
	</div>
	<script type="text/javascript">
		var submitObject = null;
		var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemBack.ClientID.ToString()); %>");
		document.onkeypress = function (e) { var key = (window.event) ? window.event.keyCode : e.keyCode; if (key == 27) simulateClick(cancelObject); else if (key == 13) simulateClick(submitObject); }
	</script>
</asp:Content>
