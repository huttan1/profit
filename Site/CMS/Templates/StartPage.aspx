<%@ Page Language="C#" CodeFile="StartPage.aspx.cs" Inherits="Site.CMS.Templates.StartPage" %>
<%@ Register TagPrefix="ExtensionsMetadata" Namespace="Litium.Extensions.Metadata.WebControls"
	Assembly="Litium.Extensions" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
	
       
	<div id="primary" class="grid_3_6 alpha">
    <asp:Panel runat="server" ID="c_panelPreviousPage" Visible="false">
    <a ID="c_linkUpLink" runat="server">
        <web:WebSiteString ID="WebSiteString1" Class="Normal" Name="ButtonBack" runat="server" />        
    </a>
</asp:Panel>
    <ExtensionsMetadata:MetadataPageRepeater ID="c_metadataPageRepeater" IncludeStartNode="true"
        UsePageing="true" OnInit="OnInit_MetadataPageRepeater" OnPreRender="OnPreRender_MetadataPageRepeater" runat="server">
        <ItemTemplate>
        <div class="item">
	            <div class="item_holder">
                  <web:PageLink runat="server">  <h1 class="item_title"><web:Text Name="Title" runat="server" /></h1> 
                  </web:PageLink>
                        <div class="item_info">
                            <p>
                                <span class="item_info_by">written by <web:PublishedBy runat="server" /> </span>
                                <span class="item_info_date"><web:DateTime Name="Date" runat="server" /></span>
                                <span class="item_info_comments"></span>
                            </p>
                        </div>
                        <div class="item_content">                        
                            <web:Text Name="Text" runat="server" />
                        </div>
                        <div class="item_picture">
                            <web:PageLink runat="server">
                                <web:Image Name="Image" runat="server" MaxWidth="325" MaxHeight="250"  />
                            </web:PageLink>
                        </div>
                        <div style="clear:both;"></div>
                           <div class="item_info">
                                <p>
                                <web:PageLink runat="server" CssClass="item_link_readmore">
                                Read More
                                </web:PageLink>
                                <br />
                                    <span class="item_info_true">77% true</span>
                                    <span class="item_info_untrue">23% false</span>
                            
                                </p>
                           </div>
                </div>                
        </div>
        </ItemTemplate>
    </ExtensionsMetadata:MetadataPageRepeater>
    <Plus:Pager runat="server" CssClass="pagination" ID="c_pagerMetadataPageRepeater" PageSize="10" AllwaysShowPrevNextButtons="true"
        ShowFirstAndLastButtons="true" />




	</div>
	

	
	<div id="tertiary" class="grid_3 omega">
		<%-- Login --%>

        <div class="itemleft">
        <site:Filter runat="server" />
        </div>

		<div class="itemleft">       

		<asp:Panel ID="c_panelLogin" runat="server">
		
			<fieldset class="common login" runat="server">
				<label><web:Text Name="LoginUserNameLabel" runat="server" />
				<asp:TextBox ID="c_textBoxLoginName" runat="server" /></label>
				<label><web:Text Name="LoginPasswordLabel" runat="server" />
				<asp:TextBox ID="c_textBoxPassword" TextMode="Password" runat="server" /></label>
				<asp:PlaceHolder ID="c_placeHolderLoginError" runat="server">
					<p class="message error"><asp:Label ID="c_labelError" runat="server" /></p>
				</asp:PlaceHolder>
				<asp:Button ID="c_buttonLogin" OnClick="c_buttonLogin_Click" runat="server" />
				<asp:PlaceHolder ID="c_placeHolderForgottenPasswordLink" runat="server">
					<a ID="c_forgottenPasswordLink" class="password" OnPreRender="ForgottenPasswordLink_PreRender" runat="server" />
				</asp:PlaceHolder>
			</fieldset>
		
		</asp:Panel>
		
		<asp:PlaceHolder ID="c_placeHolderLoggedIn" runat="server">
		    <fieldset id="loggedin" class="common login">
			    <p ID="c_labelLoggedIn" runat="server" />
			    <web:LogOutButton runat="server" ReturnURL="~" TitleKey="LoginLogOutButton"><web:WebSiteString runat="server" Name="LoginLogOutButton" /></web:LogOutButton>
			</fieldset>
		</asp:PlaceHolder>

		<asp:PlaceHolder ID="c_placeHolderForgottenPassword" runat="server">

			<fieldset ID="c_fieldsetForgottenPassword" class="common" runat="server">
				<legend></legend>
				<label><web:Text Name="EmailLabel" runat="server" />
				<asp:TextBox ID="c_textBoxEmail" runat="server" /></label>
				<asp:PlaceHolder ID="c_placeHolderForgottenPasswordError" runat="server">
					<p class="message error"><asp:Literal ID="c_literalForgottenPasswordError" runat="server" /></p>
				</asp:PlaceHolder>
				<input ID="c_buttonSend" type="button" OnServerClick="c_buttonSend_Click" runat="server" />			
			</fieldset>

			<asp:PlaceHolder ID="c_placeHolderForgottenPasswordMessage" runat="server">
				<p class="message notice"><asp:Literal ID="c_literalForgottenPasswordMessage" runat="server" /></p>
			</asp:PlaceHolder>

		</asp:PlaceHolder>

		<asp:PlaceHolder ID="c_placeholderChangePassword" Visible="false" runat="server">

			<web:ValueExists Name="ChangePasswordInfo" runat="server">
				<OnTrue>
					<p class="intro"><web:Text Name="ChangePasswordInfo" runat="server" /></p>
				</OnTrue>
			</web:ValueExists>

			<fieldset class="common">

				<label><web:Text Name="NewPasswordLabel" runat="server" />
				<asp:TextBox ID="c_textBoxNewPassword" TextMode="Password" runat="server" /></label>

				<label><web:Text Name="RetypeNewPasswordLabel" runat="server" />
				<asp:TextBox ID="c_textBoxNewPassword2" TextMode="Password" runat="server" /></label>

				<asp:PlaceHolder ID="c_trErrorChangePassword" Visible="false" runat="server">
					<asp:Label ID="c_labelErrorChangePassword" runat="server" />
				</asp:PlaceHolder>

				<input ID="c_buttonNewPassword" type="button" OnServerClick="buttonChangePassword_Click" runat="server" />

			</fieldset>

		</asp:PlaceHolder>
		</div>
		<br />
		<web:ValueExists Name="ImageBanner1" runat="server">
			<OnTrue>
				<div class="itemleft">
					<web:ValueExists Name="ImageBanner1LinkExternal" runat="server">
						<OnTrue>
								<a href="<web:Text Name='ImageBanner1LinkExternal' />"> 
									<web:Image Name="ImageBanner1" runat="server" />		
								</a>
							<web:ValueExists runat="server" Name="ImageBanner1Text">
								<OnTrue>
									<web:Text Name="ImageBanner1Text" runat="server" />
								</OnTrue>
							</web:ValueExists>
						</OnTrue>
						<OnFalse>
							<web:PageLink runat="server" Name="ImageBanner1Link">
								<web:Image Name="ImageBanner1" MaxWidth="235" runat="server" />
							</web:PageLink>
						<web:ValueExists runat="server" Name="ImageBanner1Text">
							<OnTrue>
								<web:Text Name="ImageBanner1Text" runat="server" />
							</OnTrue>
						</web:ValueExists>
						</OnFalse>
						</web:ValueExists>		
				</div>
			</OnTrue>
		</web:ValueExists>

	</div>
	
</asp:Content>