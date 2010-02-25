<div>
	<div id="form_boby_center_bg">
		<div class="post_ajax_content">
			<div>
				<img src="${resource(dir:'img',file:'gua/qian.png')}" style="float:left; margin-right:15px;margin-bottom:10px;"/>
				${postInstance?.body}				
			</div>
			<div style="padding:10px 0 0 480px;">
				<script type="text/javascript" src="${resource(dir:'js',file:'jquery.rating.js')}"></script>
				<form>
					<script>
						$(
							function()
							{
								var currentAverageRating = parseInt(${postInstance?.averageRating});
								$('input[value=' + currentAverageRating + ']').attr("checked","checked");
								$('.auto-submit-star').rating(
									{
										callback: function(value, link)
									    {
											$.post('${request.contextPath}/rateable/rate/${postInstance?.id}?type=post&xhr=true',{rating: value,ratingIsActive : true},
												function(data)
												{
													var avg = data.split(',')[0];
													var total = data.split(',')[1];
													alert('average is ' + avg + ' total rating is ' + total);
												}
											);
										}
									}
								);
							}
						);
					</script>
					<input name="rating" type="radio" value="1" title="1" class="auto-submit-star"/>
					<input name="rating" type="radio" value="2" title="2" class="auto-submit-star"/>
					<input name="rating" type="radio" value="3" title="3" class="auto-submit-star"/>
					<input name="rating" type="radio" value="4" title="4" class="auto-submit-star"/>
					<input name="rating" type="radio" value="5" title="5" class="auto-submit-star"/>
				</form>
			</div>
			<div class="clear"></div>
			<div>
				<form class="comment" style="border-top:1px solid gray;margin-top:10px;">
					<textarea name="comment"></textarea>
					<input type="button" value="Comment">
				</form>
			</div>
		</div>
	</div>
	<div id="form_body_bottom_bg">
	</div>
</div>