<%@ Control Language="C#" AutoEventWireUp="false" ClassName="FileList" %>

<web:ValueExists Name="Files" runat="server">
	<OnTrue>
		<div class="filelist">
			<h2><web:WebSiteString Name="SiteFileListHeader" runat="server" /></h2>
			<ul class="files plain">
				<web:FileList Name="Files" runat="server">
					<ItemTemplate>
						<li class="container">
							<web:FileLink runat="server">
								<web:FileIcon runat="server" /><web:FileName runat="server" UseMediaArchiveName="false" HideFileExtension="false" />
								<span class="filesize">(<web:FileSize runat="server" BlockSize="1024" NumberFormatString="#,##0.000" /> kB)</span>
							</web:FileLink>
						</li>
                    </ItemTemplate>
				</web:FileList>
			</ul>
		</div>
	</OnTrue>
</web:ValueExists>