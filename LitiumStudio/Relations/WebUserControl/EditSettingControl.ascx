<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_Relations_WebUserControl_EditSettingControl, Litum.Studio.Web" %>
<div class="lsTabContent">	
    <div class="litBoldHeader"><Foundation:ModuleString ID="ModuleString4" Name="Template" runat="server" /></div>
    <asp:DropDownList ID="c_dropDownFieldTemplate" CssClass="litInputText200" runat="server" AutoPostBack="true" OnSelectedIndexChanged="FieldTemplate_Changed" />
    <div style="margin-top: 5px;" class="litText">
	    <Foundation:ModuleString ID="ModuleString2" Name="PersonEditSettingsPageChangeTemplate"
		    runat="server" />
    </div>
</div>
