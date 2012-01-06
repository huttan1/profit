<%@ page language="C#" masterpagefile="~/LitiumStudio/CMS/Framework/Base1.master" autoeventwireup="true" inherits="LitiumStudio_CMS_PagesStatistic, Litum.Studio.Web" %>
<%@ MasterType VirtualPath="~/LitiumStudio/CMS/Framework/Base1.master" %>

<asp:Content ID="Content1" ContentPlaceHolderID="ToolbarRight" Runat="Server">
    <script type="text/javascript">
    	function openGoogleAnalytics() {
    		window.open('http://www.google.com/analytics', 'googlewindow', 'width=800,height=600, toolbar=yes,location=yes, directories=yes,status=yes,menubar=yes,scrollbars=yes,resizable=yes');
    		return;
    	}
    </script>
    <toolbar:HorizontalToolbar ToolbarIndex="1" id="c_toolbarStatistic" runat="server" >
		<toolbar:ToolbarItem URL="javascript:openGoogleAnalytics();" DisabledClass="litToolbarItem litToolbarItemDisabled" Class="litToolbarItem" LinkClass="litToolbarLink" ImageClass="litIconView" SelectedClass="litToolbarItem litToolbarItemSelected" ImageURL="Images/transparent.gif" ID="c_toolbarItemGoogleAnalytics" runat="server"/>
	</toolbar:HorizontalToolbar>
</asp:Content>

<asp:Content ID="Content5" ContentPlaceHolderID="LitiumStudioContentHeading" runat="Server">
	<img src="Images/transparent.gif" alt="" class="litIconLineChart" />
	<asp:Label runat="server" id="c_spanStatisticsHeader" />
</asp:Content>

