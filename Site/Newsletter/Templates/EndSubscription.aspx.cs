using System;
using System.Collections.Generic;
using System.Web.UI;
using Litium.Studio.UI.Newsletter.Common.Utilities;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.Newsletter;
using Litium.Foundation.Modules.Newsletter.AddressLists;
using Litium.Foundation.Modules.Newsletter.Circulars;

namespace Site.Newsletter.Templates
{
    /// <summary>
    /// End subscription used to handle the users click on the end subscription text at the mail.
    /// </summary>
    public partial class EndSubscription : Page
    {
        /// <summary>
        /// Page Load.
        /// </summary>
        /// <param name="sender">Sender of the event</param>
        /// <param name="e">Args</param>
        protected void Page_Load(object sender, EventArgs e)
        {
            // Get FoundationContext and module instance
            FoundationContext foundationContext = FoundationContext.Current;
            ModuleNewsletter currentModule = ModuleNewsletter.Instance;

            if (currentModule != null)
            {
                try
                {
                    c_panelAddressNotFound.Visible = false;
                    c_panelAddressRemoved.Visible = false;
                    c_panelBadRequest.Visible = false;

                    // Set label texts
                    if (foundationContext != null)
                    {
                        c_subscriptionAddressList.Text = currentModule.Strings.GetValue("SubscriptionAddressList", foundationContext.LanguageID, true);
                        c_subscriptionEndConfirmation.Text = currentModule.Strings.GetValue("SubscriptionEndConfirmation", foundationContext.LanguageID, true);
                        c_subscriptionMessageAddressNotFound.Text = currentModule.Strings.GetValue("SubscriptionMessageAddressNotFound", foundationContext.LanguageID, true);
                        c_subscriptionMessageBadRequest.Text = currentModule.Strings.GetValue("SubscriptionMessageBadRequest", foundationContext.LanguageID, true);
                    }

                    Guid circularID = RequestUtilities.GetGuidParameterValue(Request[Litium.Foundation.Modules.Newsletter.Constants.ParameterConstants.CIRCULAR_ID]);
                    Circular circular;
                    if (circularID != Guid.Empty)
                    {
                        circular = currentModule.Circulars[circularID, currentModule.AdminToken];
                    }
                    else
                    {
                        circular = null;
                    }

                    // We need to call the obsolete method here in order to handle the end subscription links from the old newsletters
#pragma warning disable 618
                    string emailAddress = Request[Litium.Foundation.Modules.Newsletter.Constants.ParameterConstants.USER_EMAIL];
#pragma warning restore 618
                    if (string.IsNullOrEmpty(emailAddress))
                    {
                        var receiverIDStr = Request[Litium.Foundation.Modules.Newsletter.Constants.ParameterConstants.RECEIVER_ID];
                        EmailCircularReceiver receiver;
                        if (!string.IsNullOrEmpty(receiverIDStr) && circular != null)
                        {
                            var receiverID = new Guid(receiverIDStr);
                            receiver = circular.Receivers.GetReceiver(receiverID) as EmailCircularReceiver;
                        }
                        else
                        {
                            receiver = null;
                        }

                        if (receiver != null)
                        {
                            emailAddress = receiver.Email;
                        }
                        else
                        {
                            c_panelBadRequest.Visible = true;
                            return;
                        }
                    }

                    if (circularID != Guid.Empty)
                    {
                        c_labelAddressList.Text = "";

                        if (circular != null)
                        {
                            foreach (CircularAddressList addressList in circular.AddressLists)
                            {
                                List<AddressListMember> members = addressList.AddressList.Members.GetMembersByEmail(emailAddress);
                                if (members != null && members.Count > 0)
                                {
                                    foreach (AddressListMember member in members)
                                        member.SetUnsubscribed(true, currentModule.AdminToken);
                                    c_panelAddressRemoved.Visible = true;
                                    c_labelAddressList.Text += (c_labelAddressList.Text == "" ? "" : ", ") + addressList.AddressList.Name;
                                }
                            }
                            if (!c_panelAddressRemoved.Visible)
                                c_panelAddressNotFound.Visible = true;
                        }
                        else
                            c_panelBadRequest.Visible = true;
                    }
                    else
                    {
                        Guid addressListID = RequestUtilities.GetGuidParameterValue(Request[Litium.Studio.UI.Newsletter.AddressLists.Constants.AddressListsParameterConstants.ADDRESS_LIST_ID]);
                        AddressList addressList = null;
                        if (addressListID != Guid.Empty)
                            addressList = currentModule.AddressLists.GetAddressList(addressListID, currentModule.AdminToken);

                        if (addressList != null)
                        {
                            c_labelAddressList.Text = addressList.Name;

                            List<AddressListMember> members = addressList.Members.GetMembersByEmail(emailAddress);
                            if (members != null)
                            {
                                foreach (AddressListMember member in members)
                                {
                                    member.SetUnsubscribed(true, currentModule.AdminToken);
                                }
                                c_panelAddressRemoved.Visible = true;
                            }
                            else
                                c_panelAddressNotFound.Visible = true;
                        }
                        else
                        {
                            c_labelAddressList.Text = "-";
                            c_panelBadRequest.Visible = true;
                        }
                    }
                }
                catch (Exception)
                {
                    c_panelBadRequest.Visible = true;
                }
            }
        }
    }
}