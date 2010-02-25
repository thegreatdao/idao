package com.i

import org.compass.core.engine.SearchEngineQueryParseException

class SearchableController
{
	def searchableService

    def index =
	{
        if (!params.q?.trim())
		{
            return [:]
        }
        try
		{
			def searchResult = Post.search(params.q, params)
            return [searchResult: searchResult]
        }
		catch (SearchEngineQueryParseException ex)
		{
            return [parseException: true]
        }
    }
	
	def getSearchSuggestion =
	{
		def result
        if (!params.q?.trim())
		{
            result = ''
        }
        try
		{
			def searchResult = Post.search(params.q, [suggestQuery:true])
            result = !searchResult.suggestedQuery?'':searchResult.suggestedQuery
        }
		catch (SearchEngineQueryParseException ex)
		{
            result = ''
        }
		render result
    }
}
