package com.i

class HtmlTitleController
{
    
    def index = { redirect(action:list,params:params) }

    // the delete, save and update actions only accept POST requests
    static allowedMethods = [delete:'POST', save:'POST', update:'POST']

    def list =
	{
        params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        [ htmlTitleInstanceList: HtmlTitle.list( params ), htmlTitleInstanceTotal: HtmlTitle.count() ]
    }

    def show =
	{
        def htmlTitleInstance = HtmlTitle.get( params.id )

        if(!htmlTitleInstance)
        {
            flash.message = "HtmlTitle not found with id ${params.id}"
            redirect(action:list)
        }
        else
        {
          return [ htmlTitleInstance : htmlTitleInstance ]
        }
    }

    def delete =
	{
        def htmlTitleInstance = HtmlTitle.get( params.id )
        if(htmlTitleInstance)
        {
            try
            {
                htmlTitleInstance.delete(flush:true)
                flash.message = "HtmlTitle ${params.id} deleted"
                redirect(action:list)
            }
            catch(org.springframework.dao.DataIntegrityViolationException e)
            {
                flash.message = "HtmlTitle ${params.id} could not be deleted"
                redirect(action:show,id:params.id)
            }
        }
        else
        {
            flash.message = "HtmlTitle not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def edit =
	{
		request.title = 'Title Update'
		request.isEdit = true
        def htmlTitleInstance = HtmlTitle.get( params.id )

        if(!htmlTitleInstance)
        {
            flash.message = "HtmlTitle not found with id ${params.id}"
            redirect(action:list)
        }
        else
        {
            return [ htmlTitleInstance : htmlTitleInstance ]
        }
    }

    def update =
	{
        def htmlTitleInstance = HtmlTitle.get( params.id )
        if(htmlTitleInstance)
        {
            if(params.version)
            {
                def version = params.version.toLong()
                if(htmlTitleInstance.version > version)
                {
                    
                    htmlTitleInstance.errors.rejectValue("version", "htmlTitle.optimistic.locking.failure", "Another user has updated this HtmlTitle while you were editing.")
                    render(view:'edit',model:[htmlTitleInstance:htmlTitleInstance])
                    return
                }
            }
            htmlTitleInstance.properties = params
            if(!htmlTitleInstance.hasErrors() && htmlTitleInstance.save())
            {
                flash.message = "HtmlTitle ${params.id} updated"
                redirect(action:show,id:htmlTitleInstance.id)
            }
            else
            {
                render(view:'edit',model:[htmlTitleInstance:htmlTitleInstance])
            }
        }
        else
        {
            flash.message = "HtmlTitle not found with id ${params.id}"
            redirect(action:list)
        }
    }

    def create =
	{
		request.title = 'Title creation'
        def htmlTitleInstance = new HtmlTitle()
        htmlTitleInstance.properties = params
        render(view:'title_form', model:['htmlTitleInstance':htmlTitleInstance])
    }

    def save =
	{
        def htmlTitleInstance = new HtmlTitle(params)
        if(!htmlTitleInstance.hasErrors() && htmlTitleInstance.save())
        {
            flash.message = "HtmlTitle ${htmlTitleInstance.id} created"
            redirect(action:show,id:htmlTitleInstance.id)
        }
        else
        {
            render(view:'create',model:[htmlTitleInstance:htmlTitleInstance])
        }
    }
}
