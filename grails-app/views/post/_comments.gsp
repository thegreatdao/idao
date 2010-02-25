<div class="comment">
    <ul id="comment_${postInstance.id}">
      <g:each var="comment" in="${postInstance.comments}">
         <g:renderComment comment="${comment}"/>
      </g:each>
    </ul>
    <form>
        <textarea name="comment.body" id="comment_body_${postInstance.id}"></textarea>
        <input type="hidden" value="comments" name="update"/>
        <input type="hidden" value="${postInstance.id}" name="commentLink.commentRef"/>
        <input type="hidden" value="com.i.Post" name="commentLink.type"/>
        <input type="hidden" value="" name="commentPageURI"/>
        <input type="button" value="Comment" id="comment_submit_${postInstance.id}">
        <img src="${resource(dir:'img',file:'loading.gif')}" class="comment_loader" id="comment_loader_${postInstance.id}"/>
    </form>
</div>
