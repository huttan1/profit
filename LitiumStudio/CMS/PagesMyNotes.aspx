<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesMyNotes, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarTasks" runat="server" >
		<toolbar:ToolbarItem OnClick="ToolbarItemCreate_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass=" litIconNootbookAdd" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCreate" runat="server"/>
    </toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconEdit" />
	<Foundation:ModuleString ID="ModuleString16" name="MyNotes" runat="server" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll">
		<div class="litListWithTreeAreaV2">
			<table cellpadding="0" cellspacing="0" border="0" style="width:expression((document.documentElement.clientWidth || document.body.clientWidth) - 245 + 'px'); ">
				<tr>
					<th align="left" class="lsListHeader"><Foundation:ModuleString ID="ModuleString4" Name="Note" runat="server" /></th>
					<th class="lsListHeader" style="width:21px;">&nbsp;</th>
					<th class="lsListHeader" style="width:21px;">&nbsp;</th>
				</tr>
				<asp:Repeater ID="c_notes" Runat="server">
					<ItemTemplate>
						<tr>
							<td>
								<asp:Label CssClass="litListContent" id="labelNote" runat="server" />
								<asp:TextBox CssClass="litInputText" id="c_textBoxNote" runat="server" />
								<asp:Label CssClass="litListContent" id="c_labelTaskID" runat="server" Visible="false" />
							</td>
							<td align="center" class="litListContent">
								<asp:ImageButton id="c_imageButtonSave" ImageUrl="Images/transparent.gif" ImageAlign="AbsMiddle" OnClick="ButtonSave_Click" BorderWidth="0" CssClass="litIconDiskBlue" runat="server" />
								<asp:ImageButton id="c_imageButtonEdit" ImageUrl="Images/transparent.gif" OnClick="ButtonEdit_Click" ImageAlign="AbsMiddle" BorderWidth="0" CssClass="litIconPencil" runat="server" />
							</td>
							<td align="center" class="litListContent">
								<asp:ImageButton id="c_imageButtonDelete" ImageUrl="Images/transparent.gif" ImageAlign="AbsMiddle" OnClick="ButtonDelete_Click" BorderWidth="0" CssClass="litIconDelete2" runat="server" />
							</td>
						</tr>
					</ItemTemplate>
				</asp:Repeater>
			</table>
		</div>
	</div>
</asp:Content>