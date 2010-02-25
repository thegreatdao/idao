package com.i

class  User
{
	static searchable = true
	String nickName
	String firstName
	String lastName
	String password
	Date dateCreated
    Date lastLogin
    Integer logins
	Profile profile	
	boolean enabled = true

	String toString()
	{
		"User for ${nickName} (${id})"
	}
	
	static constraints =
    {
		nickName(size:3..20, unique: true)
		password(validator: {passwd, user -> passwd != user.nickName})	
		profile(nullable: false)
        lastLogin(nullable: true)
        logins(nullable: true)
	}
	
	static mapping =
    {
		profile lazy:false
	}
	
	static hasMany = [posts : Post, authorities: Role]
	
	static belongsTo = Role	
}
