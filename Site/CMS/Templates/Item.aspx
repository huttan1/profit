<%@ Page Language="C#" CodeFile="Item.aspx.cs" Inherits="Site.CMS.Templates.Item" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">


       
	<div id="primary" class="grid_3_6 alpha">    
            <div class="item">
	            <div class="item_holder">
	                <h1 class="item_title"><web:Text runat="server" Name="Title" /></h1>    
                    <div class="item_info">
                        <p>
                        <web:ValueExists Name="OriginalURL" runat="server">
                        <OnTrue>
                            <span class="item_info_by"><a href="<web:Text Name='OriginalURL' runat='server' />"><web:Text Name="Original" runat="server" /></a> </span>
                        </OnTrue>
                        <OnFalse>
                            <span class="item_info_by"><a href="<%=CurrentState.Page.GetUrlToPage(CurrentState.WebSite.ID, CurrentState.IsInAdministrationMode)%>">www.trueorfalse.nu</a> </span>
                        </OnFalse>
                        </web:ValueExists>
                        </p>
                    </div>
                    <div class="item_info">
                        <p>
                            <span class="item_info_by">written by <web:PublishedBy runat="server" /></span>
                            <span class="item_info_date"><web:DateTime runat="server" Name="Date" /> </span>
                            <span class="item_info_comments">no comments</span>
                        </p>
                    </div>
                    <div class="item_content"> 
                        <web:ValueExists Name="Text" runat="server">
                            <OnTrue>
                            <web:Text runat="server" Name="Text" />
                            </OnTrue>
                        </web:ValueExists>
                    </div>
                    <div class="item_picture">
                        <web:Image runat="server" Name="Image" MinWidth="330" MaxWidth="330" />
                    </div>
                    <div style="clear:both;"></div>
                    <div class="item_content_fullwidth">
                    <web:ValueExists ID="ValueExists1" Name="TextMore" runat="server">
                            <OnTrue>                                 
                                    <web:Text ID="Text1" runat="server" Name="TextMore" />                                                      
                            </OnTrue>
                        </web:ValueExists>
                    </div>
                    <div style="clear:both;"></div>
                    <div class="item_info">
                                <p>
                                    <span class="item_info_true">77% true</span>
                                    <span class="item_info_untrue">23% false</span>
                            
                                </p>
                    </div>
	            </div>
            </div>

            <div class="item_comments">
            <objectpostcomment:ObjectPostComment runat="server" />
            </div>
	</div>
	

	
	<div id="tertiary" class="grid_3 omega">
             <div class="itemright">
	                    <div class="itemright_holder">
		                    <web:ValueExists ID="ValueExists2" Name="TextMoreRight" runat="server">
                                    <OnTrue>                                 
                                            <web:Text runat="server" Name="TextMoreRight" />                                                      
                                    </OnTrue>
                            </web:ValueExists>
                        </div>
            </div>
	</div>
	


</asp:Content>