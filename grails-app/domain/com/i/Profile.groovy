package com.i

class Profile
{
	static belongsTo = [user : User]
	String profileImage
	String fullName
	String bio
	String homePage
	String email
	
	static constraints =
    {
		fullName(blank: false)
		bio(nullable: true, maxSize: 1000)
		homePage(url: true, nullable: true)
		email(email: true, nullable: true)
		profileImage(nullable: true)
	}
	
	String toString()
	{
		"Profile for ${fullName} (${id})"
	}
}
