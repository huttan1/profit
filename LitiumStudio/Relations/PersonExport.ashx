<%@ WebHandler Language="C#" debug="true" Class="Litium.Studio.UI.Relations.Common.Utilities.PersonExport" %>

using System;
using System.Collections;
using System.Data;
using System.Text;
using System.Web;
using System.Web.SessionState;
using Litium.Foundation.GUI;
using Litium.Foundation.Modules.Relations;
using Litium.Foundation.Modules.Relations.FieldDefinitions;
using Litium.Foundation.Modules.Relations.Fields;
using Litium.Foundation.Modules.Relations.FieldTemplates;
using Litium.Studio.UI.Relations.Common.Constants;

namespace Litium.Studio.UI.Relations.Common.Utilities
{
    public class PersonExport : IHttpHandler, IRequiresSessionState
    {
        public void ProcessRequest(HttpContext context)
        {

            //Fetch stuff from session...
            FoundationContext foundation = FoundationContext.Current;
            if (foundation != null)
            {
                ModuleRelations m_currentModule = ModuleRelations.Instance;

                ArrayList persons = context.Session[SessionConstants.PERSON_GRID_MULTISELECTED] as ArrayList;

                StringBuilder exportText = new StringBuilder();

                if (m_currentModule != null)
                {
                    Hashtable fields = new Hashtable();
                    foreach (FieldTemplate template in m_currentModule.FieldTemplates)
                    {
                        if (template.FieldTemplateType.Equals(FieldTemplateType.Person))
                        {
                            foreach (FieldTemplateField templateField in template.FieldTemplateFields)
                            {
                                if (!fields.ContainsKey(templateField.ID))
                                {
                                    fields.Add(templateField.ID, templateField.FieldDefinition);
                                }
                            }
                        }
                    }

                    DataTable personsDT = new DataTable();
					personsDT.Locale = FoundationContext.Current.Culture;
                    personsDT.Columns.Add(FieldNameConstants.PERSON_PERSON_ID, Type.GetType("System.Guid"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_FIRST_NAME, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_MIDDLE_NAME, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_LAST_NAME, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_CUSTOMER_NUMBER, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_TITLE, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_EMAIL, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_COMPANY, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_ADDRESS1, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_ADDRESS2, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_ZIP_CODE, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_CITY, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_COUNTRY, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_PHONE_HOME, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_PHONE_WORK, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_PHONE_MOBILE, Type.GetType("System.String"));

                    personsDT.Columns.Add(FieldNameConstants.BILLING_EMAIL, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.BILLING_ADDRESS1, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.BILLING_ADDRESS2, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.BILLING_ZIP_CODE, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.BILLING_CITY, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.BILLING_COUNTRY, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.BILLING_PHONE, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.BILLING_PHONE_MOBILE, Type.GetType("System.String"));
                    
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_EMAIL, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_ADDRESS1, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_ADDRESS2, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_ZIP_CODE, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_CITY, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_COUNTRY, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_PHONE, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.DELIVERY_PHONE_MOBILE, Type.GetType("System.String"));
                    
                    personsDT.Columns.Add(FieldNameConstants.PERSON_GENDER, Type.GetType("System.String"));
                    personsDT.Columns.Add(FieldNameConstants.PERSON_COMMENTS, Type.GetType("System.String"));

                   
                    // Add every field as new column in person dataset and to the hash-table for searching
                    foreach (FieldDefinition fieldDefinition in fields.Values)
                    {
                        string name = fieldDefinition.Name;
                        if (personsDT.Columns.Contains(name))
                        {
                            name = fieldDefinition.ID.ToString();
                        }
                        switch (fieldDefinition.GetType().ToString())
                        {
                            case "Litium.Foundation.Modules.Relations.FieldDefinitions.BooleanFieldDefinition":
                                {
                                    personsDT.Columns.Add(name, Type.GetType("System.Boolean"));
                                    break;
                                }
                            case "Litium.Foundation.Modules.Relations.FieldDefinitions.DateTimeFieldDefinition":
                                {
                                    personsDT.Columns.Add(name, Type.GetType("System.DateTime"));
                                    break;
                                }
                            case "Litium.Foundation.Modules.Relations.FieldDefinitions.NumberFieldDefinition":
                                {
                                    personsDT.Columns.Add(name, Type.GetType("System.Double"));
                                    break;
                                }
                            case "Litium.Foundation.Modules.Relations.FieldDefinitions.FileFieldDefinition":
                                {
                                    //personsDT.Columns.Add(fieldDefinition.Name, Type.GetType("System.String"));
                                    break;
                                }
                            case "Litium.Foundation.Modules.Relations.FieldDefinitions.ImageFieldDefinition":
                                {
                                    //personsDT.Columns.Add(fieldDefinition.Name, Type.GetType("System.String"));
                                    break;
                                }
                            default:
                                {
                                    personsDT.Columns.Add(name, Type.GetType("System.String"));
                                    break;
                                }
                        }
                    }


                    if (persons != null)
                    {
                        foreach (Guid personId in persons)
                        {
                            Litium.Foundation.Modules.Relations.Persons.Person person = m_currentModule.Persons[personId];
							if (person == null)
								continue;

                            DataRow dr = personsDT.NewRow();
                            dr[FieldNameConstants.PERSON_PERSON_ID] = person.ID;
                            dr[FieldNameConstants.PERSON_FIRST_NAME] = person.FirstName;
                            dr[FieldNameConstants.PERSON_MIDDLE_NAME] = person.MiddleName;
                            dr[FieldNameConstants.PERSON_LAST_NAME] = person.LastName;
                            dr[FieldNameConstants.PERSON_CUSTOMER_NUMBER] = person.CustomerNumber;
                            dr[FieldNameConstants.PERSON_TITLE] = person.Title;
                            dr[FieldNameConstants.PERSON_EMAIL] = person.Email;
                            dr[FieldNameConstants.PERSON_COMPANY] = person.Company;
                            dr[FieldNameConstants.PERSON_ADDRESS1] = person.Address1;
                            dr[FieldNameConstants.PERSON_ADDRESS2] = person.Address2;
                            dr[FieldNameConstants.PERSON_ZIP_CODE] = person.PostalCode;
                            dr[FieldNameConstants.PERSON_CITY] = person.City;
                            dr[FieldNameConstants.PERSON_COUNTRY] = person.Country;
                            dr[FieldNameConstants.PERSON_PHONE_HOME] = person.PhoneHome;
                            dr[FieldNameConstants.PERSON_PHONE_WORK] = person.PhoneWork;
                            dr[FieldNameConstants.PERSON_PHONE_MOBILE] = person.PhoneMobile;

                            dr[FieldNameConstants.BILLING_EMAIL] = person.BillingAddress.Email;
                            dr[FieldNameConstants.BILLING_ADDRESS1] = person.BillingAddress.Address1;
                            dr[FieldNameConstants.BILLING_ADDRESS2] = person.BillingAddress.Address2;
                            dr[FieldNameConstants.BILLING_ZIP_CODE] = person.BillingAddress.Zip;
                            dr[FieldNameConstants.BILLING_CITY] = person.BillingAddress.City;
                            dr[FieldNameConstants.BILLING_COUNTRY] = person.BillingAddress.Country;
                            dr[FieldNameConstants.BILLING_PHONE] = person.BillingAddress.Phone;
                            dr[FieldNameConstants.BILLING_PHONE_MOBILE] = person.BillingAddress.MobilePhone;

                            dr[FieldNameConstants.DELIVERY_EMAIL] = person.DeliveryAddress.Email;
                            dr[FieldNameConstants.DELIVERY_ADDRESS1] = person.DeliveryAddress.Address1;
                            dr[FieldNameConstants.DELIVERY_ADDRESS2] = person.DeliveryAddress.Address2;
                            dr[FieldNameConstants.DELIVERY_ZIP_CODE] = person.DeliveryAddress.Zip;
                            dr[FieldNameConstants.DELIVERY_CITY] = person.DeliveryAddress.City;
                            dr[FieldNameConstants.DELIVERY_COUNTRY] = person.DeliveryAddress.Country;
                            dr[FieldNameConstants.DELIVERY_PHONE] = person.DeliveryAddress.Phone;
                            dr[FieldNameConstants.DELIVERY_PHONE_MOBILE] = person.DeliveryAddress.MobilePhone;


                            
                            dr[FieldNameConstants.PERSON_GENDER] = person.IsFemale.ToString();
                            dr[FieldNameConstants.PERSON_COMMENTS] = person.Comments;

                            //dr[FieldNameConstants.PERSON_DELIVERIES] = person.;
                            //dr[FieldNameConstants.PERSON_PAYMENTS] = person.;
                            
                            foreach (Field field in person.CustomFields)
                            {
                                string name = field.Name;
                                if(!ColumnExists(name,dr))
                                {
                                    name = field.FieldDefinition.ID.ToString();
                                }
                                
                                if (ColumnExists(name,dr))
                                {
                                    if (field is StringField)
                                    {
                                        dr[name] = ((StringField)field).Value;
                                    }
                                    else if (field is NumberField)
                                    {
                                        dr[name] = ((NumberField)field).Value.ToString(foundation.Culture.NumberFormat);
                                    }
                                    else if (field is BooleanField)
                                    {
                                        dr[name] = ((BooleanField)field).Value.ToString();
                                    }
                                    else if (field is DateTimeField)
                                    {
                                        dr[name] = ((DateTimeField)field).Value.ToString(foundation.Culture.DateTimeFormat);
                                    }
                                }
                            }
                            personsDT.Rows.Add(dr);
                        }

                    }
                    // Column names
                    for (int i = 0; i < personsDT.Columns.Count; i++)
                    {

                        exportText.Append(personsDT.Columns[i].ColumnName);
                        exportText.Append(";");
                    }
                    if (exportText.Length > 0)
                    {
                        exportText.Remove(exportText.Length - 1, 1);
                        exportText.Append("\r\n");
                    }


                    // All rows
                    foreach (DataRow dr in personsDT.Rows)
                    {
                        for (int i = 0; i < personsDT.Columns.Count; i++)
                        {
                             exportText.Append(ReplaceBadChars(dr[i].ToString()));
                             exportText.Append(";");
                        }

                        exportText.Remove(exportText.Length - 1, 1);
                        exportText.Append("\r\n");
                    }

                }
                System.IO.StringWriter tw = new System.IO.StringWriter(exportText);
                
                context.Response.AddHeader("Content-Disposition", "attachment;filename=export.csv;");
                context.Response.ContentType = "text/csv";
                context.Response.Charset = Encoding.Default.EncodingName;
                
                context.Response.Cache.SetCacheability(HttpCacheability.NoCache);
                context.Response.Cache.SetNoStore();
                context.Response.Cache.SetExpires(DateTime.MinValue);


                context.Response.ContentEncoding = Encoding.Default;
                
                context.Response.Write(tw.ToString());

            }
        }

        public bool IsReusable
        {
            get { return false; }
        }

    /// <summary>
    /// Checks wheter a column exists in the DataRow or not
    /// </summary>
    /// <param name="name">Name of the column</param>
    /// <param name="dr">The DataRow containing the column</param>
    /// <returns></returns>
    private static bool ColumnExists(string name, DataRow dr)
    {
        #region -- ColumnExists --
        try
        {
            if (dr[name] != null)
            {
                return true;
            }
        }
        catch
        {
            return false;
        }
        return false;
        #endregion
    }


        private static string ReplaceBadChars(string inString)
        {
            const char carrigeReturn = (char)13;
            const char lineFeed = (char)10;
            const char semiColon = (char)59;

            return inString.Replace(carrigeReturn.ToString(), "\\n").Replace(lineFeed.ToString(), "\\r").Replace(semiColon.ToString(), ",");
            
        }
   
   }
}