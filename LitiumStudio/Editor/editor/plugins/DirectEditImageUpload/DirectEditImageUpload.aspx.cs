using System;
using System.Collections.Generic;
using System.Globalization;
using System.IO;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using Litium.Foundation.Modules;
using Litium.Foundation.Modules.CMS;
using Litium.Studio.UI.CMS.Pages.Constants;
using Litium.Foundation;
using Litium.Foundation.Log;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Modules.MediaArchive;
using Litium.Foundation.Modules.MediaArchive.Categories;
using Litium.Foundation.Modules.MediaArchive.Files;
using Litium.Foundation.Modules.MediaArchive.Folders;
using Litium.Foundation.Modules.MediaArchive.WebControls.AdminTreeView;
using File=Litium.Foundation.Modules.MediaArchive.Files.File;
using Image=Litium.Foundation.Modules.MediaArchive.Files.Image;
using Litium.Foundation.Modules.MediaArchive.Licensing;
using TreeViewNode = Telerik.Web.UI.RadTreeNode;
using TreeView = Telerik.Web.UI.RadTreeView;
using ComponentArt.Web.UI;

public partial class FCKeditor_editor_plugins_CMSImageUpload_DirectEditImageUpload : Litium.Studio.UI.CMS.Common.PagesBasePage
{
    // Instance members
    // Constants
    private const int FOLDER_LIST_IMAGE_HEIGHT = 94;
    private const int FOLDER_LIST_IMAGE_WIDTH = 94;


    // Constants
    private const int IMAGE_LIST_SIZE = 94;
    private const int FILE_LIST_SIZE = 20;

    // Instance members
    protected bool m_selectOnlyImages = true;
    protected bool m_eventTriggered = false;

    // Instance members
    protected List<File> m_images = new List<File>();
    protected string m_imageSrc = "";
    
    /// <summary>
    /// Whether the media archive is installed or not
    /// </summary>
    public bool MediaArchiveInstalled
    {
        get { return ModuleMediaArchive.ExistsInstance; }
    }

    private ModuleMediaArchive m_moduleMediaArchive;
    /// <summary>
    /// The media archive
    /// </summary>
    private ModuleMediaArchive MediaArchiveModule
    {
        get
        {
            if (m_moduleMediaArchive == null)
                m_moduleMediaArchive = ModuleMediaArchive.Instance;
            return m_moduleMediaArchive;
        }
    }

    /// <summary>
    /// Authorizes the user for the current page
    /// </summary>
    /// <returns>True if authorization succedded, otherwise false</returns>
    public override bool AuthorizeUser()
    {
        return (FoundationContext != null && m_currentModule!= null && FoundationContext.Token != null);
    }

    /// <summary>
    /// Returns title of the page.
    /// </summary>
    public new string Title
    {
        get 
        {
            if (MediaArchiveInstalled)
                return ModuleMediaArchive.Instance.Strings.GetValue("ImageInsert", FoundationContext.LanguageID, true);
            return "Insert/Edit image";
        }
    }

    /// <summary>
    /// On pre init
    /// </summary>
    /// <param name="e"></param>
    protected override void OnPreInit(EventArgs e)
    {
        base.OnPreInit(e);
        if(MediaArchiveInstalled)
            c_treeView.ShowCategories = ((MALicenseProvider)MediaArchiveModule.ModuleLicense.LicenseProvider).IsValidCategories(MediaArchiveModule.ModuleLicense);
    }

