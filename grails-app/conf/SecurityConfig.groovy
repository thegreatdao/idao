security {

	active = true

	userName = "nick_name"
	password = "password"
	loginUserDomainClass = "com.i.User"
	authorityDomainClass = "com.i.Role"
	useRequestMapDomainClass = false

	requestMapString = '''
		CONVERT_URL_TO_LOWERCASE_BEFORE_COMPARISON
		PATTERN_TYPE_APACHE_ANT
		
	'''
	//		/secure/**=ROLE_ADMIN
	// /**/create=ROLE_ADMIN
}
