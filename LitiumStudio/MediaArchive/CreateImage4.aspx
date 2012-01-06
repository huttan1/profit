<%@ page language="C#" masterpagefile="~/LitiumStudio/MediaArchive/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_MediaArchive_CreateImage4, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/MediaArchive/Framework/Base.master" %>



<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
	<asp:UpdatePanel runat="server" ID="m_toolbarUpdate" UpdateMode="Conditional" ChildrenAsTriggers="false">
		<ContentTemplate>
			<toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbarRight" runat="server" >
				<toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemCancel" runat="server"/>
				<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2"/>
				<toolbar:ToolbarItem OnClick="ToolbarItemBack_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemBack" runat="server"/>
				<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem1"/>
				<toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="mc_toolbarItemSave" runat="server"/>
			</toolbar:HorizontalToolbar>

			<asp:Timer runat="server" ID="m_updateTimer" Interval="1000" OnTick="ConvertedVersionTimer_Tick" Enabled="false" />
		</ContentTemplate>
		<Triggers>
		<asp:PostBackTrigger ControlID="mc_toolbarItemSave" />
		</Triggers>
	</asp:UpdatePanel>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">     
     <Foundation:ModuleString ID="ModuleString2" Name="CreateImagePageSubHeader" Runat="server"/> <span style="font-weight:normal;">(<Foundation:ModuleString ID="ModuleString3" Name="CreateImagePage5SubHeader1" runat="Server"/>)</span>
</asp:Content>

<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <span class="litText"><Foundation:ModuleString Name="CreateImagePage5Description1" runat="server" ID="Modulestring1"/><br /><br /></span>
        <asp:Repeater id="mc_repeaterCategoriesList" runat="server" OnItemDataBound="mc_repeaterCategoriesList_ItemDataBound">
	        <ItemTemplate>
		        <asp:CheckBox Cssclass="litInputCheckbox litText" runat="server" ID="categoryCheckbox"/><br />
	        </ItemTemplate>
        </asp:Repeater>
        <asp:Label runat="server" id="mc_labelNoCategories" visible="false" class="litText" />
        <asp:UpdatePanel runat="server" ID="m_preprocessing" UpdateMode="Conditional" ChildrenAsTriggers="false">
		<ContentTemplate>
			<div class="litText">
				<Foundation:ModuleString runat="server" ID="m_convertionMessage" Name="FileProcessing" Visible="false" />
			</div>
		</ContentTemplate>
		</asp:UpdatePanel>
    </div>
    <script type="text/javascript">
        var submitObject = document.getElementById("<% Response.Write(mc_toolbarItemSave.ClientID.ToString()); %>");
        var cancelObject = document.getElementById("<% Response.Write(mc_toolbarItemCancel.ClientID.ToString()); %>");
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
    </script>
</asp:Content>