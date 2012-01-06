<%@ Page Language="C#" %>

<%@ Import Namespace="System.Data" %>
<%@ Import Namespace="Litium.Foundation" %>
<%@ Import Namespace="System.Data.SqlClient" %>
<%@ Import Namespace="Litium.Foundation.GUI" %>
<%@ Import Namespace="Litium.Foundation.Log" %>
<%@ Import Namespace="Litium.Foundation.Modules.CMS.Routing" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script runat="server">

	private static string GetOldReadableDisplayName(string displayName)
	{
		if (!String.IsNullOrEmpty(displayName))
		{
			var re1 = new Regex("[åääâáà]");
			var re2 = new Regex("[öóòôö]");
			var re3 = new Regex("[éèéèê€ë]");

			var re4 = new Regex("[ÅÄÄÂÁÀ]");
			var re5 = new Regex("[ÖÓÒÔÖ]");
			var re6 = new Regex("[ÉÈËÊ€]");

			var re7 = new Regex("[/\\\\,;: &?+.\"´`'!#¤%=@£${\\[\\]}~]", RegexOptions.IgnoreCase);

			return re7.Replace(re6.Replace(re5.Replace(re4.Replace(re3.Replace(re2.Replace(re1.Replace(displayName, "a"), "o"), "e"), "A"), "O"), "E"), "_");
		}
		return displayName;
	}

	private static void FixProductHistory()
	{
		const string fetchSql = @"
SELECT ParentProductGroupID, LanguageID, ProductID, UrlAlias, HistoryDateTime FROM ProductCatalog_Product_UrlHistory;

SELECT P.ProductGroupID, LanguageID, P.ProductID, P.SequentialNumber, V.VariantName
  FROM ProductCatalog_VariantName V
  INNER JOIN ProductCatalog_Product P ON P.VariantID = V.VariantID;
";
		var historyNames = new DataTable();
		historyNames.Columns.Add("ParentProductGroupID", typeof(Guid));
		historyNames.Columns.Add("LanguageID", typeof(Guid));
		historyNames.Columns.Add("ProductID", typeof(Guid));
		historyNames.Columns.Add("UrlAlias", typeof(string));
		historyNames.Columns.Add("HistoryDateTime", typeof(DateTime));

		historyNames.Constraints.Add("HistoryFinder1", new[] { historyNames.Columns[0], historyNames.Columns[1], historyNames.Columns[3] }, true);

		// fix article alias
		using (var cn = new SqlConnection(Solution.Instance.DataSettings.ConnectionString))
		{
			cn.Open();
			using (var cmd = cn.CreateCommand())
			{
				cmd.CommandText = fetchSql;
				cmd.CommandType = CommandType.Text;

				using (var reader = cmd.ExecuteReader())
				{
					// read all old url's
					while (reader.Read())
						historyNames.Rows.Add(reader.GetGuid(0),
											  reader.GetGuid(1),
											  reader.GetGuid(2),
											  reader.GetString(3),
											  reader.GetDateTime(4));
					reader.NextResult();

					// read articles
					while (reader.Read())
					{
						var productGroupID = (Guid)reader["ProductGroupID"];
						var languageID = (Guid)reader["LanguageID"];
						var productID = (Guid)reader["ProductID"];
						var seqNr = (long)reader["SequentialNumber"];
						var name = (string)reader["VariantName"];

						string readableValue = GetOldReadableDisplayName(name);
						var urls = new[]
 						{
 							RoutingService.Instance.SuggestUrl(null, name),
 							readableValue + "-" + seqNr,
 							readableValue + "-" + seqNr + ".aspx"
 						};

						foreach (var url in urls)
						{
							if (string.IsNullOrEmpty(url)) continue;

							if (historyNames.Select("ParentProductGroupID = '" + productGroupID + "' AND LanguageID = '" + languageID + "' AND UrlAlias = '" + url.Replace("'", "''") + "'").Length == 0)
								historyNames.Rows.Add(productGroupID, languageID, productID, url, DateTime.Now);
						}
					}
				}

				using (var transaction = cmd.Transaction = cmd.Connection.BeginTransaction())
				{
					cmd.CommandText = @"truncate table ProductCatalog_Product_UrlHistory;";
					cmd.ExecuteNonQuery();
					using (var bulkCopy = new SqlBulkCopy(cmd.Connection, SqlBulkCopyOptions.Default, transaction))
					{
						bulkCopy.BatchSize = 1000;

						bulkCopy.DestinationTableName = "ProductCatalog_Product_UrlHistory";
						bulkCopy.WriteToServer(historyNames);
					}
					transaction.Commit();
				}
			}
		}
	}

	private static void FixArticleUrl()
	{
		const string fetchSql = @"
SELECT ArticleID, ArticleNumber FROM ProductCatalog_Article;

SELECT AL.ArticleID, AL.LanguageID, AU.UrlAlias FROM ProductCatalog_Article_Language AL
LEFT JOIN ProductCatalog_Article_Url AU ON AL.ArticleID = AU.ArticleID AND AL.LanguageID = AU.LanguageID;

SELECT V.ArticleID, V.ArticleNumber, LanguageDependent, LanguageID, ShortStringValue
FROM ProductCatalog_Article V
LEFT JOIN ProductCatalog_ArticlePropertyValue APV ON V.ArticleID = APV.ArticleID AND ShortStringValue IS NOT NULL AND LEN(ShortStringValue) > 0
INNER JOIN ProductCatalog_TemplateField TF ON APV.TemplateFieldID = TF.TemplateFieldID
INNER JOIN ProductCatalog_Template_TemplateField T ON T.TemplateID = V.TemplateID AND TF.TemplateFieldID = T.TemplateFieldID AND T.IsDisplayName = 1 
WHERE 
V.ArticleID IN (SELECT AL.ArticleID FROM ProductCatalog_Article_Language AL
LEFT JOIN ProductCatalog_Article_Url AU ON AL.ArticleID = AU.ArticleID AND AL.LanguageID = AU.LanguageID
WHERE AU.UrlAlias IS NULL);

";
		var article = new DataTable();
		article.Columns.Add("ArticleID", typeof(Guid));
		article.Columns.Add("ArticleNumber", typeof(string));
		article.Constraints.Add("HistoryFinder1", new[] { article.Columns[0] }, true);

		var articleUrl = new DataTable();
		articleUrl.Columns.Add("ArticleID", typeof(Guid));
		articleUrl.Columns.Add("LanguageID", typeof(Guid));
		articleUrl.Columns.Add(new DataColumn("UrlAlias", typeof(string)) { AllowDBNull = true });
		articleUrl.Constraints.Add("HistoryFinder1", new[] { articleUrl.Columns[0], articleUrl.Columns[1] }, true);
		articleUrl.Constraints.Add("HistoryFinder2", new[] { articleUrl.Columns[0], articleUrl.Columns[1], articleUrl.Columns[2] }, false);

		// fix article alias
		using (var cn = new SqlConnection(Solution.Instance.DataSettings.ConnectionString))
		{
			cn.Open();
			using (var cmd = cn.CreateCommand())
			{
				cmd.CommandText = fetchSql;
				cmd.CommandType = CommandType.Text;

				using (var reader = cmd.ExecuteReader())
				{
					// read all article number
					while (reader.Read())
						article.Rows.Add(reader.GetGuid(0),
										 reader.GetString(1));
					reader.NextResult();

					// read all old url's
					while (reader.Read())
						articleUrl.Rows.Add(reader.GetGuid(0),
											reader.GetGuid(1),
											reader.IsDBNull(2) ? null : reader.GetString(2));
					reader.NextResult();
					var c = 1;
					// read article information
					while (reader.Read())
					{
						var articleID = (Guid)reader["ArticleID"];
						var articleNumber = (string)reader["ArticleNumber"];
						var languageDependent = (bool)reader["LanguageDependent"];
						var languageID = reader["LanguageID"] == DBNull.Value ? Guid.Empty : (Guid)reader["LanguageID"];
						var propertyValue = (string)reader["ShortStringValue"];

						string readableValue = GetOldReadableDisplayName(propertyValue);
						var urls = new[]
					    {
					        RoutingService.Instance.SuggestUrl(null, readableValue),
					        RoutingService.Instance.SuggestUrl(null, readableValue + "-" + articleNumber),
					        RoutingService.Instance.SuggestUrl(null, readableValue + "-" + articleNumber + "-b" + (c++)),
					        RoutingService.Instance.SuggestUrl(null, articleNumber)
					    };

						if (languageDependent)
						{
							foreach (var row in articleUrl.Select("ArticleID = '" + articleID + "' AND LanguageID = '" + languageID + "' AND UrlAlias IS NULL"))
							{
								foreach (var url in urls)
								{
									if (string.IsNullOrEmpty(url))
										continue;

									if (articleUrl.Select("LanguageID = '" + languageID + "' AND UrlAlias = '" + url.Replace("'", "''") + "'").Length == 0)
										if (row["UrlAlias"] == null || row["UrlAlias"] == DBNull.Value)
										{
											row["UrlAlias"] = url;
											break;
										}
								}
							}
						}
						else
						{
							foreach (var row in articleUrl.Select("ArticleID = '" + articleID + "' AND UrlAlias IS NULL"))
							{
								foreach (var url in urls)
								{
									if (string.IsNullOrEmpty(url)) continue;

									if (articleUrl.Select("LanguageID = '" + row["LanguageID"] + "' AND UrlAlias = '" + url.Replace("'", "''") + "'").Length > 0)
										continue;

									if (row["UrlAlias"] == null || row["UrlAlias"] == DBNull.Value)
									{
										row["UrlAlias"] = url;
										break;
									}
								}
							}
						}
						c++;
					}
				}

				foreach (var row in articleUrl.Select("UrlAlias IS NULL"))
				{
					var rows = article.Select("ArticleID = '" + row["ArticleID"] + "'");
					if (rows.Length > 0)
					{
						var url = RoutingService.Instance.SuggestUrl(null, rows[0]["ArticleNumber"].ToString());
						if (string.IsNullOrEmpty(url) || articleUrl.Select("LanguageID = '" + row["LanguageID"] + "' AND UrlAlias = '" + url.Replace("'", "''") + "'").Length > 0)
							row.Delete();
						else
							row["UrlAlias"] = url;
					}
					else
						row.Delete();
				}
				using (var transaction = cmd.Transaction = cmd.Connection.BeginTransaction())
				{
					cmd.CommandText = @"TRUNCATE TABLE ProductCatalog_Article_Url;";
					cmd.ExecuteNonQuery();
					using (var bulkCopy = new SqlBulkCopy(cmd.Connection, SqlBulkCopyOptions.Default, transaction))
					{
						bulkCopy.BatchSize = 1000;

						bulkCopy.DestinationTableName = "ProductCatalog_Article_Url";
						bulkCopy.WriteToServer(articleUrl);
					}
					transaction.Commit();
				}
			}
		}
	}

	protected void Page_Load(object sender, EventArgs e)
	{
		if (!FoundationContext.Current.Token.HasSolutionPermission(0, true, true))
		{
			c_result.Text += @"<br /><font color=red>You need login as a user with solution permission.</font>";
			return;
		}
		
		try
		{
			FixProductHistory();
			c_result.Text += @"<br />Product url: <font color=green>Success</font>";
		}
		catch (Exception ex)
		{
			c_result.Text += @"<br />Product url: <font color=red>Failure</font>:" + ex.Message;
			Solution.Instance.Log.CreateLogEntry(ex.Message, ex, LogLevels.ERROR);
		}

		try
		{
			FixArticleUrl();
			c_result.Text += @"<br />Article url: <font color=green>Success</font>";
		}
		catch (Exception ex)
		{
			c_result.Text += @"<br />Article url: <font color=red>Failure</font>:" + ex.Message;
			Solution.Instance.Log.CreateLogEntry(ex.Message, ex,LogLevels.ERROR);
		}
	}
</script>
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
	<title></title>
</head>
<body>
	<form id="form1" runat="server">
	<div>
		<asp:Label runat="server" ID="c_result" />
	</div>
	</form>
</body>
</html>
