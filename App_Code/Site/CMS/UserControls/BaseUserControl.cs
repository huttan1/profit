namespace App_Code.Site.CMS.UserControls
{
	/// <summary>
	/// BaseUserControl. Implements <see cref="Litium.Foundation.Modules.WebControlState"/>.
	/// </summary>
	public abstract class BaseUserControl : System.Web.UI.UserControl
	{
		private readonly Litium.Foundation.Modules.WebControlState m_webControlState;

		protected Litium.Foundation.Modules.WebControlState WebControlState
		{
			get { return m_webControlState; }
		}

		protected BaseUserControl()
		{
			m_webControlState = new Litium.Foundation.Modules.WebControlState(this);
		}
	}
}