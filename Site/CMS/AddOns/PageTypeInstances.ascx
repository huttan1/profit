<%@ Control Language="C#" AutoEventWireup="true" CodeFile="PageTypeInstances.ascx.cs" Inherits="Site_CMS_AddOns_PageTypeInstances" %>
<%@ Register Assembly="Litium.Plus" Namespace="Litium.Plus.CMS.WebControls" TagPrefix="plus" %>

<div style="margin: 15px 15px 15px 15px; width: 615px;">
    <asp:UpdatePanel runat="server" ID="c_mainUpdatePanel" UpdateMode="Always" ChildrenAsTriggers="true">
        <ContentTemplate>
			<div style="padding-top: 10px;">
				<b>Pagetypes</b><br />
				<asp:DropDownList ID="c_dropdownlistPageTypes" Width="200" AutoPostBack="true" OnSelectedIndexChanged="DropdownlistPageTypes_SelectedIndexChanged" runat="server" />
			</div>
			<div style="padding-top: 10px;">
				<b>Templates</b><br />
				<asp:DropDownList ID="c_dropdownlistTemplates"  Width="200" Enabled="false" runat="server" />
			</div>
			<div style="padding-top: 10px;">
				<b>Pagestatus</b><br />
				<asp:CheckBoxList ID="c_checkboxlistPageStatuses"  runat="server" />
			</div>
			<div style="padding-top: 10px;">
				<b>Websites</b><br />
				<asp:CheckBoxList ID="c_checkboxlistWebSites" runat="server" />
			</div>
			<div style="padding-top: 10px;">
				<asp:Button Text="Search" ID="c_buttonSearch" Enabled="false" OnClick="ButtonSearch_Click" runat="server" />
			</div>
			<div style="padding-top: 10px;">
				<web:PageRepeater ID="c_pagerepaterInstances" runat="server">
					<HeaderTemplate>
						<table cellpadding="5" cellspacing="5" style="width:100%;">
							<tr style="background-color: #ddd;">
								<th align="left">ShortName</th>
								<th align="left">Title</th>
								<th align="left">Template</th>
								<th align="left">WebSite</th>
								<th align="left">Status</th>
								<th align="left">Published</th>
								<th align="left">CMS link</th>
							</tr>

					</HeaderTemplate>
					<ItemTemplate>
							<tr>
								<th align="left"><web:PageLink ID="PageLink1" runat="server"><web:ShortName ID="ShortName1" runat="server" /></web:PageLink></th>
								<th align="left"><%# GetStringContent((Container.DataItem as Litium.Foundation.Modules.CMS.Pages.Page), "Title")%> </th>
								<th align="left"><%# (Container.DataItem as Litium.Foundation.Modules.CMS.Pages.Page).Template.Name %> </th>
								<th align="left"><%# (Container.DataItem as Litium.Foundation.Modules.CMS.Pages.Page).WebSite.Name %> </th>
								<th align="left"><%# (Container.DataItem as Litium.Foundation.Modules.CMS.Pages.Page).Status %></th>
								<th align="left"><web:StartPublishDate ID="StartPublishDate1" runat="server" /></th>
								<th align="left"><plus:CMSEditPageLink ID="CMSEditPageLink1" target="_blank" Text="Edit" runat="server" /></th>
							</tr>
					</ItemTemplate>
					<FooterTemplate>
						</table>
					</FooterTemplate>
				</web:PageRepeater>
			</div>
        </ContentTemplate>
    </asp:UpdatePanel>
 </div>