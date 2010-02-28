package com.i

import org.hibernate.SessionFactory

class MainController
{
	def sessionFactory
	
    def index = 
	{
		def query = 'SELECT * FROM html_title ORDER BY RAND() LIMIT 1;'
		def title = sessionFactory.getCurrentSession().createSQLQuery(query).addEntity(HtmlTitle.class).uniqueResult()
        def postInstances = Post.list([max:6, order:'desc', sort:'dateCreated'])		
		def iChingPosts = Post.findAllByCategory(Category.get(1), [max:5] )
		def daoDeJingPosts = Post.findAllByCategory(Category.get(2), [max:5])
		def zenBuPosts = Post.findAllByCategory(Category.get(3), [max:5])
		request.category = 0
		render (view:'index', model:[title:title, postInstances:postInstances, iChingPosts:iChingPosts, daoDeJingPosts:daoDeJingPosts, zenBuPosts:zenBuPosts])
	}
}
