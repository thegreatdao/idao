package com.i

import grails.test.*

class QueryIntegrationTests extends GrailsUnitTestCase
{
    void testBasicDynamicFinder()
	{
		def profile = new Profile(fullName : 'Hongli Li',profileImage: 'http://google.ca')
		new User(nickName: 'joe', firstName : 'hli', lastName : 'li', password: 'secret', profile: profile).save()
		new User(nickName: 'joe2', firstName : 'hli', lastName : 'li', password: 'secret2', profile: profile).save()
		def user = User.findByFirstName('hli')
		assertEquals 'hli', user.firstName
		user = User.findByNickNameAndLastName('joe','li')
		assertEquals 'joe', user.nickName
		def now = new Date()
		def users = User.findAllByDateCreatedBetween(now-1, now)
		assertEquals 2, users.size()
		def profiles = Profile.findAllByProfileImageIsNotNull()
		assertEquals 1, profiles.size()
    }

	void testFetching()
	{	
		def profile = new Profile(fullName : 'Hongli Li',profileImage: 'http://google.ca')
		def user = new User(nickName: 'joe', firstName : 'hli', lastName : 'li', password: 'secret', profile:profile).save()		
		def category = new Category(name : 'test', chineseName : 'chineseTest').save()
		def post = new Post(body: 'this is a body', title:'title', imageURL: 'http://www.image.com',category:category)
		user.addToPosts(post);
		category.addToPosts(post);
		def foundUser = User.findByNickName('joe', [fetch:[posts:'eager']])		
		assertEquals 1,  foundUser.posts.size()
		foundUser.posts.each{assertEquals 'this is a body', it.body}
	}
	
	void testQBE()
	{
		def profile = new Profile(fullName : 'Hongli Li',profileImage: 'http://google.ca')
        new User(nickName: 'joe', firstName : 'hli', lastName : 'li', password: 'secret', profile:profile).save()
        new User(nickName: 'joe2', firstName : 'hli', lastName : 'li', password: 'secret', profile:profile).save()
        new User(nickName: 'joe3', firstName : 'hli', lastName : 'li', password: 'secret', profile:profile).save()

        def userToFind = new User(nickName: 'joe')
        def u1 = User.find(userToFind)
        assertEquals('secret', u1.password)

        userToFind = new User(nickName: 'joe3')
        def u2 = User.find(userToFind)
        assertEquals('joe3', u2.nickName)

        userToFind = new User(password: 'secret')
        def u3 = User.findAll(userToFind)
        assert 3, u3.size()
    }

}
