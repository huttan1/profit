<%@ Control Language="C#" AutoEventWireup="false" ClassName="Footer" %>
<web:ValueExists ID="ValueExists1" Name="FooterImage" runat="server">
        <OnTrue>
            <div id="footer" class="grid_12" style="background-image: url('<web:ImageSrc Name='FooterImage' runat='server' />');">			
		    </div> <!-- #footer -->
        </OnTrue>
        <OnFalse>
        <web:UsePage ID="UsePage1" StructureLevel="1" runat="server">
           <div id="footer" class="grid_12" style="background-image: url('<web:ImageSrc Name='FooterImage' runat='server' />');">
		   </div>
        </web:UsePage>
        </OnFalse>
</web:ValueExists>