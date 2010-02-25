
<%@ page import="com.i.HtmlTitle" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>HtmlTitle List</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="create" action="create">New HtmlTitle</g:link></span>
        </div>
        <div class="body">
            <h1>HtmlTitle List</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="list">
                <table>
                    <thead>
                        <tr>
                        
                   	        <g:sortableColumn property="id" title="Id" />
                        
                   	        <g:sortableColumn property="enOrCn" title="En Or Cn" />
                        
                   	        <g:sortableColumn property="name" title="Name" />
                        
                        </tr>
                    </thead>
                    <tbody>
                    <g:each in="${htmlTitleInstanceList}" status="i" var="htmlTitleInstance">
                        <tr class="${(i % 2) == 0 ? 'odd' : 'even'}">
                        
                            <td><g:link action="show" id="${htmlTitleInstance.id}">${fieldValue(bean:htmlTitleInstance, field:'id')}</g:link></td>
                        
                            <td>${fieldValue(bean:htmlTitleInstance, field:'enOrCn')}</td>
                        
                            <td>${fieldValue(bean:htmlTitleInstance, field:'name')}</td>
                        
                        </tr>
                    </g:each>
                    </tbody>
                </table>
            </div>
            <div class="paginateButtons">
                <g:paginate total="${htmlTitleInstanceTotal}" />
            </div>
        </div>
    </body>
</html>
