<div class="rating_form">
    <form id="rating_form_${postInstance.id}">
        <input name="rating" type="radio" value="1" title="1" class="auto-submit-star"/>
        <input name="rating" type="radio" value="2" title="2" class="auto-submit-star"/>
        <input name="rating" type="radio" value="3" title="3" class="auto-submit-star"/>
        <input name="rating" type="radio" value="4" title="4" class="auto-submit-star"/>
        <input name="rating" type="radio" value="5" title="5" class="auto-submit-star"/>
    </form>
</div>
<div class="float_right_container">
	<div class="tags" id="tags_${postInstance.id}">
		<g:renderTags tags="${postInstance.tags}" postInstanceId="${postInstance.id}"/>
	</div>
    <div style="float:right;">Total rating is :<span id="total_rating_${postInstance.id}" class="rating">${postInstance?.totalRatings}</span> Average is:<span id="average_rating_${postInstance.id}" class="rating">${postInstance?.averageRating}</span></div>
	<div class="clear"></div>
	<div class="tag_form" id="tag_form_${postInstance.id}">
		<form>
			<input type="text" id="tag_content_${postInstance.id}"/>
			<input type="button" value="Tag" id="tag_submit_${postInstance.id}"/>
			<img src="${resource(dir:'img',file:'loading.gif')}" class="comment_loader" id="comment_loader_rating_${postInstance.id}"/>
		</form>		
	</div>
</div>
<div class="clear"></div>