    /// <summary>
    /// Creates a valid path for the selected page
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void ButtonSave_Click(object sender, EventArgs e)
    {
		if(IsValid)
		{
			string[] fileNames;
			string fileName = null;
			string contentType = null;
			byte[] fileValue = null;
			Guid pageID = Guid.Empty;
			Page page;
			string selectedPropertyCollection = "";
			if (!string.IsNullOrEmpty(Request[Litium.Studio.UI.Common.HTMLEditor.Constants.ParameterConstants.OWNER_ID]))
			{
				pageID = new Guid(Request[Litium.Studio.UI.Common.HTMLEditor.Constants.ParameterConstants.OWNER_ID]);
			}
			if (Request[Litium.Studio.UI.Common.HTMLEditor.Constants.ParameterConstants.PROPERTY_COLLECTION_TYPE] != null)
			{
				selectedPropertyCollection = Request[Litium.Studio.UI.Common.HTMLEditor.Constants.ParameterConstants.PROPERTY_COLLECTION_TYPE];
			}
			try
			{
				page = Litium.Foundation.Modules.CMS.Pages.Page.GetFromID(m_currentModule, pageID, FoundationContext.Token);
				if (Request.Files.Count > 0)
				{
					fileNames = Request.Files[0].FileName.Split(new Char[] {'\\'});
					fileName = fileNames[fileNames.Length - 1];
					contentType = Request.Files[0].ContentType;
					fileValue = new byte[Request.Files[0].ContentLength];
					Stream stream = Request.Files[0].InputStream;
					stream.Read(fileValue, 0, Request.Files[0].ContentLength);
				}
				ImageProperty imageProperty = null;
				if (page != null)
				{
					string propertyName = PagesStringConstants.STRING_IMAGE_PROPERTY_START + Guid.NewGuid();
					WorkingCopy workingCopy = page.GetWorkingCopy(FoundationContext.Token);
					if (selectedPropertyCollection == ((int) PropertyCollectionTypes.SETTINGS).ToString())
					{
						imageProperty = workingCopy.Settings.GetProperty(propertyName) as ImageProperty;
					}
					else
					{
						imageProperty = workingCopy.Content.GetProperty(propertyName) as ImageProperty;
					}
					if (imageProperty == null)
					{
						if (selectedPropertyCollection == ((int) PropertyCollectionTypes.SETTINGS).ToString())
						{
							imageProperty = workingCopy.Settings.CreateImageProperty(propertyName, false, true, false, FoundationContext.Token);
						}
						else
						{
							imageProperty = workingCopy.Content.CreateImageProperty(propertyName, false, true, false, FoundationContext.Token);
						}
					}
					imageProperty.SetValue(0, fileValue, contentType, fileName, null, null, FoundationContext.Token);
				}

				if (imageProperty != null)
				{
					m_imageSrc = Page.ResolveUrl(imageProperty.GetUrlToImage());
					Page.ClientScript.RegisterHiddenField("imageURL", m_imageSrc);
				}
				else
				{
					Page.ClientScript.RegisterHiddenField("imageURL", "");
				}
			}
			catch (Exception exp)
			{
				Solution.Instance.Log.CreateLogEntry("Image could not be loaded to the editor.", exp, LogLevels.ERROR);
			}
		}
    }

    /// <summary>
    /// Registers the selected image id and name as hidden variables value and the javascript to call to set these values at client side.
    /// Trigged by c_okButton.
    /// </summary>
    /// <param name="sender">c_okButton</param>
    /// <param name="e"></param>
    protected void OkButton_Click(object sender, EventArgs e)
    {
        if (!MediaArchiveInstalled)
            return;

        string fileid = Request["MediaArchiveFileID"];
        string versionid = Request["MediaArchiveFileVersionID"];

        string imagePath;
        if (!string.IsNullOrEmpty(versionid) && !versionid.Equals("null",StringComparison.OrdinalIgnoreCase) && !versionid.Equals("0"))
        {
            ImageVersion version = ImageVersion.GetFromID(MediaArchiveModule, new Guid(versionid), FoundationContext.Token);
            imagePath = version.GetUrlToVersion(false);
        }
        else if (!string.IsNullOrEmpty(fileid))
        {
            Image image = Image.GetFromID(MediaArchiveModule, new Guid(fileid), FoundationContext.Token);
            imagePath = image.GetUrlToImage(-1, -1, -1, -1);
        }
        else
        {
            imagePath = null;
        }

        if (imagePath != null)
        {
            m_imageSrc = Page.ResolveUrl(imagePath);
            Page.ClientScript.RegisterHiddenField("imageURL", m_imageSrc);
        }
        else
        {
            Page.ClientScript.RegisterHiddenField("imageURL", "");
        }
    }

