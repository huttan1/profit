<%@ Page Language="C#" AutoEventWireup="false" Inherits="App_Code.Site.CMS.Templates.BaseTemplate" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">

	   <site:Header runat="server" />

	<div id="primary" style="width:730px;" class="grid_6 alpha">
        
            <div style="padding:5px;">
		        <web:Text ID="Text3" Name="Text" runat="server" />
            </div>
        
	</div>     
	<div class="PuffList">
		<web:ChildRepeater ID="ChildRepeater1" RenderEmpty="true" OnInit="InitList" runat="server">           
			<ItemTemplate>
				<div class="Puff">
                <center>
					<web:PageLink Name="Link" runat="server"><web:Image Name="Image" MaxWidth="75" runat="server" /></web:PageLink>
                        <br />
                     <web:PageLink Name="Link" runat="server"><web:Text Name="Text" CssClass="PuffLink" runat="server" /></web:PageLink>
                    				                
                </center>
				</div>                
			</ItemTemplate>
		</web:ChildRepeater>       
    </div>    
<%--     <plus:IsPageLevel ID="IsPageLevel1" MinLevel="2" runat="server">
            <OnTrue>
                <web:UsePage ID="UsePage1" StructureLevel="2" runat="server">
                    <web:PageLink ID="PageLink1" runat="server">
                        Tillbaka till <web:Shortname ID="Shortname1" runat="server" />
                    </web:PageLink>
                </web:UsePage>
            </OnTrue>
        </plus:IsPageLevel>--%>
    
    

    <site:LinkList runat="server" />
    <site:FileList runat="server" />

</asp:Content>