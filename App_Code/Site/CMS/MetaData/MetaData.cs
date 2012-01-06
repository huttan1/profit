using System;
using System.Collections.Generic;
using System.Drawing;
using System.Linq;
using Litium.Foundation.Modules.CMS.Carriers;
using Litium.Foundation.Modules.CMS.Content;
using Litium.Foundation.Modules.CMS.Pages;
using Litium.Foundation.Security;
using Litium.Plus.Utilities;

namespace App_Code.Site.CMS.MetaData
{
    public class Metadata : IEquatable<Metadata>
    {
        public Guid ID { get; set; }
        public string Name { get; internal set; }
        public string HeadLine { get; internal set; }
        public string Text { get; internal set; }
        public string Image { get; set; }
        public int ImageWidth { get; set; }
        public int ImageHeight { get; set; }
        public bool IsMediaArchiveImage { get; set; }
        public bool IsCategory { get; set; }
        public MetadataType Type { get; set; }

        // Subject propertys
        public Guid FocusPage { get; internal set; }
        public string FocusPageText { get; internal set; }
        public bool HasFocusPage { get; private set; }
        public bool IsCurrent { get; internal set; }

        /// <summary>
        /// The name of the <see cref="StringShortProperty"/> that holds selected metadata.
        /// </summary>
        public const string PropertyNameSelectedMetadata = "SelectedMetadata";

        public Metadata(PageInfoCarrier carrier, MetadataService service)
        {
            ID = carrier.ID;
            Name = carrier.ShortName;
            IsCategory = carrier.Children.Length > 0;

            SetType(carrier.PageTypeID, service);
        }

        public Metadata(Guid id, string name, string headLine, string text, bool isCategory, string imageUrl, int width, int height, bool isMaImage, MetadataType type)
        {
            ID = id;
            Name = name;
            HeadLine = headLine;
            Text = text;
            IsCategory = isCategory;
            Image = imageUrl;
            ImageWidth = width;
            ImageHeight = height;
            IsMediaArchiveImage = isMaImage;
            Type = type;
        }

        public Metadata(Page page, MetadataService service, SecurityToken token)
        {
            ID = page.ID;
            Name = page.ShortName;
            SetType(page.PageTypeID, service);
            InitFields(page, token);
        }

        private void SetType(Guid pageTypeID, MetadataService service)
        {
            if (pageTypeID == service.PageTypeMetadataSubjectID)
            {
                Type = MetadataType.Subject;
            }
            else if (pageTypeID == service.PageTypeMetadataTypeID)
            {
                Type = MetadataType.Type;
            }
        }

        protected void InitFields(Page page, SecurityToken token)
        {
            IsCategory = page.Children.Count > 0;

            object[] imageValues = GetImageValues(page.Content, "Image");

            if (imageValues != null)
            {
                Image = (string)imageValues[0];
                ImageWidth = (int)imageValues[1];
                ImageHeight = (int)imageValues[2];
                IsMediaArchiveImage = (bool)imageValues[3];
            }

            if (Type == MetadataType.Subject)
            {
                HeadLine = PropertyUtilities.GetStringPropertyValue(page.Content, "Title");
                Text = PropertyUtilities.GetStringPropertyValue(page.Content, "Text");
            }
        }

        public virtual List<Metadata> GetSubMetadatas(MetadataService service, SecurityToken token)
        {
            if (IsCategory)
            {
                Page page = Page.GetFromID(ID, token);
                return (from id in page.Children.ChildrenIDs
                        select new Metadata(Page.GetFromID(id, token), service, token)).ToList();
            }

            return null;
        }
        private object[] GetImageValues(PropertyCollection collection, string propertyName)
        {
            ImageBaseProperty image = collection[propertyName] as ImageBaseProperty;

            if (image != null && image.ValueCount > 0)
            {
                string imageUrl = image.GetUrlToImage();

                if (imageUrl.StartsWith("~/"))
                    imageUrl = imageUrl.Substring(1);

                return new object[] { imageUrl, image.GetWidth(), image.GetHeight(), image is ImageFromMediaArchiveProperty };
            }
            return null;
        }

        /// <summary>
        /// Returns an url to the images specified on the metadata, sets width and height parameters automatically.
        /// </summary>
        /// <param name="minWidth">Width of the min.</param>
        /// <param name="minHeight">Height of the min.</param>
        /// <param name="maxWidth">Width of the max.</param>
        /// <param name="maxHeight">Height of the max.</param>
        /// <returns></returns>
        public string GetUrlToImage(int minWidth, int minHeight, int maxWidth, int maxHeight)
        {
            if (!string.IsNullOrEmpty(Image) && ImageHeight > 0 && ImageWidth > 0)
            {
                string urlToImage = Image;

                Size size = Litium.Foundation.Modules.MediaArchive.Files.Image.GetNewSize(new Size(ImageWidth, ImageHeight), new Size(maxWidth, maxHeight), new Size(minWidth, minHeight));

                if (IsMediaArchiveImage)
                {
                    urlToImage += "&" + Litium.Foundation.Modules.MediaArchive.Files.Image.PARAMETER_IMAGE_HEIGHT + "=" + size.Height + "&" + Litium.Foundation.Modules.MediaArchive.Files.Image.PARAMETER_IMAGE_WIDTH + "=" + size.Width;
                }
                else
                {
                    urlToImage += "&" + Litium.Foundation.Modules.CMS.GUI.Constants.ParameterConstants.RESIZE_HEIGHT + "=" + size.Height + "&" + Litium.Foundation.Modules.CMS.GUI.Constants.ParameterConstants.RESIZE_WIDTH + "=" + size.Width;
                }

                return urlToImage;
            }

            return string.Empty;
        }

        public bool Equals(Metadata other)
        {
            return ID == other.ID;
        }
    }
}