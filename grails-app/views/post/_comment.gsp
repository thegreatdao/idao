<li>
    <div class="individual_comment">
      <img src="<g:createLink controller="asset" params='[id: "${comment.poster.profile.profileImage}", userThumbnail:"", imageId:"${comment.poster.id}" ]'/>" />
      <div class="user_comment">
       <div>
         <span class="poster">${comment.poster.nickName}</span>
         <span style="margin-left:2px;">${comment.body}</span>
       </div>
       <div class="date">
         <g:formatDate format='MMM,dd yyyy k:m:s' date='${comment.dateCreated}'/>
        </div>
      </div>
    </div>
</li>