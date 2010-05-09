package com.i

class RendererTagLib
{

  def renderRightSideBar =
  {
    attrs, body ->
	def tags = Post.allTags
	if(!session.tagsMap)
	{
		def tagsVar = new StringBuilder("")
		tags.each
		{
			def count = Post.countByTag(it) + 10
			tagsVar.append("<a href='${request.contextPath}/post/list?tag=${it}' style='${count}'>${it}</a>")
		}		
		session.tagsVar = tagsVar.toString()
	}
    def postInstances = Post.list(max:8)
    out << render (template:'/common/right_side_bar', model : [postInstances:postInstances])
  }

  def renderComments =
  {
    attrs, body ->
    def postInstance = attrs.postInstance
    out << render (template:'/post/comments', model : [postInstance : postInstance])
  }

  def renderComment = 
  {
	attrs, body ->
    def comment = attrs.comment
	out << render (template:'/post/comment', model : [comment : comment])
  }
  
  def renderElipses =
  {
    attrs, body ->
    def elipsesResult = attrs.body
    if(elipsesResult.length() > 200)
      elipsesResult = "${elipsesResult.substring(0,160)}..."
    out << elipsesResult
  }

  def renderRating =
  {
    attrs, body ->
    def postInstance = attrs.postInstance
    out << render (template:'/post/rating', model:[postInstance : postInstance])
  }

  def renderTags =
  {
	attrs, body ->
	def tags = attrs.tags
	def postInstanceId = attrs.postInstanceId
	out << render (template:'/taggable/tags', model:[tags : tags, postInstanceId : postInstanceId])
  }
}
