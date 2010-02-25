<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <meta name="layout" content="main" />
        <title>Create Post</title>         
    </head>
    <body>
        <div class="nav">
            <span class="menuButton"><a class="home" href="${resource(dir:'')}">Home</a></span>
            <span class="menuButton"><g:link class="list" action="list">Post List</g:link></span>
        </div>
        <div class="body">
            <h1>Create Post</h1>
            <g:if test="${flash.message}">
            <div class="message">${flash.message}</div>
            </g:if>
            <g:hasErrors bean="${postInstance}">
            <div class="errors">
                <g:renderErrors bean="${postInstance}" as="list" />
            </div>
            </g:hasErrors>
            <g:form action="save" method="post" >
                <div class="dialog">
                    <table>
                        <tbody>
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="title">Title:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'title','errors')}">
                                    <input type="text" maxlength="100" id="title" name="title" value="${fieldValue(bean:postInstance,field:'title')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="body">Body:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'body','errors')}">
                                    <textarea rows="5" cols="40" name="body">${fieldValue(bean:postInstance, field:'body')}</textarea>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="imageURL">Image URL:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'imageURL','errors')}">
                                    <input type="text" id="imageURL" name="imageURL" value="${fieldValue(bean:postInstance,field:'imageURL')}"/>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="category">Category:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'category','errors')}">
                                    <g:select optionKey="id" from="${com.i.Category.list()}" name="category.id" value="${postInstance?.category?.id}" ></g:select>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="dateCreated">Date Created:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'dateCreated','errors')}">
                                    <g:datePicker name="dateCreated" value="${postInstance?.dateCreated}" precision="minute" ></g:datePicker>
                                </td>
                            </tr> 
                        
                            <tr class="prop">
                                <td valign="top" class="name">
                                    <label for="user">User:</label>
                                </td>
                                <td valign="top" class="value ${hasErrors(bean:postInstance,field:'user','errors')}">
                                    <g:select optionKey="id" from="${com.i.User.list()}" name="user.id" value="${postInstance?.user?.id}" ></g:select>
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
