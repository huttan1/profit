<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControl_GroupEditGeneralBControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
    <table border="0" cellspacing="0" cellpadding="0">
	    <tr>
		    <td style="width:50px;" class="litBoldText"><Foundation:SystemString Name="Active" runat="server" ID="Systemstring2"/>:</td>
		    <td style="width:50px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="GroupStatus" id="c_radioButtonEnabled" runat="server"/><Foundation:SystemString Name="Yes" runat="server" ID="Systemstring6"/></td>
		    <td style="width:100px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="GroupStatus" id="c_radioButtonDisabled" runat="server"/><Foundation:SystemString Name="No" runat="server" ID="Systemstring7"/></td>
	    </tr>
    </table>
</div>
