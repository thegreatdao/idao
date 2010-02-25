
<%@ page import="com.i.Rating" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Rating List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New Rating</g:link></span>
        </div>
        <div class="body">
            <h1>Rating List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="score" title="Score" />
                        
                   	        <g:sortableColumn property="postId" title="Post Id" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${ratingInstanceList}" status="i" var="ratingInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${ratingInstance.id}">${fieldValue(bean:ratingInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:ratingInstance, field:'score')}</td>
                        
                            <td>${fieldValue(bean:ratingInstance, field:'postId')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${ratingInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
