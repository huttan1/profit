<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_ReportFilter, Litum.Studio.Web" %>
<%@ Import Namespace="Litium.Studio.UI.ECommerce.Common.Constants"%>
<asp:Repeater runat="server" ID="c_reportList" >
    <HeaderTemplate>
        <div class="litLeftMenu" id="litSplitterLeftMenu" style="height: auto;width: 100px;">
            <div class="litBoldHeader">
                <Foundation:ModuleString runat="server" Name="ReportHeadlineList" />
            </div>
    </HeaderTemplate>
    <ItemTemplate>
        <div style="padding-top: 1px; padding-left: 5px; width: auto;" class="LeftLink">
            <a href="<%#string.Format("{0}?{1}={2}&{3}={4}", "Reports.aspx", Litium.Studio.UI.ECommerce.Common.Constants.ParameterConstants.ECOM_SELECTED_NAVBAR_PAGE, ((int)Litium.Studio.UI.ECommerce.Common.Enums.FilterType.Reports), Litium.Studio.UI.ECommerce.Common.Constants.ParameterConstants.REPORT_ID, Eval("ID")) %>" class="">
                <%#((Litium.Foundation.Modules.ECommerce.Reports.Report)DataBinder.GetDataItem(Container)).GetName(FoundationContext.Language) %></a>
        </div>
    </ItemTemplate>
    <FooterTemplate>
        </div>
    </FooterTemplate>
</asp:Repeater>
