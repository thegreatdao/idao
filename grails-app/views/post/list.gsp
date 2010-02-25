<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'jquery.rating.css')}"/>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.rating.js')}"></script>
        <title>Post List</title>
		<script type="text/javascript">
			$(
				function()
				{
					var loc = window.location.pathname;
					$('span[id^="average_rating_"]').each(
						function()
						{
							var currentAverageRating = parseInt($(this).text());
							var divId = $(this).attr('id').substring(15);
							if(!isNaN(currentAverageRating))
							{
								$('div[id="' + divId + '"] input[value=' + currentAverageRating + ']').attr("checked","checked");
							}
                            else
                            {
                              var totalRatingId = $(this).attr('id').substring(15);
                              $('#total_rating_' + totalRatingId).html('<span style="color:#FEB729;">0</span>');
                              $(this).html('<span style="color:#FEB729;">N/A</span>');
                            }
							$('div[id="' + divId + '"] input[name=commentPageURI]').attr('value', loc);
						}
					);
					$('.auto-submit-star').rating(
						{
							callback: function(value, link)
							{
								var postId = this.form.id.substring(12);
								$.post('${request.contextPath}/rateable/rate/' + postId + '?type=post&xhr=true',{rating: value,ratingIsActive : true},
									function(data)
									{
										var avg = data.split(',')[0];
										var total = data.split(',')[1];
										$('#total_rating_' + postId).text(total);
										$('#average_rating_' + postId).text(avg);
									}
								);
							}
						}
					);
					$('input[value="Comment"]').click(
						function()
						{
                            var commentContainerId = $(this).attr('id').substring(15);
                            if($('#comment_body_'+commentContainerId).val()!=0 )
                            {
                              var params = $(this).parent().serialize();
                              var action = "${request.contextPath}/commentable/add";
                              var commentContainer = $('#comment_' + commentContainerId);
                              var preloader = $('#comment_loader_'+commentContainerId);
                              preloader.show();
                              $.post(
                                      action,
                                      params,
                                      function(data)
                                      {
                                        commentContainer.append(data);
                                        preloader.hide();
                                        $('#comment_body_'+commentContainerId).val('');
                                      }
                              );
                            }
						}
					);
				}
			);
		</script>
    </head>
    <body>
		<div class="grid_9" id="main_form_content">
			<div id="accordion">
				<g:each in="${postInstanceList}" status="i" var="postInstance">
					<div>
							<g:if test="${i == 0}">
								<div class="list_header_top_rounded">
								<img src="${resource(dir:'img',file:'open_bullet.png')}" class="list_bullet_arrow_closed"/>
							</g:if>
							<g:else>
								<div class="list_header">
								<img src="${resource(dir:'img',file:'closed_bullet.png')}" class="list_bullet_arrow_closed"/>
							</g:else>
							<span class="ellipse"/>
							${postInstance?.title}
							</span>
                        </div>
					</div>
					<div id="${postInstance.id}">
						<div>
							<div id="form_boby_center_bg">
								<div class="post_ajax_content">
									<div>
                                        <img src="<g:createLink controller="asset" params='[id: "${postInstance.imageURL}", post:"", imageId:"${postInstance.id}" ]'/>" id="post_title_image"/>
										${postInstance?.body}
									</div>

                                    <g:renderRating postInstance="${postInstance}"/>

                                    <g:renderComments postInstance="${postInstance}"/>
                                  
								</div>
							</div>
							<div id="form_body_bottom_bg">
							</div>
						</div>
					</div>
				</g:each>
			</div>
		</div>
		<g:renderRightSideBar/>
    </body>
</html>
