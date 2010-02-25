package com.i
import grails.converters.*

class UserController
{
    def authenticateService
	def burningImageService
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list = 
	{
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ userInstanceList: User.list( params ), userInstanceTotal: User.count() ]
    }

    def show = 
	{
        def userInstance = User.get( params.id )

        if(!userInstance) 
		{
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
        else { return [ userInstance : userInstance ] }
    }

    def delete = 
	{
        def userInstance = User.get( params.id )
        if(userInstance) 
		{
            try 
			{
                userInstance.delete(flush:true)
                flash.message = "User ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e) 
			{
                flash.message = "User ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else 
		{
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit = 
	{
		request.title = 'User Update'
		request.isEdit = true
        def userInstance = User.get( params.id )

        if(!userInstance)
		{
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
        else
		{
			request.userInstance = userInstance
			render(view:'user_form')
        }
    }

    def update = 
	{
        def userInstance = User.get( params.id )
        if(userInstance) 
		{
            if(params.version) 
			{
                def version = params.version.toLong()
                if(userInstance.version > version)
				{                    
                    userInstance.errors.rejectValue("version", "user.optimistic.locking.failure", "Another user has updated this User while you were editing.")
                    render(view:'edit',model:[userInstance:userInstance])
                    return
                }
            }
			bindData(userInstance, params, ['nickName'])
			userInstance.password= authenticateService.encodePassword(params.password)
            if(!userInstance.hasErrors() && userInstance.save()) 
			{
                flash.message = "User ${params.id} updated"
                redirect(action:show,id:userInstance.id)
            }
            else 
			{
                request.userInstance = userInstance
                forward(action:'edit')
            }
        }
        else 
		{
            flash.message = "User not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create = 
	{
		request.title = 'User Registration'
		def userInstance = request.userInstance
		if(!userInstance)
		{
			userInstance = new User()
			userInstance.properties = params
			request.userInstance = userInstance
		}
		render(view:'user_form')
    }

    def save = 
	{
        def userInstance = new User(params)
		userInstance.password= authenticateService.encodePassword(params.password)
        def imageName = ''
        if(!userInstance.hasErrors() && userInstance.save())
		{
            def userId = userInstance.nickName
			def uploadedFile = request.getFile('file');
            def fileInfo = [:]
            fileInfo.baseDir = grailsApplication.config.user.main.folder
            fileInfo.width = grailsApplication.config.user.image.default.width
            fileInfo.height = grailsApplication.config.user.image.default.height
            fileInfo.thumbnailWidth = grailsApplication.config.user.thumbnail.default.width
            fileInfo.thumbnailHeight = grailsApplication.config.user.thumbnail.default.height
            fileInfo.file = uploadedFile
            fileInfo.id = userInstance.id
            imageName = BurningImageHelper.burnImage(fileInfo, burningImageService)
            userInstance.profile.profileImage = imageName
            userInstance.save()
			
            flash.message = "User ${userInstance.id} created"
            redirect(action:show,id:userInstance.id)
        }
        else
		{
			forward(action:"create", model:[userInstance:userInstance])
        }
    }
	
	def checkUser = 
	{
		def user = User.findByNickName(params.validateValue)
		def json = 	null
		def validateId = params.validateId
		def validateError = params.validateError
		if(user)
		{
			json = [jsonValidateReturn : [validateId, validateError, 'false']] as JSON
		}
		else
		{
			json = [jsonValidateReturn : [validateId, validateError, 'true']] as JSON
		}
		render json
	}
}
