package com.i

class Category
{
	String name	
	String chineseName
	
	static constraints = 
	{
		name(size:1..20, unique: true, blank:false)
		chineseName(size:1..20, unique: true, blank:false)
    }
}
