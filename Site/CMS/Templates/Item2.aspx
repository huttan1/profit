<%@ Page Language="C#" AutoEventWireup="false" Inherits="App_Code.Site.CMS.Templates.BaseTemplate" %>

<asp:Content ContentPlaceHolderID="Content" runat="server">
<script type="text/javascript" src="<%= Page.ResolveUrl("~/ui/js/video.js") %>"></script>
<script type="text/javascript">
	// Must come after the video.js library

	// Add VideoJS to all video tags on the page when the DOM is ready
	VideoJS.setupAllWhenReady();

	/* ============= OR ============ */

	// Setup and store a reference to the player(s).
	// Must happen after the DOM is loaded
	// You can use any library's DOM Ready method instead of VideoJS.DOMReady

	/*
	VideoJS.DOMReady(function(){
      
	// Using the video's ID or element
	var myPlayer = VideoJS.setup("example_video_1");
      
	// OR using an array of video elements/IDs
	// Note: It returns an array of players
	var myManyPlayers = VideoJS.setup(["example_video_1", "example_video_2", video3Element]);

	// OR all videos on the page
	var myManyPlayers = VideoJS.setup("All");

	// After you have references to your players you can...(example)
	myPlayer.play(); // Starts playing the video for this player.
	});
	*/

	/* ========= SETTING OPTIONS ========= */

	// Set options when setting up the videos. The defaults are shown here.

	/*
	VideoJS.setupAllWhenReady({
	controlsBelow: false, // Display control bar below video instead of in front of
	controlsHiding: true, // Hide controls when mouse is not over the video
	defaultVolume: 0.85, // Will be overridden by user's last volume if available
	flashVersion: 9, // Required flash version for fallback
	linksHiding: true // Hide download links when video is supported
	});
	*/

	// Or as the second option of VideoJS.setup

	/*
	VideoJS.DOMReady(function(){
	var myPlayer = VideoJS.setup("example_video_1", {
	// Same options
	});
	});
	*/

  </script>

	<h1><web:Text Name="Title" runat="server" /></h1>

	<web:Image Name="Image1" CssClass="main" MaxWidth="220" runat="server" />

	<web:ValueExists Name="Introduction" runat="server">
		<OnTrue>
			<p class="intro"><web:Text Name="Introduction" runat="server" /></p>
		</OnTrue>
	</web:ValueExists>
	<web:ValueExists Name="YouTubeURL" runat="server">
		<OnTrue>		
		<object width="425" height="350">
		<param name="movie" value="<web:Text Name='YouTubeURL' runat='server' />"></param>
		<param name="wmode" value="transparent"></param>
		<embed src="<web:Text Name='YouTubeURL' runat='server' />" type="application/x-shockwave-flash" wmode="transparent" width="425" height="350">
		</embed>
		</object>	
			
		</OnTrue>
	</web:ValueExists>
	

	<web:ValueExists Name="MP4File" runat="server">
	<OnTrue>
  <!-- Begin VideoJS -->
              <div class="video-js-box">
                <!-- Using the Video for Everybody Embed Code http://camendesign.com/code/video_for_everybody -->
                <video id="example_video_1" class="video-js" width="640" height="264" controls="controls" preload="auto" poster="/ui/img/oceans-clip.png">
                  <source src="<web:FileSrc Name=MP4File runat=server />" type='video/mp4; codecs="avc1.42E01E, mp4a.40.2"' />                  
                  <!-- Flash Fallback. Use any flash video player here. Make sure to keep the vjs-flash-fallback class. -->
                  <object id="flash_fallback_1" class="vjs-flash-fallback" width="640" height="264" type="application/x-shockwave-flash"
                    data="/ui/swf/flowplayer-3.2.1.swf">
                    <param name="movie" value="/ui/swf/flowplayer-3.2.1.swf" />
                    <param name="allowfullscreen" value="true" />
                    <param name="flashvars" value='config={"playlist":["/ui/oceans-clip.png", {"url": "<web:FileSrc Name=MP4File runat=server />","autoPlay":false,"autoBuffering":true}]}' />
                    <!-- Image Fallback. Typically the same as the poster image. -->
                    <img src="/ui/img/oceans-clip.png" width="640" height="264" alt="Poster Image"
                      title="No video playback capabilities." />
                  </object>
                </video>
                <!-- Download links provided for devices that can't play video in the browser. -->
                <p class="vjs-no-video"><strong>Download Video:</strong>
                  <a href="<web:FileSrc Name=MP4File runat=server />">MP4</a>                  
                  <!-- Support VideoJS by keeping this link. -->
                  <a href="http://videojs.com">HTML5 Video Player</a> by VideoJS
                </p>
              </div>
  <!-- End VideoJS -->
    
	</OnTrue>
	</web:ValueExists>





    <site:LinkList runat="server" />
    <site:FileList runat="server" />

</asp:Content>