<asp:Content ID="Content3" ContentPlaceHolderID="ContentRight" Runat="Server">
    <div class="lsContentNoScroll" style="height:100%; overflow:auto;">
        <!-- Drop downs, time interval -->
        <div class="litModuleContentWithTreeTopAreaV2" style="position:relative; margin-left: 20px; width:expression((document.documentElement.clientWidth || document.body.clientWidth) - 266 + 'px');">
            <table cellpadding="0" cellspacing="0" border="0">
                <tr>
                    <td style="height:34px;">
                        <span class="litBoldText" style="bottom: 2px; position:relative;"><Foundation:ModuleString ID="ModuleString5" Name="From" runat="server"/></span>
                        <asp:DropDownList runat="server" ID="c_dropDownListFromMonth" CssClass="litInputSelect" style="width:auto;"></asp:DropDownList>
                        <asp:DropDownList runat="server" ID="c_dropDownListFromYear" CssClass="litInputSelect" style="width:auto;"></asp:DropDownList>
                    </td>    
                    <td style="padding-left: 15px;">    
                        <span class="litBoldText" style="bottom: 2px; position:relative;"><Foundation:ModuleString ID="ModuleString1" Name="To" runat="server"/></span>
                        <asp:DropDownList runat="server" ID="c_dropDownListToMonth" CssClass="litInputSelect" style="width:auto;"></asp:DropDownList>
                        <asp:DropDownList runat="server" ID="c_dropDownListToYear" CssClass="litInputSelect" style="width:auto;"></asp:DropDownList>
                    </td>
                    <td style="margin-left: 15px;"> 
                        <asp:Button runat="server" ID="c_buttonShow" CssClass="litInputButton" style="margin-left:20px;" />                    
                    </td>
                </tr> 
            </table>
        </div>
        <!-- Component art web chart -->
        <div style="margin:20px; margin-top: 50px; margin-bottom: 40px;">
            <ComponentArtChart:WebChart ID="c_chartVisits" runat="server" Height="400px" CustomImageFileName="VisitStatistics" SaveImageOnDisk="false"/>
        </div>
        <!-- Landing pages stats -->
        <div id="c_divLandingPages" runat="server" style="margin: 20px;">
            <asp:Panel runat="server" ID="c_landingPages" CssClass="litBoldText" style="padding-bottom:5px;"><Foundation:ModuleString Name="LandingPages" runat="server"/></asp:Panel>
            <div class="litListWithTreeAreaV2" >
                <!-- Specific page -->
                <asp:Panel id="c_panelEntryOnePage" visible="False" runat="server"> 
                    <table cellpadding="0" cellspacing="0" style="width:600px;">
                        <tr>
                            <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString9" Name="EntryHits" runat="server"/></th>
                            <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString10" Name="EntryHitsPercent" runat="server"/></th>                        
                        </tr>
                        <tr>
                            <td class="litListContent" style="width:40%;"><asp:Label runat="server" ID="c_entrySumOnePage"></asp:Label></td>
                            <td class="litListContent" style="width:60%;"><asp:Label runat="server" ID="c_entryPercentOnePage"></asp:Label></td>                        
                        </tr>
                    </table>
                </asp:Panel>  
                <!-- Web site -->
                <asp:Repeater id="c_repeaterEntryPages" runat="server">
			        <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" style="width:600px;">
                            <tr >
                                <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString5" Name="PageName" runat="server"/></th>
                                <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString2" Name="EntryExitHitsWebSite" runat="server"/></th>
                                <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString3" Name="EntryExitHitsPercentWebSite" runat="server"/></th>
                            </tr>
                    </HeaderTemplate>
                    <AlternatingItemTemplate>
                        <tr>
                            <td class="litListContent" style="width:30%;"> <%# DataBinder.Eval(Container.DataItem, "PageName")%></td>
                            <td class="litListContent" style="width:30%;"> <%# DataBinder.Eval(Container.DataItem, "Sum")%></td>
                            <td class="litListContent" style="width:40%;"> <%# DataBinder.Eval(Container.DataItem, "Percent")%> %</td>
                        </tr>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="litListContent"> <%# DataBinder.Eval(Container.DataItem, "PageName")%></td>
                            <td class="litListContent"> <%# DataBinder.Eval(Container.DataItem, "Sum")%></td>
                            <td class="litListContent"> <%# DataBinder.Eval(Container.DataItem, "Percent")%> %</td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
			    </asp:Repeater>
			</div>
			<div class="litText" style="padding-top: 5px; padding-left: 4px; margin-bottom: 40px;"><Foundation:ModuleString ID="ModuleString7" Name="LandingPageDescription" runat="server"/></div>
        </div>
        <!-- Exit pages stats -->
        <div id="c_divExitPages" runat="server" style="margin: 20px;">
            <asp:Panel runat="server" ID="c_exitPages" CssClass="litBoldText" style="padding-bottom:5px;"><Foundation:ModuleString Name="ExitPages" runat="server"/></asp:Panel>
            <div class="litListWithTreeAreaV2">
                <!-- Specific page -->
                <asp:Panel id="c_panelExitOnePage" visible="False" runat="server"> 
                    <table cellpadding="0" cellspacing="0" style="width:600px;">
                        <tr>
                            <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString2" Name="ExitHits" runat="server"/></th>
                            <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString3" Name="ExitHitsPercent" runat="server"/></th>                        
                        </tr>
                        <tr>
                            <td class="litListContent" style="width:40%;"><asp:Label runat="server" ID="c_exitSumOnePage"></asp:Label></td>
                            <td class="litListContent" style="width:60%;"><asp:Label runat="server" ID="c_exitPercentOnePage"></asp:Label></td>                        
                        </tr>
                    </table>
                </asp:Panel>            
                <!-- Web site -->
                <asp:Repeater id="c_repeaterExitPages" runat="server">
		            <HeaderTemplate>
                        <table cellpadding="0" cellspacing="0" style="width:600px;">
                            <tr >
                                <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString5" Name="PageName" runat="server"/></th>
                                <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString2" Name="EntryExitHitsWebSite" runat="server"/></th>
                                <th class="lsListHeader" align="left"><Foundation:ModuleString ID="ModuleString3" Name="EntryExitHitsPercentWebSite" runat="server"/></th>
                            </tr>
                    </HeaderTemplate>
                    <AlternatingItemTemplate>
                        <tr>
                            <td class="litListContent" style="width:30%;"> <%# DataBinder.Eval(Container.DataItem, "PageName")%></td>
                            <td class="litListContent" style="width:30%;"> <%# DataBinder.Eval(Container.DataItem, "Sum")%></td>
                            <td class="litListContent" style="width:40%;"> <%# DataBinder.Eval(Container.DataItem, "Percent")%> %</td>
                        </tr>
                    </AlternatingItemTemplate>
                    <ItemTemplate>
                        <tr>
                            <td class="litListContent"> <%# DataBinder.Eval(Container.DataItem, "PageName")%></td>
                            <td class="litListContent"> <%# DataBinder.Eval(Container.DataItem, "Sum")%></td>
                            <td class="litListContent"> <%# DataBinder.Eval(Container.DataItem, "Percent")%> %</td>
                        </tr>
                    </ItemTemplate>
                    <FooterTemplate>
                        </table>
                    </FooterTemplate>
		        </asp:Repeater>
			</div>
			<div class="litText" style="padding-top: 5px; padding-left: 4px;"><Foundation:ModuleString ID="ModuleString8" Name="ExitPageDescription" runat="server"/></div>
        </div>
    </div>
</asp:Content>

