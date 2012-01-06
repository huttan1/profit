<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_General, Litum.Studio.Web" %>

<div class="lsTabContent">
<asp:Panel runat="server" ID="c_panelGeneral" Style="float: left; padding-top: 0px;">
    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringOrderDate" Name="OrderDate" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredOrderDate" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
    <table border="0" cellpadding="0" cellspacing="0">
        <tr>
            <td>
                <div>
                    <table cellpadding="0" cellspacing="0" border="0" width="100%" class="litInputTable">
                        <tr>
                            <td>
								<LS:DateTimeHelper runat="server" ID="radDatehelper" AssociatedControlID="c_calendarOrderDate" />
								<Telerik:RadDateTimePicker runat="server" ID="c_calendarOrderDate" Enabled="false" />
                            </td>
                        </tr>
                    </table>
                </div>
            </td>            
        </tr>
    </table>
	<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringCurrency" Name="Currency" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredCurrency" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	<asp:DropDownList id="c_dropDownListCurrency" runat="server" Width = "115px"/>
	<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringComment" Name="Comment" Runat="server"/><img src="~/LitiumStudio/ECommerce/Images/transparent.gif" visible = "false" runat="server" id="c_imageRequiredComment" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
	<asp:TextBox runat="server" ID="c_textBoxComment" onkeypress = "ValidateCommentLength()" TextMode="MultiLine" Width = "300px" Height = "50px"></asp:TextBox>
	<asp:RequiredFieldValidator Display="Dynamic" Enabled = "false" ID="c_validatorComments" ControlToValidate="c_textBoxComment" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
	<%--<asp:RegularExpressionValidator ID="c_validatorCommentLength" ControlToValidate="c_textBoxComment" ErrorMessage="*" ValidationExpression="^[\s\S]{0,20}$" runat="server" />--%>
	<div class="litBoldHeader"><Foundation:ModuleString ID="ModuleStringVoucherCode" Name="VoucherCode" Runat="server"/>:</div>
	<asp:TextBox CssClass="litInputText200" runat="server"  MaxLength = "200" ID="c_textBoxVoucherCode"></asp:TextBox>
</asp:Panel>
</div>