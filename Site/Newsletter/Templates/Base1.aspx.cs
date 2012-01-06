using System;
using System.Collections;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Web;
using System.Web.SessionState;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.HtmlControls;
using Litium.Foundation;
using Litium.Foundation.GUI;
using Litium.Foundation.Log;
using Litium.Foundation.Modules.Newsletter;
using Litium.Foundation.Modules.Newsletter.Constants;

namespace Site.Newsletter.Templates
{
    /// <summary>
    /// Summary description for Base1.
    /// </summary>
    /// In parameter:
    /// ParameterConstants.SHOW_REPLACEMENT_TAGS: If it is not null and its value is not an empty string then the replacement tags will be shown on the page otherwise they willbe removed.
    public partial class Base1 : System.Web.UI.Page
    {
        protected override void OnPreInit(EventArgs e)
        {
            base.OnPreInit(e);
            FoundationContext foundationContext = FoundationContext.Current;
            foundationContext.ActiveModuleID = ModuleNewsletter.Instance.ID;
        }

        /// <summary>
        /// Show replacement teags
        /// </summary>
        public bool ShowReplacementTags
        {
            get
            {
                bool showReplacementTag;
                bool.TryParse(Request[ParameterConstants.SHOW_REPLACEMENT_TAGS], out showReplacementTag);
                return showReplacementTag;
            }
        }
    }
}