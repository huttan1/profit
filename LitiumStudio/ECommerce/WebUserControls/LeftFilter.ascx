<%@ control language="C#" autoeventwireup="true" inherits="LitiumStudio_ECommerce_WebUserControls_LeftFilter, Litum.Studio.Web" %>
<script type="text/javascript">
    function validateDateSelection()
    {
        var isValid = true;
        var fromDate = c_calendarFromDate.getSelectedDate();
        var toDate = c_calendarToDate.getSelectedDate();
        if ( fromDate != null && toDate != null)
        {
            if(fromDate > toDate)
            {
                isValid = false;
            }
        }
        return isValid;
    }
    
    function onDateSelection()
    {
      
    }
           
    function setHyperLinkStyle(hyperLinkId, hiddenFieldId, allHyperLinkId)
    {
        if(hyperLinkId.indexOf('c_hyperLinkStatusAll') > 0)
        {         
            clearSelectedLinks(hiddenFieldId);
            document.getElementById(allHyperLinkId).setAttribute("class", "SelectedLeftLink");
            // To support IE.
            document.getElementById(allHyperLinkId).setAttribute("className", "SelectedLeftLink");
        }
        else
        {  
            // Remove selected state from other hyperlinks
            document.getElementById(allHyperLinkId).setAttribute("class", "LeftLink");
            // To support IE.
            document.getElementById(allHyperLinkId).setAttribute("className", "LeftLink");
            clearSelectedLinks(hiddenFieldId);
            document.getElementById(hyperLinkId).setAttribute("class", "SelectedLeftLink");
            // To support IE.
            document.getElementById(hyperLinkId).setAttribute("className", "SelectedLeftLink");
        }
    }

    function DateSelectedStart1(sender, eventArgs)
    {
        var fromDate = '';
        if (eventArgs.get_renderDay().get_date() != null) {
            var date = eventArgs.get_renderDay().get_date();
            var dfi = sender.DateTimeFormatInfo;
            fromDate = dfi.FormatDate(date, document.getElementById("<% Response.Write(c_hiddenFieldDateTimeFormat.ClientID.ToString()); %>").value);
////            fromDate = sender.formatDate(sender.FocusedDate,
//            //                document.getElementById("<% Response.Write(c_hiddenFieldDateTimeFormat.ClientID.ToString()); %>").value);
//            fromDate = sender.FocusedDate;
        }
        setFromDate(fromDate);
    }
    function DateSelectedStart(sender, eventArgs) {
        var date = '';
        if (eventArgs.get_newValue() != null) {
            date = eventArgs.get_newValue();
        }
        setFromDate(date);
    }

    function DateSelectedEnd(sender, eventArgs)
    {
        var date = '';
        if (eventArgs.get_newValue() != null) {
            date = eventArgs.get_newValue();
        }
        setToDate(date);
    }
    
    function clearSelectedLinks(hiddenFieldId)
    {
       // Remove selected state from other hyperlinks
       var links = new Array();
       var clientIds = document.getElementById(hiddenFieldId).value;
       if (clientIds)
       {
           links = clientIds.split(',');
           var clientId = '';
           for (i=0;i<links.length;i++)
           {
               clientId = links[i].substring(links[i].indexOf('|') + 1, links[i].length);
               document.getElementById(clientId).setAttribute("class", "LeftLink");
               // To support IE.
               document.getElementById(clientId).setAttribute("className", "LeftLink");
            }
        }
    }

    function clearDate(cal) {
        var calendar = $find(cal);
        calendar.clear();
        
    }

</script>
<!-- Left menu -->
<asp:HiddenField ID="c_hiddenFieldDateTimeFormat" runat="server" />
<asp:HiddenField ID="c_hiddenFieldRepeaterLinkClientIds" runat="server"/>
<div class="litLeftMenu" id="litSplitterLeftMenu" style="height: auto; position:relative; top: 5px; ">
    <div class="litBoldHeader">
        <asp:Label ID="c_labelFilterType" runat="server" Text=""></asp:Label>
    </div>
