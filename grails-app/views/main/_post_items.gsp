<%@ page import="com.i.Post" %>
<g:each var="postInstance" in="${postInstances}">
	<div class="item">
		<a href="<g:createLink controller="post" action="show" id="${postInstance.id}"/>">
		<img src="<g:createLink controller="asset" params='[id: "${postInstance.imageURL}", post:"", imageId:"${postInstance.id}" ]'/>" class="previewImg" title="">
		</a>
		<div class="summary">						
			<h5><a href="<g:createLink controller="post" action="show" id="${postInstance.id}"/>" class="ellipse" title="${postInstance.title}">${postInstance.title}</a></h5>						
			<div class="read_more"><a href="<g:createLink controller="post" action="show" id="${postInstance.id}"/>"><g:message code="read.more"/></a></div>
			<div class="clear"></div>
			<p>
				<g:renderElipses body="${postInstance.body}"/>
			</p>
		</div>
	</div>
	<div class="clear"></div>
</g:each>