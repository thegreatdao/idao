package com.i

class TaggableController
{
	def postTag = {
		def postInstance = null
		def tag = params['tag']
		def postId = params['postId']
		if(tag && postId)
		{
			postId= params['postId'] as Long			
			postInstance = Post.get(postId)
			def tags = postInstance.tags
			if(tags.size() < 5 && !tags.contains(tag))
			{
				postInstance.addTag(params['tag'])
				tags = postInstance.tags
				def lastTag = tags.get(tags.size()-1)
				render "{success:true, tag: '${lastTag}'}"
			}
			else
			{
				render "{compromise:true}"
			}
		}
		else
		{
			render "{fail:true}"
		}
	}
}
