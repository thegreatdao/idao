<div class="grid_3">
	<div id="flashy_pic_content">
		<div id="flashy_pic_container">
            <g:each in='${postInstances}' var='postInstance'>
              <img id="post_head_img_${postInstance.id}" src="<g:createLink controller="asset" params='[id: "${postInstance.imageURL}", post:"", imageId:"${postInstance.id}" ]'/>" class="flashy_pic"/>
            </g:each>
		</div>
		<img src="${resource(dir:'img',file:'previous_arrow.png')}" class="navigation" id="previous"/>
		<img src="${resource(dir:'img',file:'next_arrow.png')}" class="navigation" id="next"/>
	</div>
    <g:set var="user" value="${session?.SPRING_SECURITY_CONTEXT?.authentication?.principal?.domainClass}" scope="request"/>
    <g:if test="${!request.user}">
	<div id="login">
		<div id="login_form">
            <div id="wrong_login"></div>
			<form action='${request.contextPath}/j_spring_security_check' method="post" id="loginform">
				<div id="login_fields">
					<div class="login_field">
						<g:textField name="j_username" size="12" id="j_username"/>
					</div>
					<div id="login_spacer">					
					</div>
					<div class="login_field">
						<g:passwordField name="j_password" size="12" id="j_password"/>
					</div>
				</div>
				<div>
					<img src="${resource(dir:'img',file:'login_button.png')}" id="login_button"/>
				</div>
			</form>
		</div>
		<div id="forgot_password">
			<a href="javascript:void(0);">Forgot Password???</a>
		</div>
	</div>
    </g:if>
    <tmpl:/user/user_info/>
	<div id="tagcloudcontainer">
		<div id="tag_top">
		</div>
		<div id="tagcloud">
		</div>
		<div id="tag_bottom">
		</div>
	</div>
</div>

<div class="clear"></div>