﻿<%@ Control Language="C#" AutoEventWireup="true" CodeFile="OrderTotal.ascx.cs" Inherits="LitiumStudio_ECommerce_Panels_OrderTotal" %>
<%--<asp:ScriptManager runat="server" ID="c_myScriptManager" />--%>
<div style="margin: 15px 15px 15px 15px; width: 615px;">
    <asp:UpdatePanel runat="server" ID="c_mainUpdatePanel" UpdateMode="Conditional" ChildrenAsTriggers="false">
        <ContentTemplate>
            <Foundation:InformationGroup runat="server" HeaderTextName="Settings">
                <table border="0" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
                    <tr>
                        <td style="width: 300px; vertical-align: top;">
                            <span class="litText"><Foundation:ModuleString ID="ModuleString7" runat="server" Name="Currency" />:</span>
                            <asp:DropDownList runat="server" ID="c_currency" AutoPostBack="true" OnSelectedIndexChanged="Update_Click" CssClass="litText" />
                        </td>
                        <td style="width: 15px;">
                            &nbsp;

                        </td>
                        <td style="width: 300px; vertical-align: top;">
                            <span class="litText"><Foundation:ModuleString ID="ModuleString8" runat="server" Name="Campaigns" />:</span>
                            <asp:DropDownList runat="server" ID="c_campaign" AutoPostBack="true" DataTextField="CampaignName"
                                DataValueField="ID" OnSelectedIndexChanged="Update_Click" CssClass="litText" />
                        </td>
                    </tr>
                </table>
            </Foundation:InformationGroup>
            <br />
            <table border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td style="width: 300px; vertical-align: top;">
                        <asp:UpdatePanel runat="server" ID="c_linkUpdatePanel" ChildrenAsTriggers="false" UpdateMode="Conditional">
                            <ContentTemplate>
                                <Foundation:InformationGroup ID="InformationGroup1" Height="210px" runat="server"
                                    HeaderText="Quick links" HeaderTextName="ReportQuickLink">
                                        <ul class="LeftLink" style="list-style-type: none; margin-left: 0px; padding-left: 0px; margin-top: 3px; padding-top: 3px;">
                                            <li>
                                                <asp:LinkButton ID="LinkButton1" CommandArgument="Today" runat="server" CssClass="SelectedLeftLinkReport" OnClick="QuickLink_Click">
                                                    <Foundation:ModuleString ID="ModuleString1" runat="server" Name="ReportQuickLinkToday" />
                                                </asp:LinkButton></li>
                                            <li>
                                                <asp:LinkButton ID="LinkButton2" CommandArgument="Yesterday" runat="server" CssClass="SelectedLeftLinkReport" OnClick="QuickLink_Click">
                                                    <Foundation:ModuleString ID="ModuleString2" runat="server" Name="ReportQuickLinkYesterday" />
                                                </asp:LinkButton></li>
                                            <li>
                                                <asp:LinkButton ID="LinkButton3" CommandArgument="LastWeek" runat="server" CssClass="SelectedLeftLinkReport" OnClick="QuickLink_Click">
                                                    <Foundation:ModuleString ID="ModuleString3" runat="server" Name="ReportQuickLinkLastWeek" />
                                                </asp:LinkButton></li>
                                            <li>
                                                <asp:LinkButton ID="LinkButton4" CommandArgument="LastMonth" runat="server" CssClass="SelectedLeftLinkReport" OnClick="QuickLink_Click">
                                                    <Foundation:ModuleString ID="ModuleString4" runat="server" Name="ReportQuickLinkLastMonth" />
                                                </asp:LinkButton></li>
                                            <li>
                                                <asp:LinkButton ID="LinkButton5" CommandArgument="LastSixMonths" runat="server" CssClass="SelectedLeftLinkReport" OnClick="QuickLink_Click">
                                                    <Foundation:ModuleString ID="ModuleString5" runat="server" Name="ReportQuickLinkLastSixMonths" />
                                                </asp:LinkButton></li>
                                            <li>
                                                <asp:LinkButton ID="LinkButton6" CommandArgument="LastYear" runat="server" CssClass="SelectedLeftLinkReport" OnClick="QuickLink_Click">
                                                    <Foundation:ModuleString ID="ModuleString6" runat="server" Name="ReportQuickLinkLastYear" />
                                                </asp:LinkButton></li>
                                        </ul>
                                </Foundation:InformationGroup>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                    <td style="width: 15px;">
                        &nbsp;
                    </td>
                    <td style="width: 300px; vertical-align: top;">
                        <asp:UpdatePanel runat="server" ID="c_calenderUpdatePanel" ChildrenAsTriggers="false"
                            UpdateMode="Conditional">
                            <ContentTemplate>
                                <Foundation:InformationGroup ID="InformationGroup2" Height="210px" runat="server"
                                    HeaderText="Custom interval" HeaderTextName="ReportCustomInterval">
                                    <table border="0" width="100%" cellpadding="0" cellspacing="0" style="margin-top: 10px;">
                                        <tr>
                                            <td width="45%">
                                                <div class="litInputTable">
                                                    <LS:DateTimeHelper ID="DateTimeHelper1" runat="server" AssociatedControlID="c_calendarFromDate" />
                                                    <Telerik:RadDatePicker runat="server" ID="c_calendarFromDate" Width="135" AutoPostBack="false" EnableTyping="false" /></div>

                                            </td>
                                            <td width="10%">
                                                -
                                            </td>
                                            <td width="45%">
                                                <div class="litInputTable">
                                                    <LS:DateTimeHelper ID="DateTimeHelper2" runat="server" AssociatedControlID="c_calendarToDate" />
                                                    <Telerik:RadDatePicker runat="server" ID="c_calendarToDate" Width="135" AutoPostBack="false" EnableTyping="false" /></div>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="3" style="height: 10px;"><asp:CompareValidator ID="c_dateCompareValidator" runat="server" ControlToValidate="c_calendarToDate"
			                                ControlToCompare="c_calendarFromDate" Operator="GreaterThanEqual" Type="Date">
		                                </asp:CompareValidator></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2">
                                                <span class="litText"><Foundation:ModuleString ID="ModuleString9" runat="server" Name="ReportInterval"/>:</span>
                                                <asp:DropDownList runat="server" ID="c_dateInterval" AutoPostBack="true" CssClass="litText" />
                                            </td>
                                            <td>
                                                <asp:Button runat="server"  CssClass="litInputButton" ID="c_update" OnClick="Update_Click" />
                                            </td>
                                        </tr>
                                    </table>
                                </Foundation:InformationGroup>
                            </ContentTemplate>
                        </asp:UpdatePanel>
                    </td>
                </tr>
            </table>
            <br />
        </ContentTemplate>
    </asp:UpdatePanel>
    <Foundation:InformationGroup ID="InformationGroup3" runat="server" HeaderTextName="ReportDiagramBoxHeadline">
        <asp:UpdatePanel runat="server" ID="c_diagramPanel" UpdateMode="Conditional" ChildrenAsTriggers="false">
            <ContentTemplate>
                <div style="margin-top: 10px; margin-bottom: 10px;">
					<table border="0" cellpadding="0" cellspacing="0" width="100%">
						<tr>
							<td style="width:50%;">
								<span class="litText"><Foundation:ModuleString ID="ModuleString10" runat="server" Name="ReportDiagramOrderValue" /> <asp:Label runat="server" ID="c_orderTotalValue" CssClass="litText" />
								<br />
								<Foundation:ModuleString ID="ModuleString11" runat="server" Name="ReportDiagramOrderCount" /> <asp:Literal runat="server" ID="c_orderCount"></asp:Literal></span>							
							</td>
							<td style="vertical-align:top; padding-right:13px;" align="right">
								<span class="litText"><Foundation:ModuleString ID="ModuleString12" runat="server" Name="OrderStatus" />:</span>
			                    <asp:DropDownList runat="server" ID="c_orderStatus" AutoPostBack="true" OnSelectedIndexChanged="Update_Click" CssClass="litText" />							
							</td>
						</tr>
					</table>
                </div>
                <ComponentArtChart:WebChart ID="c_chartVisits" runat="server" Height="400px" Width="580" style="margin-right: 10px;" CustomImageFileName="VisitStatistics" SaveImageOnDisk="false"/>
            </ContentTemplate>
        </asp:UpdatePanel>
    </Foundation:InformationGroup>
</div>
