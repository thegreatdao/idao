
<%@ page import="com.i.Rating" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Rating</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Rating List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Rating</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${ratingInstance}">
            <div class="errors">
                <g:renderErrors bean="${ratingInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="score">Score:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:ratingInstance,field:'score','errors')}">
                                    <g:select from="${0..5}" id="score" name="score" value="${ratingInstance?.score}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="postId">Post Id:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:ratingInstance,field:'postId','errors')}">
                                    <input type="text" id="postId" name="postId" value="${fieldValue(bean:ratingInstance,field:'postId')}" />
                                </td>
                            </tr> 
                        
                        </tbody>
                    </table>
                </div>
                <div class="buttons">
                    <span class="button"><input class="save" type="submit" value="Create" /></span>
                </div>
            </g:form>
        </div>
    </body>
</html>
