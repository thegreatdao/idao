<div id="standalone_content">
  <img src="<g:createLink controller="asset" params='[id: "${postInstance.imageURL}", post:"", imageId:"${postInstance.id}" ]'/>" id="post_title_image"/>
  ${postInstance.body}
  <g:renderRating postInstance="${postInstance}"/>
  <g:renderComments postInstance="${postInstance}"/>
</div>