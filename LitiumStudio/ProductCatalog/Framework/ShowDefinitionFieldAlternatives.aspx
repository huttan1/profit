<%@ page language="C#" autoeventwireup="true" inherits="Modules_PC_ShowDefinitionFieldAlternatives, Litum.Studio.Web" %>
<%@ Register TagPrefix="MediaArchive" Namespace="Litium.Foundation.Modules.MediaArchive.WebControls.AdminTreeView"  Assembly="Litium.Studio.WebControls"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" style="overflow-y:hidden;">
    <head>
        <title><Foundation:ModuleString Name="MediaArchive" runat="server"/></title>
        <link href="<%=Page.ResolveUrl("~/LitiumStudio/ProductCatalog/Styles/ProductCatalog.css")%>" type="text/css" rel="stylesheet" />
    </head>
    <body class="litModalPopupBody">
        <form id="Form1" method="post" runat="server">
            <div style="border: 1px solid #A19E98; height:410px; padding:5px; background-color:#FFFFFF; margin:10px; overflow:auto;">
                <asp:Repeater runat="server" ID="repeaterAlternatives" OnItemDataBound="repeaterAlternatives_ItemDataBound">
                    <HeaderTemplate>
                        <table cellpadding="3" cellspacing="0" border="0" style="width:500px;">
                            <tr>
                                <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString1" Name="Alternative" Runat="server"/></th>
                            </tr>
                    </HeaderTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="litListContent"><%#DataBinder.Eval(Container.DataItem, "Value")%><asp:Label runat="server" ID="labelStandard" /></td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
                </asp:Repeater>
            </div>
        </form>
    </body>
</html>