<%--    <div style="padding-top: 1px; padding-left: 5px;" class="LeftLink">
        <asp:HyperLink runat="server" ID="c_hyperLinkStatusAll" Text="All"
            ForeColor="Black" Font-Size="11px"
            Font-Underline="false" Font-Bold="false">
        </asp:HyperLink>
    </div>--%>
  <%--  <asp:Repeater ID="c_repeaterStatusLinks" runat="server" OnItemDataBound="c_repeaterStatusLinks_ItemDataBound">
        <ItemTemplate>
            <div style="padding-left: 5px;" class="LeftLink" id="c_divStatusLinks" runat="server">
                <asp:HyperLink runat="server" Text='<%#DataBinder.Eval(Container.DataItem, "Value")%>'
                    ID="c_hyperLinkState" ForeColor="Black" Font-Size="11px" Font-Bold="false" Font-Underline="false"
                    NavigateUrl="~/LitiumStudio/ECommerce/Orders.aspx" />
            </div>
        </ItemTemplate>
    </asp:Repeater>--%>
    <asp:DropDownList ID="ddlStatuses" runat="server" OnDataBound="ddlStatuses_DataBound" />
    <asp:Panel runat="server" ID="c_panelOrderDate" xstyle="padding-top: 8px;">
        <div class="litBoldHeader" style="padding-bottom: 3px;">
            <asp:Label ID="c_labelDate" runat="server" Text=""></asp:Label>
        </div>
        <table border="0" cellpadding="0" cellspacing="0" width="240px">
            <tr>
                <td>
                    <div class="litInputTable">
                    <LS:DateTimeHelper ID="ddd" AssociatedControlID="c_calendarFromDate" runat="server" />
                        <Telerik:RadDatePicker runat="server" Width="160" ID="c_calendarFromDate" AutoPostBack="false" EnableTyping="false" >
                         <ClientEvents OnDateSelected="DateSelectedStart" />
                        </Telerik:RadDatePicker>
                        <asp:HyperLink CssClass="litContentPager" runat="server" ID="c_hyperLinkClearDateFilter"
                            Text="Clear date filter" />
                    </div>
                </td>
            </tr>
            <tr>
                <td>
                    <div class="litInputTable">
                        <Telerik:RadDatePicker runat="server" ID="c_calendarToDate" Width="160" AutoPostBack="false" EnableTyping="false">
                        <ClientEvents OnDateSelected="DateSelectedEnd" />
                        </Telerik:RadDatePicker>
                        <asp:HyperLink CssClass="litContentPager" runat="server" ID="c_hyperLinkClearDateFilter2"
                            Text="Clear date filter" />
                    </div>
                </td>
            </tr>
        </table>
        <%--<input type="button" value="Fileter on date" onclick="clearSelectedOrders('1');onGridLoad()" runat="server"
            id="c_buttonFilterOnDate" />
        <br />  
        <div runat="server" id="c_divIsActive" visible="false">
            <br />
            <input type="checkbox" runat="server" onclick="toggleActive()" id="c_checkBoxIsActive" style="vertical-align:middle"/>
            <asp:Label ID="c_labelActiveCampaigns" runat="server" Text="" CssClass="litBoldHeader"></asp:Label>
            <br />
        </div>
        <asp:Panel ID="c_leftErrorPanel" runat="server" Width="100%">
            <fieldset class="litErrorFieldset" style="width: 220px;">
                <legend class="litErrorFieldsetMsg">
                    <img src="Images/transparent.gif" style="vertical-align: middle;" alt="" class="litIconError" />
                    <b>
                        <Foundation:SystemString Name="ErrorPageTitle" runat="server" ID="c_systemStringDateSelection" />
                    </b></legend>
                <img src="Images/transparent.gif" width="5" alt="" /><br />
                <Foundation:ModuleString Name="InvalidDateSelection" runat="server" ID="c_moduleStringDateSelection" />
            </fieldset>
        </asp:Panel>--%>
    </asp:Panel>
    
</div>