    /// <summary>
    /// Inits list content
    /// </summary>
    private void InitListContent(TreeViewNode selectedNode)
    {
        if (!MediaArchiveInstalled)
            return;

        m_images = new List<File>();

        if (selectedNode != null)
        {
            if (!CategoryNode.IsCategoryNode(selectedNode))
            {
                Guid folderId = new Guid(selectedNode.Value);
                if (MediaArchiveModule.PermissionManager.UserHasFolderReadPermission(FoundationContext.Token.UserID, folderId, true, true))
                {
                    Folder folder = Folder.GetFromID(MediaArchiveModule, folderId, FoundationContext.Token);
                    if (folder != null)
                    {
                        foreach (Guid imageID in folder.Files.FileIDs)
                        {
                            if (MediaArchiveModule.PermissionManager.UserHasFileReadPermission(FoundationContext.Token.UserID, imageID, true, true))
                            {
                                File image = File.GetFromID(MediaArchiveModule, imageID, FoundationContext.Token);
                                if (image != null && image is Image)
                                {
                                    m_images.Add(image);
                                }
                            }
                        }
                    }
                }
            }
            else if (!CategoryNode.IsRootNode(selectedNode.Value))
            {
                Guid categoryId = new Guid(selectedNode.Value);
                if (MediaArchiveModule.PermissionManager.UserHasCategoryReadPermission(FoundationContext.Token.UserID, categoryId, true, true))
                {
                    Category category = Category.GetFromID(MediaArchiveModule, categoryId, FoundationContext.Token);
                    if (category != null)
                    {
                        foreach (Guid imageID in category.Members.FileIDs)
                        {
                            if (MediaArchiveModule.PermissionManager.UserHasFileReadPermission(FoundationContext.Token.UserID, imageID, true, true))
                            {
                                File image = File.GetFromID(MediaArchiveModule, imageID, FoundationContext.Token);
                                if (image != null && image is Image)
                                {
                                    m_images.Add(image);
                                }
                            }
                        }
                    }
                }
            }
        }
        // Sort the images
        if (m_images.Count > 0)
        {
            m_images.Sort(new ImageComparer(FoundationContext.Culture));
            c_repeaterList.DataSource = m_images;
            c_repeaterList.DataBind();
       
        }
        else
        {
            c_repeaterList.DataSource = null;
            c_repeaterList.DataBind();
        }
    }

    /// <summary>
    /// Inits list content
    /// </summary>
    private List<File> InitListContent(Guid folderId)
    {
        m_images = new List<File>();

        if (MediaArchiveModule.PermissionManager.UserHasFolderReadPermission(FoundationContext.Token.UserID, folderId, true, true))
        {
            Folder folder = Folder.GetFromID(MediaArchiveModule, folderId, FoundationContext.Token);
            if (folder != null)
            {
                foreach (Guid imageID in folder.Files.FileIDs)
                {
                    if (MediaArchiveModule.PermissionManager.UserHasFileReadPermission(FoundationContext.Token.UserID, imageID, true, true))
                    {
                        File image = File.GetFromID(MediaArchiveModule, imageID, FoundationContext.Token);
                        if (image != null && image is Image)
                        {
                            m_images.Add(image);
                        }
                    }
                }
            }
        }

        // Sort the images
        if (m_images.Count > 0)
        {
            m_images.Sort(new ImageComparer(FoundationContext.Culture));

            c_repeaterList.DataSource = m_images;
            c_repeaterList.DataBind();
        }
        else
        {
            c_repeaterList.DataSource = null;
            c_repeaterList.DataBind();
        }
        
        return m_images;
    }

