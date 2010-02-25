package com.i

class RendererTagLib
{

  def renderRightSideBar =
  {
    attrs, body ->
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

  def renderSearchItem =
  {
    attrs , body ->
    def searchItem = attrs.searchItem
    out << render (template:'/common/emptybody', model : [searchItem : searchItem])
  }
  
}
