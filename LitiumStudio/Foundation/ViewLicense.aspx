<%@ page language="C#" masterpagefile="~/LitiumStudio/Framework/ControlPanel.master" autoeventwireup="true" inherits="LitiumStudio_Foundation_ViewLicense, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Foundation"%>
<%@ Register assembly="Litum.Studio.Web"  TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" %>


<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="../Images/transparent.gif" class="litIconLicense" style="vertical-align:middle;" alt="" /><Foundation:SystemString runat="server" Name="License" />
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
    <!--Innehåll-->
    <div class="lsContentScroll">
        <asp:DataList ID="c_dataListModules" runat="server" RepeatColumns="2" OnItemDataBound="c_dataListModules_ItemDataBound">
            <HeaderTemplate>
                <table border="0">
                    <tr>
                        <td valign="top"  style="padding-right: 15px; padding-bottom: 15px;">
                             <Foundation:InformationGroup ID="c_informationGroupLicenseAndInstallation" runat="server" Width="400px">   
                                <table>
                                    <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringLicenseId" Name="LicenseID" Runat="server"/>:
                                            <asp:Label ID="c_labelLicenseID" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                    <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringExpirationDate" Name="ExpirationDate" Runat="server"/>:
                                            <asp:Label ID="c_labelExpirationDate" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringProduct" Name="Product" Runat="server"/>:
                                            <asp:Label ID="c_labelProduct" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringProductVersion" Name="Version" Runat="server"/>:
                                            <asp:Label ID="c_labelProductVersion" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr id="spName" runat="server">
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="SystemString1" Name="ServicePackName" Runat="server"/>:
                                            <asp:Label ID="c_labelServicePackName" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr id="spReleaseDate" runat="server">
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringServicePackReleaseDate" Name="ServicePackReleaseDate" Runat="server"/>:
                                            <asp:Label ID="c_labelServicePackReleaseDate" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringInstallation" Name="Installation" Runat="server"/>:
                                            <asp:Label ID="c_labelInstallation" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringInstallationUrl" Name="InstallationUrl" Runat="server"/>:
                                            <asp:Label ID="c_labelInstallationUrl" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr id="hostingName" runat="server">
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringHostingPartner" Name="HostingPartner" Runat="server"/>:
                                            <asp:Label ID="c_labelHostingPartner" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringInstallationComments" Name="InstallationComments" Runat="server"/>:
                                            <asp:Label ID="c_labelInstallationComments" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                </table>
                             </Foundation:InformationGroup>
                        </td>
                        <td valign="top">
                            <Foundation:InformationGroup ID="c_informationGroupCustomerInformation" runat="server" Width="400px">   
                                <table>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringCustomerName" Name="CustomerName" Runat="server"/>:
                                            <asp:Label ID="c_labelCustomerName" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringContactPerson" Name="ContactPerson" Runat="server"/>:
                                            <asp:Label ID="c_labelContactPerson" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringEmail" Name="Email" Runat="server"/>:
                                            <asp:Label ID="c_labelEmail" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringPhone" Name="Phone" Runat="server"/>:
                                            <asp:Label ID="c_labelPhone" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                     <tr>
                                        <td>
                                            <div class="litBoldHeader"><Foundation:SystemString ID="c_systemStringPostalAddress" Name="PostalAddress" Runat="server"/>:
                                            <asp:Label ID="c_labelPostalAddress" runat="server"></asp:Label></div>
                                        </td>
                                    </tr>
                                </table>
                         </Foundation:InformationGroup>
                        </td>
                    </tr>
                </table>
            </HeaderTemplate>
            <ItemTemplate>
                <div id="c_divInformationGroup" runat="server" style="padding-bottom: 15px;padding-right: 15px;">
                <Foundation:InformationGroup ID="c_informationGroupPlaceHolder" runat="server" Width="400px" HeaderText='<%# DataBinder.Eval(Container.DataItem, "value") %>'>
                    <asp:HiddenField ID="c_hiddenFieldModuleName" runat="server" Value='<%# DataBinder.Eval(Container.DataItem, "key") %>'/>
                    <asp:Repeater ID="c_repeaterContent" runat="server">
                        <ItemTemplate>
                            <div class="litBoldHeader"><asp:Label runat="server" ID="c_labelKey" Text='<%# DataBinder.Eval(Container.DataItem, "key") %>'></asp:Label>:
                            <asp:Label ID="c_labelValue" runat="server" Text='<%# DataBinder.Eval(Container.DataItem, "value") %>'></asp:Label></div>
                        </ItemTemplate>
                    </asp:Repeater>
                </Foundation:InformationGroup>
                </div>
            </ItemTemplate>
            <ItemStyle VerticalAlign="Top"/>
        </asp:DataList>
    </div>
</asp:Content>

