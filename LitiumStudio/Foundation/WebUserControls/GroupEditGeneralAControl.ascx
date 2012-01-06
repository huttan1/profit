<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Foundation_WebUserControl_GroupEditGeneralAControl, Litum.Studio.Web" %>
<%@ Register TagPrefix="FoundationWeb" Namespace="Litium.Studio.UI.Foundation.Common.WebControls" Assembly="Litium.Studio.UI"%>
<div class="lsTabContent">
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
	        <td style="width:50px;" class="litBoldText"><Foundation:SystemString Name="Active" runat="server" ID="Systemstring2"/>:</td>
	        <td style="width:50px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="GroupStatus" id="c_radioButtonEnabled" runat="server"/><Foundation:SystemString Name="Yes" runat="server" ID="Systemstring6"/></td>
	        <td style="width:100px;" class="litText"><asp:RadioButton CssClass="litInputRadio" GroupName="GroupStatus" id="c_radioButtonDisabled" runat="server"/><Foundation:SystemString Name="No" runat="server" ID="Systemstring7"/></td>
        </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
	        <td colspan="2" class="litBoldText"><Foundation:SystemString Name="GroupName" runat="server" ID="Systemstring3"/><img src="../images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" />:</td>
        </tr>
        <tr>
	        <td><asp:TextBox cssclass="litInputText200" id="c_textBoxGroupName" runat="server"/></td>
	        <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorGroupName" runat="server" ControlToValidate="c_textBoxGroupName" OnServerValidate="ValidateGroupName" cssClass="error"/></td>
        </tr>
    </table><br />
    <table border="0" cellspacing="0" cellpadding="0">
        <tr>
	        <td colspan="2" class="litBoldText"><Foundation:SystemString Name="Description" runat="server" ID="Systemstring4"/>:</td>
        </tr>
        <tr>
	        <td><asp:TextBox cssclass="litInputTextArea" id="c_textBoxGroupDisplayName" Rows="5" TextMode="MultiLine" runat="server"/></td>
	        <td style="padding-left:10px;" class="litErrorMsg"><FoundationWeb:LitCustomValidator ID="c_validatorGroupDisplayName" runat="server" ControlToValidate="c_textBoxGroupDisplayName" OnServerValidate="ValidateGroupDisplayName" cssClass="error"/></td>
        </tr>
    </table>
</div>