    /// <summary>
    /// Page load
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected override void Page_Load(object sender, EventArgs e)
    {
    	m_customValidatorFileSize.ErrorMessage = Module<ModuleCMS>.Instance.Strings.GetValue(
    		Litium.Extensions.DirectEdit.Constants.PagesModuleStringConstants.VALIDATION_MESSAGE_IMAGE_TO_LARGE,
    		FoundationContext.Language.ID, true);

        if (MediaArchiveInstalled)
        {
            c_treeView.ItemSelected += new EventHandlers.TreeViewItemSelectedHandler(ItemSelected);
        
            Folder topFolder = MediaArchiveModule.GetTopFolder(FoundationContext.Token);

            if (topFolder != null)
            {
                if (!IsPostBack)
                {
                    c_treeView.SelectedItemID = topFolder.ID;
                    InitListContent(topFolder.ID);
                }
                else
                {
                    InitListContent(c_treeView.SelectedItem);
                }
            }

            if (c_treeView.SelectedItem == null || !CategoryNode.IsCategoryNode(c_treeView.SelectedItem))
            {
                ModuleMediaArchive mediaArchive = ModuleMediaArchive.Instance;
                Guid folderID;
                if (c_treeView.SelectedItem == null)
                    folderID = mediaArchive.GetTopFolderID(FoundationContext.Token);
                else
                    folderID = c_treeView.SelectedItemID;

                if (mediaArchive.PermissionManager.UserHasFolderWritePermission(FoundationContext.Token.UserID, folderID, true, true))
                {
                    m_fileUploadFieldSet.Visible = true;
                    m_fileBrowseFieldSet.Style["height"] = "298px";
                    m_fileBrowseDiv.Style["height"] = "278px";
                    string label = mediaArchive.Strings.GetValue("SelectFileFromMediaArchiveUploadLabel", FoundationContext.LanguageID, true);
                    if (string.IsNullOrEmpty(label))
                        label = "Upload file to '{0}'";
                    _lableUpload.Text = string.Format(label, Folder.GetFromID(mediaArchive, folderID, FoundationContext.Token).Name);

                    _uploadFileButton.Text = mediaArchive.Strings.GetValue("SelectFileFromMediaArchiveUploadButton", FoundationContext.LanguageID, true);

                    _checkboxCreatePreDefinedVersions.Text = mediaArchive.Strings.GetValue(Litium.Studio.UI.MediaArchive.Constants.ModuleStringConstants.TOOLBAR_CREATE_PREDEFINED_VERSIONS, FoundationContext.LanguageID, true);

                    // User should be allowed to create predefined versions on the current file only if both licences are valid.
                    bool isVersionsEnabled = ((MALicenseProvider)mediaArchive.ModuleLicense.LicenseProvider).IsValidVersions(mediaArchive.ModuleLicense);
                    bool isPredefinedVersionsEnabled = ((MALicenseProvider)mediaArchive.ModuleLicense.LicenseProvider).IsValidAutogeneratePredefinedVersions(mediaArchive.ModuleLicense);
                    _checkboxCreatePreDefinedVersions.Enabled = isVersionsEnabled && isPredefinedVersionsEnabled;
                }
                else
                {
                    m_fileUploadFieldSet.Visible = false;
                    m_fileBrowseFieldSet.Style["height"] = "370px";
                    m_fileBrowseDiv.Style["height"] = "350px";
                }
            }
            else
            {
                m_fileUploadFieldSet.Visible = false;
                m_fileBrowseFieldSet.Style["height"] = "370px";
                m_fileBrowseDiv.Style["height"] = "350px";
            }

            c_repeaterList.Visible = true;
            c_labelFiles.Text = m_moduleMediaArchive.Strings.GetValue(Litium.Studio.UI.MediaArchive.Constants.ModuleStringConstants.LABEL_IMAGES, FoundationContext.LanguageID, true);
            c_labelFoldersCategories.Text = m_moduleMediaArchive.Strings.GetValue(Litium.Studio.UI.MediaArchive.Constants.ModuleStringConstants.LABEL_FOLDERS, FoundationContext.LanguageID, true) + "/" + m_moduleMediaArchive.Strings.GetValue(Litium.Studio.UI.MediaArchive.Constants.ModuleStringConstants.LABEL_CATEGORIES, FoundationContext.LanguageID, true);
            _uploadFileButton.Text = m_moduleMediaArchive.Strings.GetValue("SelectFileFromMediaArchiveUploadButton", FoundationContext.LanguageID, true);

        }
    }

