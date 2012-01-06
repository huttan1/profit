<%@ page language="C#" masterpagefile="~/LitiumStudio/Relations/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_Relations_Add3, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Relations/Framework/Base.master" %>


<%@ Register TagPrefix="FieldDefinition" Namespace="Litium.Studio.UI.Relations.FieldTemplates.WebControls" Assembly="Litium.Studio.UI"%>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>
<%@ Register TagPrefix="uc2" TagName="AddressInformation" Src="WebUserControl/AddressInformation.ascx"%>
    
<asp:Content ID="Content2" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="0" id="c_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
        <toolbar:DividerItem ID="DividerItem2" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
		<toolbar:ToolbarItem OnClick="ToolbarItemPrevious_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemPrevious" runat="server"/>
	    <toolbar:DividerItem ID="DividerItem1" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
   	    <toolbar:ToolbarItem OnClick="ToolbarItemNext_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowRight" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemNext" runat="server"/>
        <toolbar:DividerItem ID="DividerItem3" ImageURL="images/transparent.gif" Class="litToolbarSpace" runat="server" />
   	    <toolbar:ToolbarItem OnClick="ToolbarItemSave_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemSave" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
         <img src="Images/transparent.gif" alt="" runat="server" id="c_imageHeaderIcon" /><asp:Label runat="server" ID="c_labelAddPageHeader" /><span class="litTextNormalWeight">&nbsp;(<asp:Label runat="server" ID="c_labelAddPageSubHeader" />)</span>
