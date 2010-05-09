<script>
	$(
		function()
		{
			var imgId = ${postInstanceId};
			$('#tag_img_${postInstanceId}').toggle(
				function()
				{							
					$('#tag_form_${postInstanceId}').show();
				},
				function()
				{							
					$('#tag_form_${postInstanceId}').hide();
				}
			);
			$('#tag_submit_' + imgId).click(
				function()
				{
					$('#comment_loader_rating_' + imgId).show();
					var tag = $('#tag_content_${postInstanceId}').val();
					$.post("<g:createLink controller="taggable" />",
						{postId:${postInstanceId}, tag:tag},
						function(data)
						{							
							if(data.success)
							{
								$('#comment_loader_rating_' + imgId).hide();
								$('#tag_content_${postInstanceId}').val('');								
								var newTag = '<a href="#" class="tag">' + data.tag + "</a>";
								if($('#tags_${postInstanceId} a:last-child"').size() != 0)
								{
									$('#tags_${postInstanceId} a:last-child"').after(newTag);
								}
								else
								{
									$('#tag_img_${postInstanceId}').after(newTag);
								}
							}
						}
					,'json');
				}
			);
		}
	)
</script>
<img id="tag_img_${postInstanceId}" src="${resource(dir:'img',file:'tag.png')}" class="tag_img"/>	
<g:each var="tag" in="${tags}">
	<a href="${request.contextPath}/post/list?tag=${tag}" class="tag">${tag}</a>
</g:each>