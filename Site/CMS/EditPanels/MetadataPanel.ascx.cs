using System;
using Litium.Foundation.Modules.CMS.GUI.Panels;

namespace Almega.Site.CMS.EditPanels
{
	public partial class MetadataPanel : BasePanel
	{
		protected override void OnInit(EventArgs e)
		{
			m_metadataControl.WorkingCopy = m_parentPage.WorkingCopy;
		}

		protected override bool Save()
		{
			//Try save Foldout list
			return m_metadataControl.Save();
		}
	}
}