package com.i

import grails.test.*

class UserTests extends GrailsUnitTestCase
{
    void testCRUDUser()
	{
		def profile = new Profile(fullName : 'Hongli Li',profileImage: 'http://google.ca')
		def user = new User(nickName: 'void', firstName: 'hli', lastName : 'li', password: 'secret', profile : profile)
		assertNotNull user.save()
		assertNotNull user.id
		def foundUser = User.get(user.id)
		assertEquals 'void', foundUser.nickName
		print user.dateCreated	
    }
}
