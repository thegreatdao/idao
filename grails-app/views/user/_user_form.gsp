<g:hasErrors bean="${userInstance}">
<div class="errors">
	<g:renderErrors bean="${userInstance}" as="list" />
</div>
</g:hasErrors>
<g:uploadForm class="mainForm">
	<g:if test="${isEdit}">
		<g:hiddenField name="id" value="${userInstance?.id}"/>
		<g:hiddenField name="version" value="${userInstance?.version}"/>
	</g:if>
	<ul>
		<li>
			<label for="nickname">Nick Name:</label>
			<g:if test="${!isEdit}">
				<g:textField name="nickName" id="nickname" value="${userInstance?.nickName}" class="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]] shortRangeInput"/>
			</g:if>
			<g:if test="${isEdit}">
				<g:textField name="nickName" id="nickname" value="${userInstance?.nickName}" class="shortRangeInput" disabled="disabled"/>
			</g:if>			
		</li>
		<li>
			<label for="firstname">First Name:</label>
			<g:textField name="firstName" id="firstname" value="${userInstance?.firstName}" class="validate[required,custom[onlyLetter],length[0,20]] shortRangeInput"/>
			<% //<img src="${createLink(url:[controller:'asset', id:'tree.jpg'])}" id="profileImage" width="150" height="100"/>%>
		</li>
		<li>
			<label for="lastname">Last Name:</label>
			<g:textField name="lastName" id="lastname" value="${userInstance?.lastName}" class="validate[required,custom[onlyLetter],length[0,20]] shortRangeInput"/>						
		</li>
		<li>
			<label for="password">Password:</label>
			<g:passwordField name="password" id="password" value="${userInstance?.password}" class="validate[required,length[6,20]] shortRangeInput"/>
			<input id="showpassword" type="checkbox"/><span id="showpasswordtext">Show Password</span>
		</li>
		<li>
			<label for="fullname">Full Name:</label>
			<g:textField name="profile.fullName" id="fullname" value="${userInstance?.profile?.fullName}" class="validate[required,custom[onlyLetter],length[0,20]] shortRangeInput"/>	
		</li>
		<li>
			<label for="captcha">Captcha:</label>
			<g:textField name="captcha" id="captcha" class="validate[required] shortRangeInput"/>
			<jcaptcha:jpeg name="image" height="30" width="120" style="margin-top: -42px;"/>		
		</li>
		<li>
			<label for="email">Email:</label>
			<g:textField name="profile.email" id="email" value="${userInstance?.profile?.email}" class="validate[optional,custom[email],length[0,50]] shortRangeInput"/>						
		</li>
		<li>
			<label for="profile">profile image:</label>
			<input type="file" id="profile" name="file" size="42"/>
		</li>
		<li>
			<label for="homepage">Home Page:</label>
			<g:textField name="profile.homePage" id="homepage" value="${userInstance?.profile?.homePage}" class="validate[optional,length[0,100]] longRangeInput"/>						
		</li>
		<li>
			<label for="bio">Bio:</label>
			<g:textArea name="profile.bio" id="bio" value="${userInstance?.profile?.bio}" class="longRangeInput"/>						
		</li>
		<li>
			<label>&nbsp;</label>
			<g:if test="${isEdit}">
				<g:actionSubmit value="Update" action="update"/>
			</g:if>
			<g:if test="${!isEdit}">
				<g:actionSubmit value="Save" action="save"/>
			</g:if>
		</li>
	</ul>
</g:uploadForm>