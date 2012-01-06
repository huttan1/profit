using System;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.WebControls;
using Litium.Foundation.Modules.WebControls;

namespace App_Code.Site.CMS.Templates
{
	/// <summary>
	/// Base class for page templates.
	/// </summary>
	public abstract class BaseTemplate : Litium.Foundation.Modules.CMS.GUI.Templates.ContentPageTemplate {
	    
        
        protected void InitList(object sender, EventArgs e)
        {
            var repeater = sender as ChildRepeater;
           var link = CurrentPage.Content.GetProperty("PuffListLink") as LinkInternalProperty;

            if (link != null && link.ValueCount > 0)
            {
                repeater.ParentPageID = link.GetValue();
                repeater.DataBind();
            }

        }
	}
}