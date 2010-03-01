package com.i

import org.compass.core.engine.SearchEngineQueryParseException

class SearchController
{
    def index =
	{
        try
		{
			def postInstances = Post.search(params.q, params)
            if(postInstances.results.size() != 0)
            {
              return [postInstances: postInstances.results, searchResult : postInstances]
            }
            else
            {
              return [:];
            }
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
