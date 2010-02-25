<div style="padding:0 30px 26px;">
  <img src="<g:createLink controller="asset" params='[id: "${postInstance.imageURL}", post:"", imageId:"${postInstance.id}" ]'/>" id="post_title_image"/>
  ${postInstance.body}
  <g:renderRating postInstance="${postInstance}"/>
  <g:renderComments postInstance="${postInstance}"/>
</div>