using System;
using Litium.Extensions.Constants;
using Litium.Extensions.ObjectPost.Pages;
using Litium.Plus.Utilities;

/// <summary>
/// This UserControl displays a Form to post a comment on current page, and a list of comments
/// </summary>
public partial class Templates_Extensions_ObjectPostComment : ObjectPostBaseUserControl
{
	// Set this constant to the type you want the posts to be of, for example you could have 0 for Pages, 1 for Products and 2 for Images.
	private const short POST_TYPE = 10;

	/// <summary>
	/// Raises the <see cref="E:System.Web.UI.Control.Init"/> event.
	/// </summary>
	/// <param name="e">An <see cref="T:System.EventArgs"/> object that contains the event data.</param>
	protected override void OnInit(EventArgs e)
	{
		// Set the posttype on the form
		c_objectPostForm1.ObjectPostType = POST_TYPE;

		// Set the PostEdited event on the form, this is executed when a post is edited, 
		// and in this case the user are redirected to the same page without the postid in the querystring
		c_objectPostForm1.ObjectPostEdited += ObjectPostForm1ObjectPostEdited;

		// Set the ObjectID to the object you want the comments on, in this case current pages id is passed
		c_objectPostForm1.ObjectID = WebControlState.CMS.CurrentPage.ID;

		// Set the ObjectID to the object you want the comments loaded from
		m_objectPostRepeater1.ObjectID = WebControlState.CMS.CurrentPage.ID;

		// Set the type of posts to load
		m_objectPostRepeater1.ObjectPostType = POST_TYPE;
		m_objectPostRepeater1.DataBind();

		base.OnInit(e);
	}

	/// <summary>
	/// Objects the post form1_ object post edited.
	/// </summary>
	/// <param name="post">The post.</param>
	protected void ObjectPostForm1ObjectPostEdited(Litium.Extensions.ObjectPost.ObjectPost post)
	{
		string url = UrlUtilities.RemoveUrlParameter(Page.Request.Url.ToString(), QueryStringParameterConstants.OBJECTPOST_EDITEDOBJECTPOSTID);
		Response.Redirect(url);
	}

	protected override void OnPreRender(EventArgs e)
	{
		if (Page.IsPostBack && Panel_Sucess.Visible)
		{
			// If the post was registered we bind the ObjectPostRepeater (again...) to show the new post.
			m_objectPostRepeater1.ObjectID = m_objectPostRepeater1.ObjectID;
			m_objectPostRepeater1.DataBind();
		}

		base.OnPreRender(e);
	}
}
