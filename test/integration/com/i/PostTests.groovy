package com.i

import grails.test.*

class PostTests extends GrailsUnitTestCase
{
	void testSavePost()
	{
		def profile = new Profile(fullName : 'Hongli Li',profileImage: 'http://google.ca')
		def user = new User(nickName: 'joe', firstName : 'hli', lastName : 'li', password: 'secret', profile: profile).save()
		assertNotNull user
		println user
		def category = new Category(name : 'iching', chineseName : 'Ò×¾­').save();
		assertNotNull category
		println category
		def post = new Post(body: 'this is a body', imageURL: 'http://www.image.com', category:category, title:'title')
		user.addToPosts(post)
		assertEquals 1, User.get(user.id).posts.size()
		def foundPost = Post.findAllByCategory(Category.get(category.id));
		assertNotNull foundPost
		assertEquals 1 , foundPost.size()
	}
	
	/*
	void  testAccessingPosts()
	{
		def profile = new Profile(fullName : 'Hongli Li',profileImage: 'http://google.ca')
		def iUser = new User(nickName: 'joe', firstName : 'hli', lastName : 'li', password: 'secret', profile:profile).save()
		def category = new Category(chineseName:'chinese name', name:'name').save()
		def post = new Post(body: "First", title: 'first', imageURL: 'http://google.ca')
		category.addToPosts(post)
		iUser.addToPosts(post)
		iUser.addToPosts(new Post(body: "Second",title: 'second', imageURL: 'http://google.ca',category:category))
		iUser.addToPosts(new Post(body: "Third",title: 'third', imageURL: 'http://google.ca',category:category))
		post = Post.count();
		assertEquals post, 3
		def foundIUser = User.get(iUser.id)
		def postNames = foundIUser.posts.collect { it.body }
		//assertEquals(['First', 'Second', 'Third'], postNames.sort())
	}
	*/
}