    /// <summary>
    /// Returns the image id as a guid if it's a real guid otherwise Guid.Empty
    /// </summary>
    /// <param name="imageID">Image id</param>
    /// <returns>Image id as a guid if it's a real guid otherwise Guid.Empty</returns>
    private static Guid GetImageID(string imageID)
    {
        Guid result;
        try
        {
            result = new Guid(imageID);
        }
        catch
        {
            result = Guid.Empty;
        }
        return result;
    }

    /// <summary>
    /// Returns index of an image in m_images collection
    /// </summary>
    /// <param name="imageID">Image ID</param>
    /// <returns>Index of an image in m_images collection</returns>
    private int GetImageIndex(Guid imageID)
    {
        int i = 0;
        foreach (Image image in m_images)
        {
            if (image.ID == imageID)
            {
                return i;
            }
            i++;
        }
        return -1;
    }

    /// <summary>
    /// Trigged when a node is selected on the c_treeView
    /// </summary>
    /// <param name="sender">c_treeView</param>
    /// <param name="e">Event argument containing selected page id</param>
    private void ItemSelected(object sender, ItemEventArgs e)
    {
        if (c_treeView != null && !m_eventTriggered)
        {
            m_eventTriggered = true;
            //InitListContent(c_treeView[e.ID]);

            Page.ClientScript.RegisterHiddenField("selectFromMediaArchive", "");
        }
    }

    private class ImageComparer: IComparer<File>
    {
        private readonly CultureInfo m_culture;
        public ImageComparer(CultureInfo culture)
        {
            m_culture = culture;
        }
        public int Compare(File x, File y)
        {
            return string.Compare(x.Name, y.Name,false,m_culture);
        }
    }



    protected void RepeaterList_ItemDataBound(object sender, RepeaterItemEventArgs e)
    {
        RepeaterItem repeaterItem = e.Item;
        File file = (File)repeaterItem.DataItem;

        HtmlImage htmlImage = repeaterItem.FindControl("img") as HtmlImage;
        Label c_labelName = repeaterItem.FindControl("labelName") as Label;
        Label c_labelInfo = repeaterItem.FindControl("labelInfo") as Label;
        DropDownList c_dropDownListVersions = repeaterItem.FindControl("dropDownListVersions") as DropDownList;
        HtmlTable table = repeaterItem.FindControl("itemTable") as HtmlTable;
        if (htmlImage != null)
        {
            int height, width;
            if (m_selectOnlyImages)
            {
                height = width = IMAGE_LIST_SIZE;
            }
            else
            {
                height = width = FILE_LIST_SIZE;
            }
            if (file is Image)
                htmlImage.Src = Page.ResolveUrl(((Image)file).GetUrlToImage(height, width, 0, 0, false, m_selectOnlyImages));
            else
            {
                htmlImage.Src = Page.ResolveUrl(file.GetUrlToIcon());
                htmlImage.Width = width;
                htmlImage.Height = height;
            }
        }
        if (c_labelName != null)
        {
            c_labelName.Text = file.Name;
        }
        if (c_labelInfo != null)
        {
            string[] fileName = file.FileName.Split('.');
            string extension = "";
            if (fileName.Length > 1)
            {
                extension = fileName[fileName.Length - 1].ToUpper();
            }
            if (extension != "")
            {
                c_labelInfo.Text = extension + ", ";
            }
            if (file is Image)
                c_labelInfo.Text += ((Image)file).Width + " x " + ((Image)file).Height + " px, " + (file.FileSize / 1000) + " kB";
            else
                c_labelInfo.Text += (file.FileSize / 1000) + " kB";
        }

        if (c_dropDownListVersions != null)
        {
            if (file.Versions.Count > 0)
            {
                Guid selectedVersionID = Guid.Empty;
                if (!string.IsNullOrEmpty(Request.Form[c_dropDownListVersions.UniqueID]))
                {
                    selectedVersionID = new Guid(Request.Form[c_dropDownListVersions.UniqueID]);
                }
                c_dropDownListVersions.Items.Clear();
                c_dropDownListVersions.Visible = true;
                ListItem listItem = new ListItem(m_moduleMediaArchive.Strings.GetValue(Litium.Studio.UI.MediaArchive.Constants.ModuleStringConstants.LABEL_ORIGINAL_VERSION, FoundationContext.LanguageID, true), Guid.Empty.ToString());
                c_dropDownListVersions.Items.Add(listItem);

                c_dropDownListVersions.Attributes.Add("ONCHANGE", "dropDownChanged(this);");
               
                foreach (FileVersion version in file.Versions)
                {
                    listItem = new ListItem(version.Name, version.ID.ToString());
                    c_dropDownListVersions.Items.Add(listItem);
                }

                c_dropDownListVersions.SelectedValue = selectedVersionID.ToString();
            }
            else
            {
                c_dropDownListVersions.Visible = false;
            }
        }
        if (table != null)
        {
            table.ID = file.ID.ToString();
            table.Attributes.Add("fileName", file.Name);

            table.Style["margin-bottom"] = "1px";
        }


    }


