<%@ page validaterequest="false" language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/Base.master" autoeventwireup="true" inherits="LitiumStudio_ProductCatalog_EditTranslateArticle, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/Base.master" %>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarRight" runat="server">
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconStop" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemCancel" OnClick="ToolbarItemCancel_Click" runat="server" />	
		<toolbar:DividerItem ImageURL="Images/transparent.gif" Class="litToolbarSpace" runat="server" ID="Divideritem2" />
		<toolbar:ToolbarItem DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconDiskBlue" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemSave" OnClick="ToolbarItemSave_Click" runat="server" />
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="LitiumStudioContentHeading" Runat="Server">
    <img src="Images/transparent.gif" class="litIconArticle" alt="" runat="server" id="imageIcon" />
    <asp:Label runat="server" ID="c_labelHeader" />
</asp:Content>

<asp:Content ID="Content4" ContentPlaceHolderID="ContentRight" runat="Server">
    <div class="lsContentScroll">
        <table cellpadding="15" cellspacing="0" border="0" class="litModuleContentWithTreeMainTabSizeV2" width="100%">
            <tr>
                <td valign="top">
                    <table cellpadding="0" cellspacing="0" border="0" width="100%">
                        <tr>
                            <td valign="top" style="width:50%;">
                                <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString1" Name="ShowInformationOnTheLanguage" Runat="server"/></div>
	                            <asp:ListBox Runat="server" ID="c_listBoxLanguage1" AutoPostBack="true" OnSelectedIndexChanged="ListBoxLanguage1_OnSelectedIndexChanged" SelectionMode="Single" Rows="1" CssClass="litInputText" style="width:97%;" />
		                        <hr style="margin-top:15px; width:97%;" align="left" />
                                <asp:Repeater id="repeaterProperties1" runat="server" OnItemDataBound="RepeaterProperties_OnItemDataBound" OnItemCommand="RepeaterProperties_RepeaterItemCommand">
                                    <ItemTemplate>
                                        <div style="clear:both;"></div>
                                        <div style="float:left;margin-top:15px;"><asp:Label runat="server" id="repeaterLabel" CssClass="litBoldText"/><asp:Label runat="server" id="repeaterLabelRequired" CssClass="litText" Visible="false"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequiredForPublishing" alt="" /></asp:Label></div>
                                        <asp:Label ID="Label1" runat="server" cssclass="litText" style="float:left; padding-left:10px; padding-top:13px;" />
                                        <div style="clear:both;"></div>
                                        <div style="float:left; width:100%;">
                                            <asp:HiddenField runat="server" id="templateFieldID" visible="false"/>
                                            <asp:HiddenField runat="server" id="languageID" visible="false"/>
                                            <asp:TextBox runat="server" id="textbox" cssclass="litInputText" style="width:96%;" visible="false" />
                                            <asp:DropDownList runat="server" id="dropDownList" cssClass="litInputSelect" style="width:98%;" Visible="false" />
                                            <asp:RadioButtonList id="trueFalse" runat="server" cssclass="litInputRadio" visible="false"/> 
                                            <asp:FileUpload runat="server" id="fileupload" cssclass="litInputFile" visible="false" style="float:left; width:98%;"/>
                                            <div runat="server" id="mediabankfiles" visible="false">
                                                <input type="text" runat="server" readonly="readonly" id="mediabankfiledispname" class="litInputText100" style="width:auto;"/>
                                                <input type="button" runat="server" id="mediabankbutton" disabled="disabled" class="litInputText" style="width:auto;" visible="true" />
                                                <input type="hidden" runat="server" id="mediabankfileid"/>
                                                <input type="hidden"  runat="server" id="mediabankversionid"/>
                                            </div>
                                            <asp:Image id="fileImage" runat="server" visible="false" style="vertical-align:middle; margin-top:4px;"/>
                                            <asp:HyperLink runat="server" id="fileLink" cssclass="litText" visible="false" style="margin-top:4px;"/><asp:label runat="server" id="fileText" cssclass="litText" visible="false"/>
                                            <asp:ImageButton visible="false" imageurl="Images/transparent.gif" runat="server" id="button" causesvalidation="False" cssclass="litIconDelete" borderwidth="0" style="vertical-align:middle;margin:0px; margin-top:4px;" />
                                            <ComponentArt:Calendar id="pickerDateTime" Visible="false" runat="server" />
                                            <img id="imageSetDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" /><img id="imageClearDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar_clear.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" />
                                            <ComponentArt:Calendar runat="server" id="calendarDateTime" visible="false" />
                                        </div>
                                        <asp:RegularExpressionValidator display="dynamic" SetFocusOnError="true" runat="server" visible="false" cssclass="litErrorMsg" enabled="false" id="regexpvalidator" style="float:left; padding-left:10px; padding-top:2px;"/>
                                        <%--<asp:RequiredFieldValidator display="dynamic" SetFocusOnError="true" runat="server" visible="false" cssclass="litErrorMsg" enabled="false" id="requiredvalidator" style="float:left; padding-left:10px; padding-top:2px;"/>--%>
                                    </ItemTemplate>
                                </asp:Repeater>
		                    </td>
		                    <td valign="top" style="padding-left:15px; width:50%;">
		                        <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString2" Name="EditInformationOnTheLanguage" Runat="server"/></div>
	                            <asp:ListBox Runat="server" ID="c_listBoxLanguage2" AutoPostBack="true" OnSelectedIndexChanged="ListBoxLanguage2_OnSelectedIndexChanged" SelectionMode="Single" Rows="1" CssClass="litInputText" style="width:97%;" />
		                        <hr style="margin-top:15px; width:97%;" align="left" />
		                        <asp:Repeater id="repeaterProperties2" runat="server" OnItemDataBound="RepeaterProperties_OnItemDataBound" OnItemCommand="RepeaterProperties_RepeaterItemCommand">
                                    <ItemTemplate>
                                        <div style="clear:both;"></div>
                                        <div style="float:left;margin-top:15px;"><asp:Label runat="server" id="repeaterLabel" CssClass="litBoldText"/><asp:Label runat="server" id="repeaterLabelRequired" CssClass="litText" Visible="false"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequiredForPublishing" alt="" /></asp:Label></div>
                                        <asp:RegularExpressionValidator display="dynamic" SetFocusOnError="true" runat="server" cssclass="litErrorMsg" id="regexpvalidator" style="float:left; padding-left:10px; padding-top:13px;"/>
                                        <asp:Label runat="server" ID="labelVariantField" Visible="false" cssclass="litText" style="float:left; padding-left:10px; padding-top:13px;"><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconLock" alt="" /><Foundation:ModuleString ID="ModuleString3" Name="VariantField" Runat="server"/></asp:Label>
                                        <asp:Label ID="Label2" runat="server" cssclass="litText" style="float:left; padding-left:10px; padding-top:13px;" />
                                        <div style="clear:both;">
                                            <asp:HiddenField runat="server" id="templateFieldID" visible="false"/>
                                            <asp:HiddenField runat="server" id="languageID" visible="false"/>
                                            <asp:TextBox runat="server" id="textbox" cssclass="litInputText" style="width:96%;" visible="false" />
											<LS:HtmlEditor runat="server" ID="editor" Visible="false" Width="96%" Height="300px" />
                                            <asp:DropDownList runat="server" id="dropDownList" cssClass="litInputSelect" style="width:98%;" Visible="false" />
                                            <asp:RadioButtonList id="trueFalse" runat="server" cssclass="litInputRadio" visible="false"/> 
                                            <asp:FileUpload runat="server" id="fileupload" cssclass="litInputFile" visible="false" style="float:left; width:96%;"/>
                                            <div runat="server" id="mediabankfiles" visible="false" style="width:96%;">
                                                <input type="text" runat="server" readonly="readonly" id="mediabankfiledispname" class="litInputText100" style="width:auto;"/>
                                                <input type="button" runat="server" id="mediabankbutton" class="litInputText" style="width:auto;" visible="true" />
                                                <input type="hidden" runat="server" id="mediabankfileid"/>
                                                <input type="hidden"  runat="server" id="mediabankversionid"/>
                                            </div>
                                            <asp:Image id="fileImage" runat="server" visible="false" style="vertical-align:middle; margin-top:4px;"/>
                                            <asp:HyperLink runat="server" id="fileLink" cssclass="litText" visible="false" style="margin-top:4px;"/><asp:label runat="server" id="fileText" cssclass="litText" visible="false"/>
                                            <asp:ImageButton visible="false" imageurl="Images/transparent.gif" runat="server" id="button" causesvalidation="False" cssclass="litIconDelete" borderwidth="0" style="vertical-align:middle;margin:0px; margin-top:4px;" />
                                            <ComponentArt:Calendar id="pickerDateTime" Visible="false" runat="server" />
                                            <img id="imageSetDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" /><img id="imageClearDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar_clear.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" />
                                            <ComponentArt:Calendar runat="server" id="calendarDateTime" visible="false" />
                                        </div>
                                        <%--<asp:RequiredFieldValidator display="dynamic" SetFocusOnError="true" runat="server" cssclass="litErrorMsg" id="requiredvalidator"/>--%>
                                    </ItemTemplate>
                                </asp:Repeater>
		                    </td>
		                </tr>
		            </table>
                </td>
            </tr>
        </table>
    </div>
	<MediaArchive:MediaArchiveDialog id="mediabankdialog" runat="server"/>
</asp:Content>