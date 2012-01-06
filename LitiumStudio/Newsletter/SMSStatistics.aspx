<%@ page language="C#" masterpagefile="~/LitiumStudio/Newsletter/Framework/Base1.master" inherits="LitiumStudio_Newsletter_SMSStatistics, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/Newsletter/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="mc_toolbar" runat="server" >
        <toolbar:ToolbarItem OnClick="ToolbarItemCancel_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconArrowLeft" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="images/transparent.gif" ID="c_toolbarItemCancel" runat="server"/>	
        <toolbar:DividerItem ID="DividerItem2" ImageURL="Images/transparent.gif" Class="litToolbarDivider" runat="server" />
	    <toolbar:ToolbarItem OnClick="ToolbarItemRefresh_Click" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconRefresh" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemRefresh" runat="server"/>	
    </toolbar:HorizontalToolbar>
</asp:Content>
<asp:Content ID="Content3" runat="Server" ContentPlaceHolderID="LitiumStudioContentHeading">
    <img src="Images/transparent.gif" alt="" class="litIconCircularSMS" />
    <Foundation:ModuleString ID="ModuleString5" Name="Receivers" runat="server" />&nbsp;
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentScroll">
        <table cellpadding="0" cellspacing="0" border="0" style="width: 100%;">
	        <tr>
				<td valign="top">
				    <span class="litBoldText"><Foundation:ModuleString name="AddressListQuantity" runat="server" ID="Propertyname6"/>:</span>
				    <span class="litText"><asp:Label runat="server" ID="c_numberOfReceivers"></asp:Label></span>
				</td>
			</tr>
			<tr>
				<td valign="top"  style="padding-top:15px;">
				    <span class="litBoldText"><Foundation:ModuleString name="SMSDelivered" runat="server" ID="ModuleString2"/>:</span>
				    <span class="litText"><asp:Label runat="server" ID="c_numberOfDeliverd"></asp:Label></span>
				</td>
			</tr>
			<tr>
			    <td>
			        <asp:DataList Runat="server" ID="c_dgrdReadAddresses">
		                <ItemTemplate>
			                <div class="litText"><%#DataBinder.Eval(Container.DataItem, "PhoneNumber")%></div>
		                </ItemTemplate>
	                </asp:DataList>
			    </td>
			</tr>
			<tr>
				<td valign="top"  style="padding-top:15px;">
				    <span class="litBoldText"><Foundation:ModuleString name="FailedPhoneNumbers" runat="server" ID="ModuleString1"/>:</span>
					<span class="litText"><asp:Label runat="server" ID="c_numberOfFailedReceivers"></asp:Label></span>						    
				</td>
			</tr>
			<tr>
			    <td>
			        <asp:DataList Runat="server" ID="c_dgrdFailedAddresses">
		                <ItemTemplate>
			                <div class="litText"><%#DataBinder.Eval(Container.DataItem, "PhoneNumber")%></div>
		                </ItemTemplate>
	                </asp:DataList>
			    </td>
			</tr>
        </table><br />
        <asp:Panel id="c_panelMajorError" visible="False" runat="server"> 
            <fieldset class="litErrorFieldset"><legend class="litErrorFieldsetMsg"><img src="Images/transparent.gif" style="vertical-align:middle;" class="litIconError" alt="" /><b><Foundation:SystemString Name="UnknownError" runat="server" ID="Systemstring5"/></b></legend><img src="Images/transparent.gif" width="5" alt="" /><br />
                <asp:Label id="c_labelMajorError" runat="server"/>
            </fieldset>
        </asp:Panel>
    </div>
    <script type="text/javascript">
        var focusObject = document.getElementById(null);
        var submitObject = document.getElementById(null);
        var cancelObject = null;
        document.onkeypress = function(e){var key=(window.event)?window.event.keyCode:e.keyCode; if(key==27) simulateClick(cancelObject); else if(key==13) simulateClick(submitObject);}
        if(focusObject && !focusObject.disabled) {focusObject.focus();}
    </script>
</asp:Content>