</asp:Content>
<asp:Content ID="Content1" ContentPlaceHolderID="ContentRight" Runat="Server">
	
	<script type="text/javascript">
		var billingAddress = '<%= c_billingAddressInformation.ClientID %>' + '_c_comboBoxLanguage';
		var deliveryAddress = '<%= c_deliveryAddressInformation.ClientID %>' + '_c_comboBoxLanguage';

		function setTopPossitionCollapse() {
			if (navigator.userAgent.indexOf("MSIE") == -1 && navigator.userAgent.indexOf("Chrome") == -1) {
				setTopPossition();
			}
		}

		function setTopPossition() {
			var addressDiv = document.getElementById('person_address');

			var comboBoxBilling = document.getElementById(billingAddress);
			var comboBoxDataBilling = document.getElementById(billingAddress + '_DropDown');

			var comboBoxDelivery = document.getElementById(deliveryAddress);
			var comboBoxDataDelivery = document.getElementById(deliveryAddress + '_DropDown');

			var posTop;

			if (comboBoxDataBilling.clientHeight >= comboBoxDataDelivery.clientHeight) {
				posTop = findPos(comboBoxBilling)[1] + comboBoxDataBilling.clientHeight;
			}
			else {
				posTop = findPos(comboBoxDelivery)[1] + comboBoxDataDelivery.clientHeight;
			}

			addressDiv.scrollTop = 0;
			addressDiv.scrollTop = posTop;
		}

		function ComboBoxScroll(obj) {
			var addressDiv = obj;

			var comboBox = document.getElementById(billingAddress);
			var comboBoxData = document.getElementById(billingAddress + '_DropDown');
			setTopAfterScroll(addressDiv, comboBox, comboBoxData);

			comboBox = document.getElementById(deliveryAddress);
			comboBoxData = document.getElementById(deliveryAddress + '_DropDown');
			setTopAfterScroll(addressDiv, comboBox, comboBoxData);
		}

		function setTopAfterScroll(addressDiv, comboBox, comboBoxData) {
			var divTop = addressDiv.scrollTop;
			var comboBoxTop = findPos(comboBox)[1];
			var mainTop = comboBoxTop - divTop + comboBox.offsetHeight;

			comboBoxData.style.top = mainTop + 'px';
		}

		function findPos(obj) {
			var curleft = curtop = 0;
			if (obj.offsetParent) {
				do {
					curleft += obj.offsetLeft;
					curtop += obj.offsetTop;
				}
				while (obj = obj.offsetParent);
			}
			return [curleft, curtop];
		}
		////////////////////////
		function ComboBox1_onLoad(sender, e) {
			sender._OriginalExpand = sender.Expand;
			sender.Expand = function() {
				FixCAExpandPosition(this);
				this._OriginalExpand();
			};
		}
		function FixCAExpandPosition(sender) {
			var point = GetScrollOffsetPosition(document.getElementById(sender.Id));
			sender.DropDownOffsetX = -point.x;
			sender.DropDownOffsetY = -point.y;
		}
		function Point(x, y) {
			this.x = x;
			this.y = y;
		}

		function GetScrollOffsetPosition(obj, position) {
			if (!position) { var position = new Point(0, 0); }

			if (obj.scrollLeft)
				position.x += obj.scrollLeft;
			if (obj.scrollTop)
				position.y += obj.scrollTop;

			if (navigator.appVersion.indexOf("MSIE") < 0 || navigator.appVersion.indexOf("MSIE 8") > 0) {
				if (obj.parentNode) {
					return GetScrollOffsetPosition(obj.parentNode, position);
				}
				else {
					return position;
				}
			}
			else {

				if (obj.offsetParent) {
					return GetScrollOffsetPosition(obj.offsetParent, position);
				}
				else {
					return position;
				}
			}
		}
		/////////////////////
	</script>
    <div class="lsContentScroll" id="person_address" onscroll="ComboBoxScroll(this)">
        <div class="litDescriptionText"><asp:Label ID="c_labelPageDescription" runat="server" /></div>
        <FieldDefinition:FieldDefinitionListControl id="c_fieldDefinitionList" runat="server">
            <StringFieldDefinitionTemplate>
                <FieldDefinition:StringFieldDefinitionControl ID="StringFieldDefinitionControl1" runat="server" >
                    <StringFieldDefinitionItemTemplate>
                        <div style="margin-top:15px;">
                            <span class="litText"><strong><asp:Label ID="labelTextBoxFieldDefinition" Runat="server"/></strong><asp:Label id="labelTextBoxFieldDefinitionMandatory" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label> <asp:Label id="labelTextBoxFieldDefinitionInputValue" runat="server"/> <asp:Label id="labelTextBoxFieldDefinitionNoValue" runat="server"/><br /></span>
                            <asp:TextBox cssclass="litInputText" Visible="False" ID="textBoxFieldDefinition" Runat="server"/>
                            <asp:DropDownList cssclass="litInputSelect" style="width:auto;" Visible="False" ID="dropDownListTextBoxFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryTextBoxFieldDefinition" Display="Dynamic" runat="server"/>
                        </div>
                    </StringFieldDefinitionItemTemplate>
                </FieldDefinition:StringFieldDefinitionControl>
            </StringFieldDefinitionTemplate>
            <NumberFieldDefinitionTemplate>
                <FieldDefinition:NumberFieldDefinitionControl ID="NumberFieldDefinitionControl1"  runat="server" >
                    <NumberFieldDefinitionItemTemplate>
                        <div style="margin-top:15px;">
                            <span class="litText"><strong><asp:Label ID="labelTextBoxFieldDefinition" Runat="server"/></strong><asp:Label id="labelTextBoxFieldDefinitionMandatory" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label> <asp:Label id="labelTextBoxFieldDefinitionInputValue" runat="server"/> <asp:Label id="labelTextBoxFieldDefinitionNoValue" runat="server"/><br /></span>
                            <asp:TextBox cssclass="litInputText" Visible="False" ID="textBoxFieldDefinition" Runat="server"/>
                            <asp:DropDownList cssclass="litInputSelect" style="width:auto;" Visible="False" ID="dropDownListTextBoxFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryTextBoxFieldDefinition" Display="Dynamic" runat="server"/>
                        </div>
                    </NumberFieldDefinitionItemTemplate>
                </FieldDefinition:NumberFieldDefinitionControl>
            </NumberFieldDefinitionTemplate>
            <FileFieldDefinitionTemplate>
                <FieldDefinition:FileFieldDefinitionControl ID="FileFieldDefinitionControl1" runat="server" >
                    <FileFieldDefinitionItemTemplate>
                        <div style="margin-top:15px;">
                            <span class="litText"><strong><asp:Label ID="labelUploadFieldDefinition" Runat="server"/></strong><asp:Label id="labelUploadFieldDefinitionMandatory" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label> <asp:Panel ID="panelFileUploadFieldDefinitionInputValue" Runat="server"><asp:HyperLink id="hyperLinkFileUploadFieldDefinitionInputValue" runat="server" CssClass="litText"/></asp:Panel> <asp:Label id="labelUploadFieldDefinitionNoValue" runat="server"/><br /></span>
                            <input type="file" class="litInputFile" id="inputFileUpload" runat="server"/>
                             <div runat="server" id="panelMediaArchiveFiles" visible="false" style="clear:both;">
                                <input type="text" runat="server" readonly="readonly" id="textBoxMediaArchiveFileDispName" class="litInputText100" style="width:276px;"/>
                                <input type="button" runat="server" id="buttonFromMediaArchive" class="litInputText" style="width:auto;margin-left:-2px;" visible="true" />
                                <input type="hidden" runat="server" id="inputHiddenMediaArchiveFileID"/>
                                <input type="hidden"  runat="server" id="inputHiddenMediaArchiveFileVersionID"/>
                            </div>
                            <asp:Checkbox runat="server" id="checkBoxUploadFieldDefinition" CssClass="litText" visible="false" /> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryUploadFieldDefinition" Display="Dynamic" runat="server"/>
                            <asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString5" Name="WarningFileFromMediaArchive1" runat="server"/></div></asp:Panel>
                        </div>
                    </FileFieldDefinitionItemTemplate>
                </FieldDefinition:FileFieldDefinitionControl>
            </FileFieldDefinitionTemplate>
            <ImageFieldDefinitionTemplate>
                <FieldDefinition:ImageFieldDefinitionControl ID="FileFieldDefinitionControl1" runat="server" >
                    <ImageFieldDefinitionItemTemplate>
                        <div style="margin-top:15px;">
                            <div class="litBoldHeader"><asp:Label ID="labelUploadFieldDefinition" Runat="server"/><asp:Label id="labelUploadFieldDefinitionMandatory" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                            <asp:panel runat="server" id="panelImageUploadFieldDefinitionInputValue" style="text-align:center; float:left;">
                                <div style="margin-right:10px; border:1px solid #7F9DB9; padding:5px; background-color:white; float:left;"><img runat="server" id="imgUploadFieldDefinitionInputValue" /></div><div style="clear:both;"></div>
				                <div class="litText" style="margin-top:2px;"><asp:Label runat="server" ID="c_labelImageDescription" /> <a href="#" id="c_linkDownloadImage" runat="server"><img src="Images/transparent.gif" style="vertical-align:middle; border:none;" class="litIconDownload" alt="<Foundation:ModuleString Name=DownloadImage runat=Server />" title="<Foundation:ModuleString Name=DownloadImage runat=Server />" /></a></div>
                            </asp:panel>
                            <asp:Label id="labelUploadFieldDefinitionNoValue" runat="server" CssClass="litText"/>
                            <div style="float:left;">
                                <div><input type="file" class="litInputFile" id="inputFileUpload" runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryUploadFieldDefinition" Display="Dynamic" CssClass="litErrorMsg" runat="server"/></div>
                                 <div runat="server" id="panelMediaArchiveFiles" visible="false" style="clear:both;">
                                    <input type="text" runat="server" readonly="readonly" id="textBoxMediaArchiveFileDispName" class="litInputText100" style="width:276px;"/>
                                    <input type="button" runat="server" id="buttonFromMediaArchive" class="litInputText" style="width:auto;margin-left:-2px;" visible="true" />
                                    <input type="hidden" runat="server" id="inputHiddenMediaArchiveFileID"/>
                                    <input type="hidden"  runat="server" id="inputHiddenMediaArchiveFileVersionID"/>
                                </div>
                                <div><asp:Checkbox runat="server" id="checkBoxUploadFieldDefinition" CssClass="litText" visible="false" /></div>
                                <asp:Panel id="panelMediaArchiveMessage1" style="display:none" runat="server"><div class="litText"><img src="<%= Page.ResolveUrl("~/LitiumStudio/CMS/Images/transparent.gif")%>" style="vertical-align:middle;" alt="" class="litIconWarning" /><Foundation:ModuleString ID="ModuleString5" Name="WarningFileFromMediaArchive1" runat="server"/></div></asp:Panel>
                            </div>
                            <div style="clear:both;"></div>
                        </div>
                    </ImageFieldDefinitionItemTemplate>
                </FieldDefinition:ImageFieldDefinitionControl>
            </ImageFieldDefinitionTemplate>
            <BooleanFieldDefinitionTemplate>
                <FieldDefinition:BooleanFieldDefinitionControl ID="StringFieldDefinitionControl1" runat="server" >
                    <BooleanFieldDefinitionItemTemplate>
                        <div class="litBoldHeader"><asp:Label ID="labelBooleanFieldDefinition" Runat="server"/></div>
                        <div><asp:Label id="labelBooleanFieldDefinitionInputValue" visible="false" runat="server"/> <asp:Label id="labelBooleanFieldDefinitionNoValue" visible="false" runat="server"/><asp:Label id="labelBooleanFieldDefinitionMandatory" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                        <asp:CheckBox cssclass="litText" Visible="False" ID="checkboxBooleanDefinitionValue" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryBooleanFieldDefinition" Display="Dynamic" runat="server"/>
                    </BooleanFieldDefinitionItemTemplate>
                </FieldDefinition:BooleanFieldDefinitionControl>
            </BooleanFieldDefinitionTemplate>      
            <DateTimeFieldDefinitionTemplate>
                <FieldDefinition:DateTimeFieldDefinitionControl ID="StringFieldDefinitionControl1" runat="server" >
                    <DateTimeFieldDefinitionItemTemplate>
                        <div style="margin-top:15px;">
                            <span class="litText"><strong><asp:Label ID="labelDateTimeFieldDefinition" Runat="server"/></strong><asp:Label id="labelDateTimeFieldDefinitionMandatory" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label> <asp:Label ID="labelTextField" Runat="server"/> <asp:Label id="labelDateTimeFieldDefinitionInputValue" runat="server"/> <asp:Label id="labelDateTimeFieldDefinitionNoValue" runat="server"/><br /></span>
                            <table cellspacing="0" cellpadding="0" border="0" id="tableDateTimeDefinitionValue" runat="server" visible="false">
                                <tr>
                                    <td><LS:DateTimeHelper ID="dateTimeHelper" runat="server" AssociatedControlID="radPickerDate" />
							<Telerik:RadDatePicker runat="server" ID="radPickerDate" Visible="false" />
							</td>
                                    <td style="font-size:10px;">&nbsp;</td>
                                    <td>&nbsp;</td>
                                </tr>
                            </table>
                            <asp:DropDownList CssClass="litInputSelect" ID="dropDownListDateTimeFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryDateTimeFieldDefinition" Display="Dynamic" runat="server"/>
                        </div>
                    </DateTimeFieldDefinitionItemTemplate>
                </FieldDefinition:DateTimeFieldDefinitionControl>
            </DateTimeFieldDefinitionTemplate>
            <MultiSelectFieldDefinitionTemplate>
                <FieldDefinition:MultiSelectFieldDefinitionControl ID="MultiSelectFieldDefinitionControl1" runat="server" >
                      <MultiSelectFieldDefinitionItemTemplate>
                        <div class="litBoldHeader"><asp:Label ID="labelMultiSelectFieldDefinition" Runat="server"/><asp:Label id="labelMultiSelectFieldDefinitionMandatory" runat="server"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt="" /></asp:Label></div>
                        <asp:CheckBoxList cssclass="litInputSelect" style="width:auto;" Visible="False" ID="checkboxListMultiSelectFieldDefinition" Runat="server"/> <asp:CustomValidator SetFocusOnError="true" id="validatorMandatoryMultiSelectFieldDefinition" Display="Dynamic" runat="server"/>
                    </MultiSelectFieldDefinitionItemTemplate>
                </FieldDefinition:MultiSelectFieldDefinitionControl>
            </MultiSelectFieldDefinitionTemplate>
        </FieldDefinition:FieldDefinitionListControl>
        <br />
        <div style="float: left; width: 250px;" runat="server" id="c_billingPanel">
            <uc2:AddressInformation ID="c_billingAddressInformation" runat="server" />
        </div>
        <div style="float: left; width: 250px;" runat="server" id="c_deliveryPanel">
            <uc2:AddressInformation ID="c_deliveryAddressInformation" runat="server" />
        </div>
        <div style="clear: both;"></div>
    </div>
    <MediaArchive:MediaArchiveDialog id="mediabankdialog" runat="server"/>
</asp:Content>