<%@ page import="com.i.Post" %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Show Post${request}</title>
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Post List</g:link></span>
            <span class="menuButton"><g:link class="create" action="create">New Post</g:link></span>
        </div>
        <div class="body">
            <h1>Show Post</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <div class="dialog">
                <table>
                    <tbody>

                    
                        <tr class="prop">
                            <td valign="top" class="name">Id:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:postInstance, field:'id')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Title:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:postInstance, field:'title')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Body:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:postInstance, field:'body')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Image URL:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:postInstance, field:'imageURL')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Category:</td>
                            
                            <td valign="top" class="value"><g:link controller="category" action="show" id="${postInstance?.category?.id}">${postInstance?.category?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">Date Created:</td>
                            
                            <td valign="top" class="value">${fieldValue(bean:postInstance, field:'dateCreated')}</td>
                            
                        </tr>
                    
                        <tr class="prop">
                            <td valign="top" class="name">User:</td>
                            
                            <td valign="top" class="value"><g:link controller="user" action="show" id="${postInstance?.user?.id}">${postInstance?.user?.encodeAsHTML()}</g:link></td>
                            
                        </tr>
						 <tr class="prop">
                            <td valign="top" colspan="2">
								<rateable:ratings bean='${postInstance}'/>
								<rateable:resources/>
							</td>                            
                        </tr>
						
                    </tbody>
                </table>
            </div>
            <div class="buttons">
                <g:form>
                    <input type="hidden" name="id" value="${postInstance?.id}" />
                    <span class="button"><g:actionSubmit class="edit" value="Edit" /></span>
                    <span class="button"><g:actionSubmit class="delete" onclick="return confirm('Are you sure?');" value="Delete" /></span>
                </g:form>
            </div>
        </div>
    </body>
</html>
