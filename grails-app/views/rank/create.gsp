
<%@ page import="com.i.Rank" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Rank</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Rank List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Rank</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${rankInstance}">
            <div class="errors">
                <g:renderErrors bean="${rankInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="post">Post:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rankInstance,field:'post','errors')}">
                                    <g:select optionKey="id" from="${com.i.Post.list()}" name="post.id" value="${rankInstance?.post?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="score">Score:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:rankInstance,field:'score','errors')}">
                                    <input type="text" id="score" name="score" value="${fieldValue(bean:rankInstance,field:'score')}" />
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
