<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>${title?.name}</title>
		<meta name="layout" content="main"/>	
	</head>
	<body>
		<div class="grid_9" id="main_content">
			<div id="main_content_top">			
			</div>
			<div id="main_content_boby">
              <g:each var="postInstance" in="${postInstances}">
				<div class="item">
					<img src="<g:createLink controller="asset" params='[id: "${postInstance.imageURL}", post:"", imageId:"${postInstance.id}" ]'/>" class="previewImg" title="">
					<div class="summary">						
						<h5><a href="<g:createLink controller="post" action="show" id="${postInstance.id}"/>" class="ellipse" title="${postInstance.title}">${postInstance.title}</a></h5>						
						<div class="read_more"><a href="<g:createLink controller="post" action="show" id="${postInstance.id}"/>">read more</a></div>
						<div class="clear"></div>
						<p>
							<g:renderElipses body="${postInstance.body}"/>
						</p>
					</div>
				</div>
				<div class="clear"></div>
			  </g:each>
			</div>
			<div id="main_content_bottom">			
			</div>
		</div>				
		
		<g:renderRightSideBar/>
		
		<div class="grid_4 category">
			<img src="${resource(dir:'img',file:'cat_1.png')}"/>
			<h5><a href="#">I-ching</a></h5>
			<div class="single_category">
				<ul>
					<g:each var="post" in="${request.iChingPosts}">
						<li><a href="<g:createLink controller="post" action="show" id="${post.id}"/>"><span class="ellipse">${post.title}</span></a></li>
					</g:each>				
				</ul>
			</div>
		</div>
		<div class="grid_4 category">
			<img src="${resource(dir:'img',file:'cat_2.png')}"/>
			<h5><a href="#">Dao-de-jing</a></h5>
			<div class="single_category">
				<ul>
					<g:each var="post" in="${request.daoDeJingPosts}">
						<li><a href="<g:createLink controller="post" action="show" id="${post.id}"/>"><span class="ellipse">${post.title}</span></a></li>
					</g:each>
				</ul>
			</div>
		</div>
		<div class="grid_4 category">
			<img src="${resource(dir:'img',file:'cat_3.png')}"/>
			<h5><a href="#">Zen Buddhaism</a></h5>
			<div class="single_category">
				<ul>
					<g:each var="post" in="${request.zenBuPosts}">
						<li><a href="<g:createLink controller="post" action="show" id="${post.id}"/>"><span class="ellipse">${post.title}</span></a></li>
					</g:each>	
				</ul>
			</div>
		</div>
		<div class="clear"></div>
	</body>
</html>