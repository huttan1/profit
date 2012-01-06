<%@ page language="C#" masterpagefile="~/LitiumStudio/ProductCatalog/Framework/ArticlesEditBase.master" autoeventwireup="true" validaterequest="false" inherits="LitiumStudio_ProductCatalog_ArticlesEditTranslate, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/ProductCatalog/Framework/ArticlesEditBase.master" %>
<%@ Register TagPrefix="MediaArchive" TagName="MediaArchiveDialog" src="~/LitiumStudio/WebUserControls/MediaArchiveDialog.ascx" %>

<asp:Content ID="Content1" ContentPlaceHolderID="PageHeader" Runat="Server">
    <img src="Images/transparent.gif" class="litIconArticle" alt="" /><Foundation:ModuleString ID="ModuleString5" Name="ArticlesEditTranslateHeader1" Runat="server"/>&nbsp;"<asp:label id="c_languageName" visible="true" runat="server"/>"&nbsp;<Foundation:ModuleString ID="ModuleString6" Name="ArticlesEditTranslateHeader2" Runat="server"/>
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="MainContent" Runat="Server">
        <div>
            <div class="litListAreaV2 litListAreaProduct" style="width: 100%; overflow: auto;">
		        <table border="0" cellspacing="0" cellpadding="1" >
                    <asp:Repeater id="c_articleRepeater" runat="server" OnItemDataBound="ArticleRepeater_OnItemDataBound">
                        <HeaderTemplate>
                            <tr>
                                <th align="left" style="width:110px;"><div class="lsListHeader" style="width:110px;"><Foundation:ModuleString ID="ModuleString3" Name="ArticleNumber" Runat="server"/><img src="images/transparent.gif" style="vertical-align:middle;" class="litIconRequired" alt='<Foundation:SystemString ID="ModuleString4" Name="RequiredField" Runat="server"/>' /></div></th>
                                <asp:Repeater ID="c_templatefieldRepeater" runat="server" OnItemDataBound="TemplatefieldRepeater_OnItemDataBound">
                                    <ItemTemplate>
                                       <th align="left" style="border-left:1px solid white;"><div style="width:197px;"><div style="float:left;" class="lsListHeader"><asp:label id="c_templateFieldHeader" runat="server"/></div></div></th>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <th style="width:100%; border-left:1px solid white;">&nbsp;</th>
                            </tr>
                        </HeaderTemplate>
                        <ItemTemplate>
                            <tr>
                                <td valign="top" style="width:100px;">
                                    <asp:HiddenField runat="server" id="articleID" visible="false"/>
                                    <asp:Label id="articleNumberLabel" cssclass="litText" runat="server" />
                                </td>
                                <asp:Repeater id="c_articlePropertiesRepeater" runat="server" OnItemDataBound="ArticlePropertiesRepeater_OnItemDataBound" OnItemCommand="RepeaterItemCommand">
                                    <ItemTemplate>
                                       <td valign="top" style="width:187px; border-left:1px solid white; padding-bottom:5px;">
                                           <asp:HiddenField runat="server" id="templateFieldID" visible="false"/>
                                           <asp:HiddenField runat="server" id="languageID" visible="false"/>
                                           
		                                   <asp:TextBox runat="server" id="textbox" cssclass="litInputText" style="width:183px;" visible="false" />
		                                   <asp:DropDownList runat="server" id="dropDownList" cssClass="litInputSelect" style="width:190px;" Visible="false" />
                		                   <LS:HtmlEditor runat="server" ID="editor" Visible="false" Width="400px" Height="300px" />
		                                   <asp:RadioButtonList id="trueFalse" runat="server" width="50" visible="false" cssclass="litInputRadio" style="filter:none; background:none;"/> 
                		                   
		                                   <asp:FileUpload runat="server" id="fileupload" cssclass="litInputFile" visible="false" style="width:183px;"/>
		                                   <div runat="server" id="mediabankfiles" visible="false" style="width:183px;">
                                            <input type="text" runat="server" readonly="readonly" id="mediabankfiledispname" class="litInputText100" style="width:60px;"/>
                                            <input type="button" runat="server" id="mediabankbutton" class="litInputText" style="width:auto;" visible="true" />
                                            <input type="hidden" runat="server" id="mediabankfileid"/>
                                            <input type="hidden"  runat="server" id="mediabankversionid"/>
                                           </div>
		                                   <asp:Image id="fileImage" runat="server" visible="false" style="vertical-align:middle; margin-top:4px;"/>
		                                   <asp:HyperLink runat="server" id="fileLink" cssclass="litText" visible="false" style="padding-bottom:5px;"/><asp:label runat="server" id="fileText" cssclass="litText" visible="false"/>
		                                   <asp:ImageButton visible="false" imageurl="Images/transparent.gif" runat="server" id="button" causesvalidation="False" cssclass="litIconDelete" borderwidth="0" style="vertical-align:middle;margin:0px; margin-top:4px;" />
                                           
                                           <div style="position: relative; overflow: hidden; width: 0px; height: 0px;"><img id="imageAlign" runat="server" width="0" height="0" border="0" style="position: relative; top: 21px; left: -5px;" /></div>
                                           <ComponentArt:Calendar id="pickerDateTime" Visible="false" runat="server" />
                                           <img id="imageSetDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" /><img id="imageClearDate" class="litCalendarButton" src="~/LitiumStudio/Images/Calendar/btn_calendar_clear.gif" width="22" height="20" runat="server" visible="false" style="margin-left:3px; margin-top:1px; vertical-align:top;" />
                                           <ComponentArt:Calendar runat="server" id="calendarDateTime" visible="false" />
                                           
                                           <img runat="server" id="imgVariantField" visible="false" src="images/transparent.gif" style="vertical-align:top; margin:0px; margin-top:3px;" class="litIconLock" alt="" />
                                           
                                           <asp:RegularExpressionValidator display="dynamic" SetFocusOnError="true" cssclass="litErrorMsg" runat="server" id="regexpvalidator"/>
                                           <asp:RequiredFieldValidator display="dynamic" SetFocusOnError="true" cssclass="litErrorMsg" runat="server" id="requiredvalidator"/>
										   <asp:Panel runat="server" id="panelVariantField" cssclass="litListContent" style="font-weight:normal;font-style:italic;" visible="false"><Foundation:ModuleString ID="ModuleString4" Name="VariantField" Runat="server"/></asp:Panel>
                                        </td>
                                    </ItemTemplate>
                                </asp:Repeater>
                                <td style="width:100%; border-left:1px solid white;">&nbsp;</td>
                            </tr>
                        </ItemTemplate>
                    </asp:Repeater>
                </table>
			</div>
        </div>
    
     <MediaArchive:MediaArchiveDialog id="mediabankdialog" runat="server"/>
</asp:Content>