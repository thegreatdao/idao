package com.i

import org.grails.comments.*
import org.grails.rateable.*

class Post implements Commentable, Rateable
{	
	//enable this we have to use merge instead of save on domain class a bug from searchable plugin
	static searchable = 
	{
		except = ['imageURL']
		title boost: 2.0
		title spellCheck: 'include'
	}
	
	String title
    String body
	String imageURL
	Date dateCreated
	static belongsTo = [user : User, category : Category]
	
	static mapping = 
	{
		//sort dateCreated:"asc"
	}
	
	static constraints = 
	{
		title(maxSize:100, blank: false, nullable: false)
		body(maxSize:4000, blank: false, nullable: false)
		imageURL(blank: true, nullable: true)
	}
	
	String toString()
	{
		"Post for ${user.nickName} (${id})"
	}
}
