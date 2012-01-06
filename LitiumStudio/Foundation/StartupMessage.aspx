<%@ page language="c#" enablesessionstate="True" autoeventwireup="true" inherits="LitiumStudio_Foundation_StartupMessage, Litum.Studio.Web" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Foundation.css")%>" />
        <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl("~/LitiumStudio/StyleSheets/Position.css")%>" />
	    <link rel="stylesheet" type="text/css" href="<%=Page.ResolveUrl(FoundationContext.SkinPath + "/Skin.css")%>" />
    <title>Litium Studio</title>
</head>
<body>
    <form id="Form1" method="post" runat="server" style="height: 100%">
        <table cellpadding="0" cellspacing="0" border="0" style="margin: auto; height: 100%;" id="c_table" runat="server">
            <tr>
                <td style="height: 20%;"></td>
            </tr>
            <tr>
                <td valign="middle" align="center">
                    <table cellpadding="0" cellspacing="0" border="0" width="326">
                        <tr>
                            <td colspan="3" style="height: 10px;"><img src="../images/login_top.gif" width="326" height="10" alt="" /></td>
                        </tr>
                        <tr>
                            <td style="width: 9px; height: 3px;"><img src="../images/box_left_top.gif" width="9" height="3" alt="" /></td>
                            <td style="width: 308px; height: 3px;" class="litLoginBgTop"><img src="../images/transparent.gif" alt="" height="1" width="1" /></td>
                            <td style="width: 9px; height: 3px;"><img src="../images/box_right_top.gif" width="9" height="3" alt="" /></td>
                        </tr>
                        <tr>
                            <td style="width: 9px; background-image: url(../images/box_left_bg.gif);"></td>
                            <td style="width: 308px;" align="left">
                                <table cellpadding="0" cellspacing="0" border="0" width="100%">
                                    <tr>
                                        <td class="litLoginBgTop" style="padding: 5px; padding-left: 10px; padding-bottom: 6px;">
                                            <img src="../images/logga_studio.png" width="104" height="44" alt="" />
                                        </td>
                                    </tr>
                                </table>
                                <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litLoginBg">
                                    <tr>
                                        <td valign="top" style="padding: 5px; padding-bottom: 15px;" class="litText">
                                            <asp:Label ID="c_labelApplicationRestarted" runat="server"></asp:Label>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="padding: 5px;" class="litText">
                                            <asp:HyperLink runat="server" ID="c_linkOriginalUrl" NavigateUrl="~/" />
                                        </td>
                                    </tr>
                                    <tr>
                                        <td valign="top" style="padding: 5px;" class="litText">
                                            <asp:HyperLink runat="server" ID="c_linkStartPage" NavigateUrl="~/" />
                                        </td>
                                    </tr>
                                </table>
                            </td>
                            <td style="width: 9px; background-image: url(../images/box_right_bg.gif);"></td>
                        </tr>
                        <tr>
                            <td style="width: 9px;"><img src="../images/box_left_bottom.gif" width="9" height="3" alt="" /></td>
                            <td style="width: 308px;" class="litLoginBgBottom"></td>
                            <td style="width: 9px;"><img src="../images/box_right_bottom.gif" width="9" height="3" alt="" /></td>
                        </tr>
                        <tr>
                            <td colspan="3"><img src="../images/login_bottom.gif" width="326" height="10" alt="" /></td>
                        </tr>
                    </table>
                </td>
            </tr>
            <tr>
                <td style="height: 40%;">
                </td>
            </tr>
        </table>
    </form>
</body>
</html>
