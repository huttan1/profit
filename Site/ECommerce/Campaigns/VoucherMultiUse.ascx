<%@ Import Namespace="Litium.Foundation.GUI"%>
<%@ Import Namespace="Litium.Foundation.Modules.ECommerce"%>
<%@ Control Language="C#" AutoEventWireup="true" CodeFile="VoucherMultiUse.ascx.cs" Inherits="LitiumStudio_ECommerce_WebUserControls_Campaigns_VoucherMultiUse" %>
<script type="text/javascript">

  function deleteRow(rowId)
  {
    c_gridVoucherCodes.deleteItem(c_gridVoucherCodes.getItemFromClientId(rowId));
  }

</script>
<table border="0" cellspacing="0" cellpadding="15">
	<tr>
		<td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringExceedAmount" Name="CampaignUserControlExceedAmount" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredExceedAmount" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxExceedAmount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
		<asp:RangeValidator Display="Dynamic" ID="c_rangeValidatorExceedAmount" ControlToValidate="c_textBoxExceedAmount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator></td>
	</tr>
	<tr>
		<td>
			<div class="litBoldHeader"><asp:RadioButton ID="c_radioButtonAmountDiscount" runat="server" AutoPostBack="true" OnCheckedChanged="RadioButtonAmountDiscount_Clicked" /><Foundation:ModuleString ID="m_moduleStringAmountDiscount" Name="CampaignUserControlAmountDiscount" runat="server" />
			<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredPayForQuantity" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
			<asp:TextBox ID="c_textBoxAmountDiscount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
			<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorAmountDiscount" ControlToValidate="c_textBoxAmountDiscount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
			<asp:RangeValidator Display="Dynamic"  ID="c_rangeValidatorAmountDiscount" ControlToValidate="c_textBoxAmountDiscount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator>

			<div class="litBoldHeader"><asp:RadioButton ID="c_radioButtonPercentageDiscount" runat="server" AutoPostBack="true" OnCheckedChanged="RadioButtonPercentageDiscount_Clicked" /><Foundation:ModuleString ID="m_moduleStringPercentageDiscount" Name="CampaignUserControlPercentageDiscount" runat="server" />
			<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imageRequiredPercentageDiscount" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
			<asp:TextBox ID="c_textBoxPercentageDiscount" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
			<asp:RequiredFieldValidator Display="Dynamic" ID="c_requiredFieldValidatorPercentageDiscount" ControlToValidate="c_textBoxPercentageDiscount" runat="server" ErrorMessage="*"></asp:RequiredFieldValidator>
			<asp:RangeValidator Display="Dynamic"  ID="c_rangeValidatorPercentageDiscount" ControlToValidate="c_textBoxPercentageDiscount" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="100"></asp:RangeValidator>			
		</td>
	</tr>
	<tr>
	    <td><div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringVoucherCode" Name="CampaignUserControlVoucherCode" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imgRequiredVoucherCode" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxVoucherCode" runat="server" MaxLength="9" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:CustomValidator ValidationGroup="VoucherCode" Display="Dynamic" ID="c_requiredFieldValidatorVoucherCode" runat="server" ErrorMessage="*"></asp:CustomValidator>
		<asp:CustomValidator ValidationGroup="VoucherCode" Display="Dynamic" ID="c_customValidatorVoucherCode" ControlToValidate="c_textBoxVoucherCode" OnServerValidate="VoucherCode_ServerValidate" runat="server" ErrorMessage="*"></asp:CustomValidator><br />
	    <div class="litBoldHeader"><Foundation:ModuleString ID="c_moduleStringFrequency" Name="CampaignUserControlFrequency" runat="server" />
		<img src="~/LitiumStudio/ECommerce/Images/transparent.gif" runat="server" id="c_imgRequiredFrequency" style="vertical-align:middle;" class="litIconRequired" alt="" />:</div>
		<asp:TextBox ID="c_textBoxFrequency" runat="server" MaxLength="5" CssClass="litInputText150"></asp:TextBox>&nbsp;
		<asp:CustomValidator ValidationGroup="VoucherCode" Display="Dynamic" ID="c_requiredFieldValidatorFrequency" runat="server" ErrorMessage="*"></asp:CustomValidator>
		<asp:RangeValidator ValidationGroup="VoucherCode" Display="Dynamic" ID="c_rangeValidatorFrequency" ControlToValidate="c_textBoxFrequency" runat="server" ErrorMessage="*" CultureInvariantValues="true" Type="Double" MinimumValue="0" MaximumValue="99999"></asp:RangeValidator><br /><asp:Button CssClass="litInputButton" ValidationGroup="VoucherCode" runat="server" ID="c_buttonAdd" OnClick="ButtonAdd_Click" /></td>
	</tr>
	<tr>
		<td>
            <ComponentArt:Grid id="c_gridVoucherCodes" runat="server"				
                CssClass="Grid"            
				EnableViewState="true"
				ShowHeader="False"
				ShowFooter="false"
				KeyboardEnabled="false"
				RunningMode="Client"
				ManualPaging="true"
				ImagesBaseUrl="images/"
				Width="100%" 
				IndentCellWidth="19"
                    >
                    <Levels>
                        <ComponentArt:GridLevel
                            DataKeyField="VoucherCodeID"
							ShowTableHeading="false"
							DataCellCssClass="DataCell" 
                            HeadingCellCssClass="HeadingCell" 
                            HeadingCellHoverCssClass="HeadingCellHover" 
                            HeadingCellActiveCssClass="HeadingCellActive" 
                            HeadingRowCssClass="HeadingRow" 
                            HeadingTextCssClass="HeadingCellText"
                            SelectedRowCssClass="Row"
                            RowCssClass="Row" 
                            HoverRowCssClass="HoverRow"
                            GroupHeadingCssClass="GroupHeading" 
							>
							<Columns>
								<ComponentArt:GridColumn AllowSorting="false" DataField="VoucherCodeID" Visible="false" />
								<ComponentArt:GridColumn AllowSorting="false" DataField="VoucherCode" />
								<ComponentArt:GridColumn AllowSorting="false" DataField="UsedCount" />
								<ComponentArt:GridColumn AllowSorting="false" DataCellClientTemplateId="EditTemplate" Width="50" Align="Center" />								
                            </Columns>
                        </ComponentArt:GridLevel>
                    </Levels>
					<ClientTemplates>
					  <ComponentArt:ClientTemplate Id="EditTemplate">
						<a href="javascript:deleteRow('## DataItem.ClientId ##')" class="litContentPager1" style="color: #0388D1;" >Delete</a>
					  </ComponentArt:ClientTemplate>
					</ClientTemplates>                    
                </ComponentArt:Grid>		
		</td>
	</tr>
</table>