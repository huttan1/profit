<%@ page language="c#" enablesessionstate="True" autoeventwireup="true" inherits="LitiumStudio_Default, Litum.Studio.Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" runat="server">
<head id="Head1" runat="server">
    <title>Litium Studio</title>
    <meta content="Microsoft Visual Studio .NET 7.1" name="GENERATOR" />
    <meta content="C#" name="CODE_LANGUAGE" />
    <meta content="JavaScript" name="vs_defaultClientScript" />
    <meta content="http://schemas.microsoft.com/intellisense/ie5" name="vs_targetSchema" />
<Telerik:RadCodeBlock ID="RadCodeBlock1" runat="server">
    <script type="text/javascript">
	<!--
        function pageOnLoad() {
            var loginTextBox = document.getElementById('<%=c_textBoxLoginName.ClientID %>');
            loginTextBox.focus();

            //crash in IE
            <% if(Request.Browser.Browser != "IE")
              {%>            
                //set cusor to start position
                 loginTextBox.setSelectionRange(0, 0);
            <%
              }%>
        }
        var needOnFocus = true;

        function TextBoxLoginNameTextPress(textBox) {
            if (needOnFocus) {
                textBox.value = '';
                textBox.onKeyPress = '';
                needOnFocus = false;
            }
        }
        
        function TextBoxPasswordOnFocus() {
            TextBoxOnFocus(document.getElementById('<%=c_textBoxPassword_text.ClientID %>'), document.getElementById('<%=c_textBoxPassword_value.ClientID %>'));
        }

        function TextBoxPassword1OnFocus() {
            TextBoxOnFocus(document.getElementById('<%=c_textPassword1_text.ClientID %>'), document.getElementById('<%=c_textPassword1_value.ClientID %>'));
        }

        function TextBoxPassword2OnFocus() {
            TextBoxOnFocus(document.getElementById('<%=c_textPassword2_text.ClientID %>'), document.getElementById('<%=c_textPassword2_value.ClientID %>'));
        }

        function TextBoxLoginFPNameOnFocus() {
            TextBoxOnFocus(document.getElementById('<%=c_textBoxFPLoginName_text.ClientID %>'), document.getElementById('<%=c_textBoxFPLoginName_value.ClientID %>'));
        }

        function TextBoxOnFocus(textboxText, textboxValue) {
        	textboxText.disabled = "disabled";
        	textboxText.style.display = "none";
        	
			textboxValue.disabled = "";
        	textboxValue.style.display = "inline";
            textboxValue.focus();
        }      

	//-->
    </script>
