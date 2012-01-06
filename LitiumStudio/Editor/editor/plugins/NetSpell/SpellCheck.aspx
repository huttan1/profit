<%@ page language="C#" classname="PopUpSpell" validaterequest="False" inherits="Modules_Common_FCKeditor_editor_plugins_NetSpell_SpellCheck, Litum.Studio.Web" %>

<html>
<head runat="server">
	<title>Spell Check</title>
	<link href="spell.css" type="text/css" rel="stylesheet" />
    <link rel="Shortcut Icon" href="<%=Page.ResolveUrl("~/LitiumStudio/Images/adminfavicon.ico")%>" />
    <link href="<%=Page.ResolveUrl("~/LitiumStudio/Editor/editor/dialog/common/fck_dialog_common.css")%>" type="text/css" rel="stylesheet">
	<script language="JavaScript" src="SpellCheck.js" type="text/javascript"></script>
	<script type="text/javascript">
		txtCheckText = "<Foundation:SystemString runat="server" Name="SpellCheckerCheckText" />"
	</script>
</head>
<body id="SpellingBody" style="margin: 0px; overflow: hidden; padding: 0px;" runat="server" class="litSpellcheck">
	<form id="SpellingForm" name="SpellingForm" method="post" runat="server">
	<input id="WordIndex" type="hidden" value="0" name="WordIndex" runat="server" />
	<input id="WordString" type="hidden" name="WordString" runat="server" />
	<input id="CurrentText" type="hidden" name="CurrentText" runat="server" />
	<input id="IgnoreList" type="hidden" name="IgnoreList" runat="server" />
	<input id="ReplaceKeyList" type="hidden" name="ReplaceKeyList" runat="server" />
	<input id="ReplaceValueList" type="hidden" name="ReplaceValueList" runat="server" />
	<input id="ElementIndex" type="hidden" value="-1" name="ElementIndex" runat="server" />
	<input id="SpellMode" type="hidden" value="load" name="SpellMode" runat="server" />
	<asp:Panel ID="SuggestionForm" runat="server" Visible="true" EnableViewState="False">
		<table cellspacing="0" cellpadding="5" width="100%">
			<tbody>
				<tr>
					<td valign="center" align="middle">
						<table cellspacing="0" cellpadding="0" border="0">
							<tbody>
								<tr>
									<td style="width: 250px">
										<span><Foundation:SystemString runat="server" Name="SpellCheckerNotInDictionary" ID="c_SpellCheckerNotInDictionary" /></span>
									</td>
									<td>
										<p>&nbsp;</p>
									</td>
								</tr>
								<tr>
									<td valign="top">
								        <div style="border: solid 1px #a19e98; height: <%=(Request.Browser.Browser.Equals("IE")) ? "58" : "51"%>px; width: 230px; overflow: hidden; background-color: White; border: solid 1px #a19e98; padding: 3px;">
										    <asp:Literal runat="server" ID="c_display" />
										</div>
									</td>
									<td>
										<asp:Button ID="IgnoreButton" OnClick="IgnoreButton_Click" runat="server" EnableViewState="False"
											Enabled="False" CssClass="button" Text="Ignore"></asp:Button>
										<asp:Button ID="IgnoreAllButton" OnClick="IgnoreAllButton_Click" runat="server" EnableViewState="False"
											Enabled="False" CssClass="button" Text="Ignore All"></asp:Button>
										<asp:Button ID="AddButton" OnClick="AddButton_Click" runat="server" EnableViewState="False"
											Enabled="False" CssClass="button" Text="Add"></asp:Button>	
									</td>
								</tr>
								<tr>
								    <td style="height: 30px;">&nbsp;</td>
								    <td>&nbsp;</td>
								</tr>
								<tr>
									<td>
										<span><Foundation:SystemString ID="SystemString1" runat="server" Name="SpellCheckerChangeTo" /></span>
									</td>
									<td>
										<p>&nbsp;</p>
									</td>
								</tr>
								<tr>
									<td>
										<asp:TextBox ID="ReplacementWord" runat="server" EnableViewState="False" Enabled="False"
											CssClass="suggestion" Columns="30" Width="230px"></asp:TextBox>
									</td>
									<td>
										<asp:Button ID="ReplaceButton" OnClick="ReplaceButton_Click" runat="server" EnableViewState="False"
											Enabled="False" CssClass="button" Text="Replace"></asp:Button>
									</td>
								</tr>
								<tr>
									<td>
										<span><Foundation:SystemString ID="SystemString2" runat="server" Name="SpellCheckerSuggestions" /></span>
									</td>
									<td>
										<asp:Button ID="ReplaceAllButton" OnClick="ReplaceAllButton_Click" runat="server"
											EnableViewState="False" Enabled="False" CssClass="button" Text="Replace All">
										</asp:Button>
									</td>
								</tr>
								<tr>
									<td rowspan="4">
										<asp:ListBox ID="Suggestions" runat="server" EnableViewState="False" Enabled="False"
											CssClass="suggestion" Width="230px" Rows="8" onDblClick="if (this.selectedIndex != -1) this.form.ReplaceButton.click();"></asp:ListBox>
									</td>
									<td>
									    <p>&nbsp;</p>
									</td>
								</tr>
								<tr>
									<td>
									    <p>&nbsp;</p>
									</td>
								</tr>
								<tr>
									<td>
									    <p>&nbsp;</p>
									</td>
								</tr>
								<tr>
									<td>
									    <p>&nbsp;</p>
									</td>
								</tr>
								
								<tr>
									<td style="padding-top: 3px;"><span><Foundation:SystemString ID="SystemString4" runat="server" Name="SpellCheckerDictionary" />:</span></td>
									<td><p>&nbsp;</p></td>
								</tr>
								<tr>
									<td><asp:DropDownList ID="m_wordList" runat="server" AutoPostBack="true" CssClass="suggestion" Columns="30" Width="230px" OnSelectedIndexChanged="WordList_SelectedIndexChanged"></asp:DropDownList>
									</td>
									<td>
									    <p>&nbsp;</p>
									</td>
								</tr>
								
								<tr>
									<td colspan="2" style="padding-top: 8px;">
										<asp:Label ID="StatusText" runat="Server" ForeColor="DimGray" Font-Size="8pt"><Foundation:SystemString ID="SystemString3" runat="server" Name="SpellCheckerLoading" /></asp:Label>
									</td>
								</tr>
							</tbody>
						</table>
					</td>
				</tr>
			</tbody>
		</table>
	</asp:Panel>
	</form>
</body>
</html>
