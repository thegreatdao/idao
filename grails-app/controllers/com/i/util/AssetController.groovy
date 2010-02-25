package com.i.util

class AssetController
{
	def view =
	{
		def folder = null
        def baseUserFolder = "$grailsApplication.config.user.main.folder$params.imageId"
        def userThumbnailFolder = "$baseUserFolder/thumbnail"
        def basePostFolder = "$grailsApplication.config.post.main.folder$params.imageId"
        def postThumbnailFolder = "$basePostFolder/thumbnail"
		params.keySet().each
		{
			if(it == 'user')
			{
				folder = baseUserFolder
			}
			else if(it == 'userThumbnail')
			{
				folder = userThumbnailFolder
			}
			else if(it == 'post')
			{
				folder = basePostFolder
			}
			else if(it == 'postThumbnail')
			{
				folder = postThumbnailFolder
			}
		}
		if(params.id && folder)
		{
			def file = new File(folder + '/' +  params.id)
            if(!file.exists())
            {
                file = new File(grailsApplication.config.iching.default.image)
            }
            response.outputStream << file.readBytes()
		}
		else
		{
			response.outputStream << ''
		}
	}
}
