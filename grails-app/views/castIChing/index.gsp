<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>${title}</title>
		<meta name="layout" content="main" />
        <link rel="stylesheet" type="text/css" href="${resource(dir:'css',file:'jquery.rating.css')}"/>
		<link rel="stylesheet" type="text/css" href="${resource(dir:'history',file:'history.css')}"/>		
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.rating.js')}"></script>
		<script src="AC_OETags.js" language="javascript"></script>
		<script src="history/history.js" language="javascript"></script>

		<script language="JavaScript" type="text/javascript">
		<!--

		var requiredMajorVersion = 9;

		var requiredMinorVersion = 0;

		var requiredRevision = 124;

		// -->
		</script>

		<script type="text/javascript">
		  $(
			function()
			{
				
			}
		  );
		</script>	  	  	  	  	  	  	  		  
    </head>
    <body>
		<div class="grid_9" id="main_form_content">
					<div style="height:560px; width:680px; padding-left:10px; padding-right:10px;">
					<script language="JavaScript" type="text/javascript">
					<!--
					// Version check for the Flash Player that has the ability to start Player Product Install (6.0r65)
					var hasProductInstall = DetectFlashVer(6, 0, 65);

					// Version check based upon the values defined in globals
					var hasRequestedVersion = DetectFlashVer(requiredMajorVersion, requiredMinorVersion, requiredRevision);

					if ( hasProductInstall && !hasRequestedVersion ) {
						// DO NOT MODIFY THE FOLLOWING FOUR LINES
						// Location visited after installation is complete if installation is required
						var MMPlayerType = (isIE == true) ? "ActiveX" : "PlugIn";
						var MMredirectURL = window.location;
						document.title = document.title.slice(0, 47) + " - Flash Player Installation";
						var MMdoctitle = document.title;

						AC_FL_RunContent(
							"src", "playerProductInstall",
							"FlashVars", "MMredirectURL="+MMredirectURL+'&MMplayerType='+MMPlayerType+'&MMdoctitle='+MMdoctitle+"",
							"width", "100%",
							"height", "100%",
							"align", "middle",
							"id", "mainapp",
							"quality", "high",
							"bgcolor", "white",
							"name", "mainapp",
							"wmode", "transparent",
							"allowScriptAccess","sameDomain",
							"type", "application/x-shockwave-flash",
							"pluginspage", "http://www.adobe.com/go/getflashplayer"
						);
					} else if (hasRequestedVersion) {
						// if we've detected an acceptable version
						// embed the Flash Content SWF when all tests are passed
						AC_FL_RunContent(
								"src", "i",
								"width", "100%",
								"height", "100%",
								"align", "middle",
								"id", "mainapp",
								"quality", "high",
								"bgcolor", "white",
								"name", "mainapp",
								"wmode", "transparent",
								"allowScriptAccess","sameDomain",
								"type", "application/x-shockwave-flash",
								"pluginspage", "http://www.adobe.com/go/getflashplayer"
						);
					  } else {  // flash is too old or we can't detect the plugin
						var alternateContent = 'Alternate HTML content should be placed here. '
						+ 'This content requires the Adobe Flash Player. '
						+ '<a href=http://www.adobe.com/go/getflash/>Get Flash</a>';
						document.write(alternateContent);  // insert non-flash content
					  }
					// -->
					</script>
					<noscript>
						<object classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000"
								id="mainapp" width="100%" height="100%"
								codebase="http://fpdownload.macromedia.com/get/flashplayer/current/swflash.cab">
								<param name="movie" value="i.swf" />
								<param name="quality" value="high" />
								<param name="bgcolor" value="white" />
								<param name="wmode" value="transparent"/> 
								<param name="allowScriptAccess" value="sameDomain" />
								<embed src="i.swf" quality="high" bgcolor="white"
									width="100%" height="100%" name="mainapp" align="middle"
									play="true"
									loop="false"
									quality="high"
									allowScriptAccess="sameDomain"
									type="application/x-shockwave-flash"
									pluginspage="http://www.adobe.com/go/getflashplayer">
								</embed>
						</object>
					</noscript>
					</div>
			</div>
		<g:renderRightSideBar/>
    </body>
</html>