    protected void ButtonUpload_Click(object sender, EventArgs e)
    {
        if (c_treeView.SelectedItem == null || !CategoryNode.IsCategoryNode(c_treeView.SelectedItem))
        {
            if (_uploadFile.HasFile)
            {
                ModuleMediaArchive moduleMediaArchive = ModuleMediaArchive.Instance;

                Guid folderID = c_treeView.SelectedItem == null ? moduleMediaArchive.GetTopFolderID(FoundationContext.Token) : c_treeView.SelectedItemID;
                Folder folder = Folder.GetFromID(moduleMediaArchive, folderID, FoundationContext.Token);

                File file;
                if (Image.AllowedFileType(_uploadFile.FileName))
                {
                    file = folder.Files.CreateImage(Guid.NewGuid(),_uploadFile.PostedFile.InputStream, _uploadFile.FileName, FoundationContext.Token);
                    if (_checkboxCreatePreDefinedVersions.Checked)
                        file.Versions.CreateImagePredefiendVersion(FoundationContext.Token);
                }
                else
                {
                    file = folder.Files.CreateFile(Guid.NewGuid(), _uploadFile.PostedFile.InputStream, _uploadFile.FileName, FoundationContext.Token);
                }
                file.SetPermissionsToFoldersPermissions(FoundationContext.Token);

                List<File> files = InitListContent(folderID);


                int index;
                for (index = 0; index < files.Count; index++)
                {
                    File fileItem = files[index];
                    if(fileItem.ID.Equals(file.ID))
                    {
                        break;
                    }
                }
                string rowid = string.Format("c_repeaterList_ctl{0:00}_{1}", index, file.ID);
                string scriptRow = "<script type=\"text/javascript\">listRow_onClick(document.getElementById('" + rowid + "'));</script>";
                
                Page.ClientScript.RegisterStartupScript(GetType(),"Bla",scriptRow);
            }
        }
        Page.ClientScript.RegisterHiddenField("selectFromMediaArchive", "");
    }

	protected void CustomValidatorFileSize_ServerValidate(object source, ServerValidateEventArgs args)
	{
		if (Request.Files.Count > 0)
		{
			int fileSize = Request.Files[0].ContentLength;
			IntegerProperty maxImageFileSize = CurrentState.Current.Page.Settings[Litium.Extensions.DirectEdit.Constants.PropertyNameConstants.SETTINGS_MAXIMAGEFILESIZE] as IntegerProperty;
			if (maxImageFileSize != null && maxImageFileSize.ValueCount > 0)
			{
				int maxSizeInKb = maxImageFileSize.GetValue();
				int maxSizeInBytes = maxSizeInKb * 1000;
				args.IsValid = fileSize <= maxSizeInBytes;
			}
		}
	}
}