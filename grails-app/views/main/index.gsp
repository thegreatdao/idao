<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<title>${title?.name}</title>
		<meta name="layout" content="main"/>	
	</head>
	<body>
		
		<g:applyLayout name="../common/emptybody" template="../main/post_items"/>
		
		<g:renderRightSideBar/>
		
		<div class="grid_4 category">
			<img src="${resource(dir:'img',file:'cat_1.png')}"/>
			<h5><a href="#"><g:message code="I-Ching"/></a></h5>
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
			<h5><a href="#"><g:message code="Dao"/></a></h5>
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
			<h5><a href="#"><g:message code="Zen-Buddhaism"/></a></h5>
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