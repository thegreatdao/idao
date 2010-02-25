package com.i

import grails.test.*

class CategoryTests extends GrailsUnitTestCase
{
    void testCategory()
	{
		def profile = new Profile(fullName : 'Hongli Li',profileImage: 'http://google.ca')
		def iUser = new User(nickName: 'joe', firstName : 'hongli', lastName : 'li', password: 'secret', profile: profile).save()
		def category = new Category(name : 'iching', chineseName : 'Ò×¾­').save();
		def post = new Post(body: 'this is a body', imageURL: 'http://www.image.com')		
		category.addToPosts(post)
		iUser.addToPosts(post)

        def foundUser = User.get(iUser.id)
		foundUser.posts.collect{print it.category.name}

		def foundCategory = Category.get(category.id);
		assertEquals 'iching', foundCategory.name
	}
}
