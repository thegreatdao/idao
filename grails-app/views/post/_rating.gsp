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
    Total rating is :<span id="total_rating_${postInstance.id}" class="rating">${postInstance?.totalRatings}</span> Average is:<span id="average_rating_${postInstance.id}" class="rating">${postInstance?.averageRating}</span>
</div>
<div class="clear"></div>