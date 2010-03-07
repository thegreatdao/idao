package com.i

class CategoryController
{
	
	def index = { redirect(action:list,params:params) }

	static allowedMethods = [delete:'POST', save:'POST', update:'POST']
	
	def list =
	{
		params.max = Math.min( params.max ? params.max.toInteger() : 10,  100)
        def s =       Category.list( params )
		[ categoryInstanceList: Category.list( params ), categoryInstanceTotal: Category.count() ]
	}
	
	def show =
	{
		def categoryInstance = Category.get( params.id )
		
		if(!categoryInstance)
		{
			flash.message = "Category not found with id ${params.id}"
			redirect(action:list)
		}
		else
		{
			return [ categoryInstance : categoryInstance ]
		}
	}
	
	def delete =
	{
		def categoryInstance = Category.get( params.id )
		if(categoryInstance)
		{
			try
			{
				categoryInstance.delete(flush:true)
				flash.message = "Category ${params.id} deleted"
				redirect(action:list)
			}
			catch(org.springframework.dao.DataIntegrityViolationException e)
			{
				flash.message = "Category ${params.id} could not be deleted"
				redirect(action:show,id:params.id)
			}
		}
		else
		{
			flash.message = "Category not found with id ${params.id}"
			redirect(action:list)
		}
	}
	
	def edit =
	{
		request.title = 'Category Update'
		request.isEdit = true
		def categoryInstance = Category.get( params.id )
		
		if(!categoryInstance)
		{
			flash.message = "Category not found with id ${params.id}"
			redirect(action:list)
		}
		else
		{
			request.categoryInstance = categoryInstance
			render(view:'category_form')			
		}
	}
	
	def update =
	{
		def categoryInstance = Category.get( params.id )
		if(categoryInstance)
		{
			if(params.version)
			{
				def version = params.version.toLong()
				if(categoryInstance.version > version)
				{
					
					categoryInstance.errors.rejectValue("version", "category.optimistic.locking.failure", "Another user has updated this Category while you were editing.")
					render(view:'edit',model:[categoryInstance:categoryInstance])
					return
				}
			}
			categoryInstance.properties = params
			if(!categoryInstance.hasErrors() && categoryInstance.save())
			{
				flash.message = "Category ${params.id} updated"
				redirect(action:show,id:categoryInstance.id)
			}
			else
			{
				render(view:'edit',model:[categoryInstance:categoryInstance])
			}
		}
		else
		{
			flash.message = "Category not found with id ${params.id}"
			redirect(action:list)
		}
	}
	
	def create =
	{
		request.title = 'Category Creation'
		def categoryInstance = new Category()
		categoryInstance.properties = params
		request.categoryInstance = categoryInstance
		render(view:'category_form')
	}
	
	def save =
	{
		def categoryInstance = new Category(params)
		if(!categoryInstance.hasErrors() && categoryInstance.save())
		{
			flash.message = "Category ${categoryInstance.id} created"
			redirect(action:show,id:categoryInstance.id)
		}
		else
		{
			render(view:'category_form',model:[categoryInstance:categoryInstance])
		}
	}
}
