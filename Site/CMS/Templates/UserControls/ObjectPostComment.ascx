<%@ Control Language="C#" AutoEventWireup="true" CodeFile="ObjectPostComment.ascx.cs" Inherits="Templates_Extensions_ObjectPostComment" %>
<style type="text/css">
	.ObjectPostList { margin: 10px 0; }
	.ObjectPost_Item,
	.ObjectPost_PostForm { margin: 0 0 10px 0; width:300px; padding: 10px; background-color: #eee; }
	hr.ObjectPost_Item_Separator { height: 1px; border-top: solid 1px #CF5AA6; margin-top: 10px; margin-bottom: 10px; }

	.ObjectPost_PostForm .ObjectPost_PostText { }
	.ObjectPost_PostForm .ObjectPost_PostText textarea { width: 100%; }
	.ObjectPost_PostForm input[type='text'] { clear: both; margin-bottom:10px; }
	.ObjectPost_User input { width: 100%; float:none; }
</style>

<%-- 
	This is the form webcontrol used for posting comments on an object 
	It has som requirements to work; 
		1. You must enter a PostType
		2. It needs a Button, LinkButton or ImageButton with ID "Button_Send"
		3. A TextBox with ID "TextBox_PostText"
		4. A Panel with ID "Panel_PostFields", all controls will be placed in this 
		5. A Panel with ID "Panel_Sucess", an optional sucess message sould be placed in this
		6. And if AllowAnonymousPosting is set to "true" it also requires two textboxes with IDs "TextBox_UserName" and "TextBox_UserEmail"
		7. An optional field that the user can provide a link in can be created with the ID "TextBox_PostLink"
--%>
<objectpost:ObjectPostForm AllowAnonymousPosting="true" HideFieldsAfterSave="false" SendButtonWebSiteStringKey="Extensions_OP_Send" AutoFillControls="true" PostsIsReportable="true" ID="c_objectPostForm1" runat="server">
	<asp:Panel ID="Panel_PostFields" CssClass="ObjectPost_PostForm ObjectPost_Item clearbox" runat="server">
		<h2><web:WebSiteString Name="Extensions_OP_CommentTitle" runat="server" />:</h2>
		<div class="ObjectPost_User">
			<h3><web:WebSiteString Name="Extensions_OP_CommentUserName" runat="server" />:</h3>
			<asp:TextBox ID="TextBox_UserName" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator id="Validator_RequiredPostUserName" ControlToValidate="TextBox_PostText" runat="server" Display="Dynamic"><p>Du måste ange ditt namn</p></asp:RequiredFieldValidator>
			<h3><web:WebSiteString Name="Extensions_OP_CommentUserEmail" runat="server" />:</h3>
			<asp:TextBox ID="TextBox_UserEmail" runat="server"></asp:TextBox>
			<asp:RequiredFieldValidator id="Validator_RequiredPostUserEmail" ControlToValidate="TextBox_PostText" runat="server" Display="Dynamic"><p>Du måste ange din e-post</p></asp:RequiredFieldValidator>
		</div>
		<div class="ObjectPost_PostText">
			<h3><web:WebSiteString Name="Extensions_OP_Comment" runat="server" />:</h3>			
			<asp:TextBox id="TextBox_PostText" runat="server" TextMode="Multiline" Rows="4"></asp:TextBox>
			<p><asp:RequiredFieldValidator id="Validator_RequiredPostText" ControlToValidate="TextBox_PostText" runat="server" Display="Dynamic">Du måste ange ett meddelande</asp:RequiredFieldValidator></p>
		</div>
		<div>
			<asp:Button id="Button_Send" runat="server" />
	    </div>
	</asp:Panel>
	<asp:Panel id="Panel_Sucess" runat="server">
		<web:WebSiteString Name="Extensions_OP_FinishedText" runat="server" />
	</asp:Panel>
</objectpost:ObjectPostForm>

<objectpost:ObjectPostRepeater ID="m_objectPostRepeater1" runat="server">
	<HeaderTemplate>
		<div class="ObjectPostList">
	</HeaderTemplate>
	<FooterTemplate>
		</div>
	</FooterTemplate>
	<ItemTemplate>
		<div class="ObjectPost_Item">
			<div class="ObjectPost_Item_Text">
				<div class="ObjectPost_Item_Text_Top">
					<objectpost:PostFieldValue SourceField="Text" runat="server" />
				</div>
				<div class="ObjectPost_Item_Text_Bottom">
					<web:WebSiteString Name="Extensions_OP_CommentBy" runat="server" />:&nbsp;<a href="mailto:<objectpost:PostFieldValue SourceField='UserEmail' runat='server' />"><objectpost:PostFieldValue SourceField="UserName" runat="server" /></a> |
					<objectpost:PostDate HoursWebSiteStringKey="Extensions_OP_Date_Hours" OneDayWebSiteStringKey="Extensions_OP_Date_OneDay" MinutesWebSiteStringKey="Extensions_OP_Date_Minutes" Format="yyyy-MM-dd HH:mm" runat="server" />
					<p>
						<objectpost:PostIsReportable runat="server">
							<OnTrue>
								<objectpost:PostIsReported runat="server">
									<OnFalse>
										<objectpost:ObjectPostReportButton runat="server" CssClass="ReportLink" CausesValidation="false" WebSiteStringKey="Extensions_OP_Report" />
									</OnFalse>
									<OnTrue>
										<p><web:WebSiteString Name="Extensions_OP_PostReported" runat="server" /></p>
									</OnTrue>
								</objectpost:PostIsReported>
							</OnTrue>
						</objectpost:PostIsReportable>
						
						<plus:HasPublishPermission runat="server">
							<OnTrue>
								<objectpost:ObjectPostEditButton ID="ObjectPostEditButton1" runat="server"><web:WebSiteString ID="WebSiteString2" Name="Extensions_OP_EditPostButton" runat="server" /></objectpost:ObjectPostEditButton>
								<objectpost:ObjectPostDeleteButton ID="ObjectPostDeleteButton1" ButtonConfirmationKey="OP_DeletePostConfirmation" runat="server"><web:WebSiteString ID="WebSiteString3" Name="Extensions_OP_DeletePostButton" runat="server" /></objectpost:ObjectPostDeleteButton>									
								<objectpost:PostIsReported ID="PostIsReported1" runat="server">
									<OnTrue>
										<objectpost:ObjectPostConfirmButton ID="ObjectPostConfirmButton1" runat="server"><web:WebSiteString ID="WebSiteString1" Name="Extensions_OP_ConfirmPostButton" runat="server" /></objectpost:ObjectPostConfirmButton>
									</OnTrue>
								</objectpost:PostIsReported>
							</OnTrue>
							<OnFalse>
								<objectpost:PostIsPostedByCurrentUser ID="PostIsPostedByCurrentUser1" runat="server">
									<OnTrue>
										<objectpost:ObjectPostDeleteButton ID="ObjectPostDeleteButton2" ButtonConfirmationKey="OP_DeletePostConfirmation" runat="server"><web:WebSiteString ID="WebSiteString3" Name="Extensions_OP_DeletePostButton" runat="server" /></objectpost:ObjectPostDeleteButton>
									</OnTrue>
								</objectpost:PostIsPostedByCurrentUser>
							</OnFalse>
						</plus:HasPublishPermission>
					</p>
				</div>
			</div>
		</div>
		<div style="clear:both;"></div>
	</ItemTemplate>
</objectpost:ObjectPostRepeater>