</Telerik:RadCodeBlock>
</head>
<body onload="pageOnLoad();">
    <form id="Form1" method="post" runat="server" style="height: 100%">    
    <table cellpadding="0" cellspacing="0" border="0" style="margin: auto; height: 100%; font-size:small;"
        id="c_table" runat="server">
        <tr>
            <td style="height: 20%;">
            </td>
        </tr>
        <tr>
            <td style="height: 40%;" valign="middle" align="center">
                <table cellpadding="0" cellspacing="0" border="0" width="326">
                    <tr>
                        <td colspan="3" style="height: 10px;"><img src="images/login_top.gif" width="326" height="10" alt="" /></td>
                    </tr>
                    <tr>
                        <td style="width: 9px; height: 3px;"><img src="images/box_left_top.gif" width="9" height="3" alt="" /></td>
                        <td style="width: 308px; height: 3px;" class="litLoginBgTop"></td>
                        <td style="width: 9px; height: 3px;"><img src="images/box_right_top.gif" width="9" height="3" alt="" /></td>
                    </tr>
                    <tr>
                        <td style="width: 9px; background-image: url(images/box_left_bg.gif);">
                        </td>
                        <td style="width: 308px;" align="left">
                            <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litLoginBg">
                                <tr>
                                    <td class="lsLoginTd" style="padding-top: 30px;"><img src="images/logga_studio.png" width="123" height="44" alt="" /></td>
                                </tr>
                            </table>
                            <asp:Panel runat="server" ID="loginPanel">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litLoginBgMiddle">
                                    <tr>
                                        <td colspan="2" valign="top" class="lsLoginTd" style="padding-right: 40px;">
                                            <asp:TextBox ID="c_textBoxLoginName" runat="server" CssClass="lsTextBoxInfoFullWidth" onKeyPress="TextBoxLoginNameTextPress(this);" onClick="TextBoxLoginNameTextPress(this);"></asp:TextBox>
                                        </td>
                                       
                                    </tr>
                                    <tr>                                       
                                        <td colspan="2" valign="top" class="lsLoginTd" style="padding-right: 40px;">                                            
                                            <asp:TextBox ID="c_textBoxPassword_value" runat="server" CssClass="lsTextBoxValueFullWidth"
                                                TextMode="Password" style="display: none;"></asp:TextBox>
                                            <asp:TextBox ID="c_textBoxPassword_text" runat="server" CssClass="lsTextBoxInfoFullWidth"
                                                onFocus="TextBoxPasswordOnFocus();" ></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="c_trError" runat="server">
                                        <td colspan="2"  class="lsLoginTd litErrorMsg">
                                            <img src="images/transparent.gif" style="vertical-align: middle;" class="litIconError"
                                                alt="" /><asp:Label ID="c_labelError" runat="server" CssClass="error"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td align="right" class="lsLoginTd" style="padding-top: 20px; width: 90%;">
                                            <a href="javascript:document.getElementById('<%=c_buttonForgotPassword.ClientID %>').click();" visible="false" runat="server"><Foundation:SystemString ID="ForgotPasswordButton" CssClass="litText" Name="ForgotPasswordButton" runat="server"/></a>                                            
                                        </td>
                                        <td align="right" class="lsLoginTd" style="padding-top: 20px;">
                                            <asp:Button ID="c_buttonLogin" OnClick="c_buttonLogin_Click" CssClass="litInputButton"
                                                runat="server" style="width: auto;"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="litLoginCopyright" style="padding: 30px; padding-top: 10px;
                                            padding-bottom: 0px;">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="changePasswordPanel" Visible="false">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litLoginBgMiddle">
                                   <tr>
                                        <td colspan="2" valign="top" class="lsLoginTd" style="padding-right: 40px;">
                                            <asp:Label ID="c_labelPassword1" CssClass="litText" AssociatedControlID="c_textPassword1_value" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="c_textPassword1_value" runat="server" CssClass="lsTextBoxValueFullWidth"
                                                TextMode="Password" style="display: none;"></asp:TextBox>
                                            <asp:TextBox ID="c_textPassword1_text" runat="server" CssClass="lsTextBoxInfoFullWidth"
                                                onFocus="TextBoxPassword1OnFocus();"></asp:TextBox>
                                        </td>

                                    </tr>
                                    <tr>
                                       <td colspan="2" valign="top" class="lsLoginTd" style="padding-right: 40px;">
                                            <asp:Label ID="c_labelPassword2" CssClass="litText" AssociatedControlID="c_textPassword2_value" runat="server"></asp:Label><br />
                                             <asp:TextBox ID="c_textPassword2_value" runat="server" CssClass="lsTextBoxValueFullWidth"
                                                TextMode="Password" style="display: none;"></asp:TextBox>
                                            <asp:TextBox ID="c_textPassword2_text" runat="server" CssClass="lsTextBoxInfoFullWidth"
                                               onFocus="TextBoxPassword2OnFocus();"></asp:TextBox>
                                        </td>
                                    </tr>
                                    <tr id="tr_changePasswordError" runat="server" visible="false">
                                        <td colspan="2" class="lsLoginTd litErrorMsg">
                                            <img src="images/transparent.gif" style="vertical-align: middle;" class="litIconError"
                                                alt="" /><asp:Label ID="c_labelErrorChangePassword" runat="server" CssClass="error"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td align="right" class="lsLoginTd" style="width: 90%;">
                                            <a href="javascript:document.getElementById('<%=c_buttonForgotPassword.ClientID %>').click();"  visible="false" runat="server"><Foundation:SystemString ID="SystemString1" CssClass="litText" Name="ForgotPasswordButton" runat="server"/></a>                                            
                                        </td>
                                        <td align="right" class="lsLoginTd" style="padding-top: 20px;">
                                            <asp:Button ID="c_buttonChangePassword" OnClick="c_buttonChangePassword_Click" CssClass="litInputButton"
                                                runat="server" style="width: auto;"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="litLoginCopyright" style="padding: 5px; padding-top: 10px;
                                            padding-bottom: 0px;">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="changedPasswordPanel" Visible="false">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litLoginBgMiddle">
                                    <tr>
                                        <td valign="top" class="lsLoginTd" colspan="2">
                                            <asp:Label ID="c_labelChangedPasswordInfo" CssClass="litText" runat="server"></asp:Label><br />
                                        </td>
                                   </tr>
                                   <tr >
                                        <td colspan="2" align="right" class="lsLoginTd">                                            
                                            <asp:Button ID="c_buttonChangedPassword" OnClick="c_buttonChangedPassword_Click" CssClass="litInputButton"
                                                runat="server"/>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="litLoginCopyright" style="padding: 30px; padding-top: 10px;
                                            padding-bottom: 0px;">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            
                            
                           <asp:Panel runat="server" ID="forgotPasswordPanel" Visible="false">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litLoginBgMiddle">
                                   <tr>
                                        <td colspan="2" valign="top" class="lsLoginTd" style="padding-right: 40px;">
                                            <asp:Label ID="Label2" CssClass="litText" AssociatedControlID="c_textPassword1_value" runat="server"></asp:Label><br />
                                            <asp:TextBox ID="c_textBoxFPLoginName_value" runat="server" CssClass="lsTextBoxValueFullWidth"
                                                style="display: none;"></asp:TextBox>
                                            <asp:TextBox ID="c_textBoxFPLoginName_text" runat="server" CssClass="lsTextBoxInfoFullWidth"
                                                onFocus="TextBoxLoginFPNameOnFocus();"></asp:TextBox>                                               
                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" valign="top" class="lsLoginTd">
                                            <Foundation:SystemString ID="PasswordCouldSent" CssClass="litText" Name="PasswordCouldSent" runat="server" Visible="false"/>                                            
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" valign="top" class="lsLoginTd">                                            
                                            <Foundation:SystemString ID="PleaseTryAgain" CssClass="litText" Name="PleaseTryAgain" runat="server" Visible="false"/>
                                        </td>
                                    </tr>
                                    <tr >
                                        <td colspan="2" align="right" class="lsLoginTd" style="padding-top: 40px;">
                                            <asp:Button ID="c_buttonForgotPasswordSend" OnClick="c_buttonForgotPasswordSend_Click" CssClass="litInputButton"
                                                runat="server" style="width: auto;"></asp:Button>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td colspan="2" class="litLoginCopyright" style="padding: 5px; padding-top: 10px;
                                            padding-bottom: 0px;">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Panel runat="server" ID="forgotPasswordInfoPanel" Visible="false">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litLoginBgMiddle">
                                    <tr>
                                        <td valign="top" class="lsLoginTd" colspan="2">
                                            <Foundation:SystemString ID="PasswordHasBeenSent" CssClass="litText" Name="PasswordHasBeenSent" runat="server" /><br />
                                        </td>
                                   </tr>
                                    <tr>
                                        <td colspan="2" class="litLoginCopyright" style="padding: 30px; padding-top: 10px;
                                            padding-bottom: 0px;">
                                            
                                        </td>
                                    </tr>
                                </table>
                            </asp:Panel>
                            <asp:Button   ID="c_buttonForgotPassword"  OnClick="c_buttonForgotPassword_Click" runat="server"  style="display:none;"/>
                        </td>
                        <td style="width: 9px; background-image: url(images/box_right_bg.gif);">
                        </td>
                    </tr>
                    <tr>
                        <td style="width: 9px;"><img src="images/box_left_bottom.gif" width="9" height="3" alt="" /></td>
                        <td style="width: 308px;" class="litLoginBgBottom"></td>
                        <td style="width: 9px;"><img src="images/box_right_bottom.gif" width="9" height="3" alt="" /></td>
                    </tr>
                    <tr>
                        <td colspan="3"><img src="images/login_bottom.gif" width="326" height="10" alt="" /></td>
                    </tr>
                    <tr>
                        <td style="width: 9px;">
                        </td>
                        <td style="width: 308px;" align="center">
                            <img src="images/logga_studio_bottom.png" alt="" />                          
                        </td>
                        <td style="width: 9px;">
                        </td>
                    </tr>
                </table>
            </td>
        </tr>
        <tr>
            <td style="height: 40%;">
            </td>
        </tr>
    </table>
    <asp:HiddenField id="c_screenResolution" runat="server"/> 
    <script type="text/javascript">
        var screenResolution = document.getElementById('c_screenResolution');
        if (screenResolution)
            screenResolution.value = screen.width + 'x' + screen.height;
            document.onkeypress = function(e){
                var key=(window.event)?window.event.keyCode:e.keyCode;
                if(key==27) window.location.href='../';
            }
    </script>

    </form>
</body>
</html>
