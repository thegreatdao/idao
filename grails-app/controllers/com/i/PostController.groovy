package com.i

import org.granite.tide.annotations.TideEnabled

@TideEnabled
class PostController
{
  /**
   * this gets rid of exception for not using native acceleration
   */
  static{
    System.setProperty("com.sun.media.jai.disableMediaLib", "true");
  }

  List post
  def flexPosts =
  {
    post = Post.list();
  }

  def burningImageService
  def index = { redirect(action:list,params:params) }

  static allowedMethods = [delete:'POST', save:'POST', update:'POST']

  def list =
  {
    params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
    def postInstanceList = null
    if(params.category)
    {
      def category = Category.get(params.category)
	  if(category)
	  {
		request.category = category.id
		}
      postInstanceList = Post.findAllByCategory(category, [params])
    }
    else
    {
      postInstanceList =  Post.list( params )
    }
	post = postInstanceList
    request.postInstanceList = postInstanceList	
  }

  def show =
  {
    def postInstance = Post.get( params.id )
	request.category = postInstance.category.id
    if(!postInstance)
    {
      flash.message = "Post not found with id ${params.id}"
      redirect(action:list)
    }
    else
    {
      request.title = postInstance.title
      request.postInstance = postInstance
      render view:'post_content'
    }
  }

  def ajaxShow =
  {
    render(template:'post_content');
  }

  def delete =
  {
    def postInstance = Post.get( params.id )
    if(postInstance)
    {
      try
      {
        postInstance.delete(flush:true)
        flash.message = "Post ${params.id} deleted"
        redirect(action:list)
      }
      catch(org.springframework.dao.DataIntegrityViolationException e)
      {
        flash.message = "Post ${params.id} could not be deleted"
        redirect(action:show,id:params.id)
      }
    }
    else
    {
      flash.message = "Post not found with id ${params.id}"
      redirect(action:list)
    }
  }

  def getPostImgsAndLinks =
  {
    def postInstances = Post.list(max:8)
    request.postInstance = postInstances
  }

  def edit =
  {
    request.title = 'Post Update'
    request.isEdit = true
    def postInstance = Post.get( params.id )
    if(!postInstance)
    {
      flash.message = "User not found with id ${params.id}"
      redirect(action:list)
    }
    else
    {
      request.postInstance = postInstance
      render(view:'post_form')
    }

  }

  def update =
  {
    def postInstance = Post.get( params.id )
    if(postInstance)
    {
      if(params.version)
      {
        def version = params.version.toLong()
        if(postInstance.version > version)
        {
          postInstance.errors.rejectValue("version", "post.optimistic.locking.failure", "Another user has updated this Post while you were editing.")
          render(view:'edit',model:[postInstance:postInstance])
          return
        }
      }
      postInstance.properties = params
      if(!postInstance.hasErrors() && postInstance.save())
      {
        flash.message = "Post ${params.id} updated"
        redirect(action:show,id:postInstance.id)
      }
      else
      {
        render(view:'edit',model:[postInstance:postInstance])
      }
    }
    else
    {
      flash.message = "Post not found with id ${params.id}"
      redirect(action:list)
    }
  }

  def create =
  {
    request.title = 'Create Post'
    def postInstance = new Post()
    postInstance.properties = params
    render(view:'post_form')
  }

  def save =
  {
    def postInstance = new Post(params)
    postInstance.user = getAuthUserDomain()
    postInstance.dateCreated = new Date()
    if(!postInstance.hasErrors())
    {
      def uploadedFile = request.getFile('titleImg')
      def newPostInstance = postInstance.merge(flush:true)
      if(newPostInstance)
      {
        def imageName = ''
        if(!uploadedFile.isEmpty())
        {
          def postId = newPostInstance.id
          def fileInfo = [:]
          fileInfo.baseDir = grailsApplication.config.post.main.folder
          fileInfo.width = grailsApplication.config.post.image.default.width
          fileInfo.height = grailsApplication.config.post.image.default.height
          fileInfo.thumbnailWidth = grailsApplication.config.post.thumbnail.default.width
          fileInfo.thumbnailHeight = grailsApplication.config.post.thumbnail.default.height
          fileInfo.file = uploadedFile
          fileInfo.id = postId
          imageName = BurningImageHelper.burnImage(fileInfo, burningImageService)
          newPostInstance.imageURL = imageName
          newPostInstance.save()          
        }
        flash.message = "Post created"
        redirect(action:show,id:newPostInstance.id)
      }
      else
      {
        render(view:'create',model:[postInstance:postInstance])
      }
    }
    else
    {
      render(view:'create',model:[postInstance:postInstance])
    }
  }
}
