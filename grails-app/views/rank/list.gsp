
<%@ page import="com.i.Rank" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Rank List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Rank</g:link></span>
        </div>
        <div class="body">
            <h1>Rank List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <th>Post</th>
                   	    
                   	        <g:sortableColumn property="score" title="Score" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${rankInstanceList}" status="i" var="rankInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${rankInstance.id}">${fieldValue(bean:rankInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:rankInstance, field:'post')}</td>
                        
                            <td>${fieldValue(bean:rankInstance, field:'score')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${rankInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
