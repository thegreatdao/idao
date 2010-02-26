package com.i

import org.compass.core.engine.SearchEngineQueryParseException

class SearchableController
{
	def searchableService

    def index =
	{
		println '----------------------------------------------------------------------------------------------------'
        if (!params.q?.trim())
		{
            return [:]
        }
        try
		{
			def postInstances = Post.search(params.q, params)
			postInstances.each{println postInstances.getClass()}			
            return [postInstances: postInstances]
        }
		catch (SearchEngineQueryParseException ex)
		{
            return [parseException: true]
        }
    }
	
	def getSearchSuggestion =
	{
		println '----------------------------------------------------------------------------------------------------'
		def result
        if (!params.q?.trim())
		{
            result = ''
        }
        try
		{
			def postInstances = Post.search(params.q, [suggestQuery:true])
            result = !postInstances.suggestedQuery?'':postInstances.suggestedQuery
        }
		catch (SearchEngineQueryParseException ex)
		{
            result = ''
        }
		render result
    }
}
