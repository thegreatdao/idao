<g:hasErrors bean="${htmlTitleInstance}">
	<div class="errors">
		<g:renderErrors bean="${htmlTitleInstance}" as="list" />
	</div>
</g:hasErrors>
<g:form class="mainForm">
	<g:if test="${isEdit}">
		<g:hiddenField name="id" value="${userInstance?.id}"/>
		<g:hiddenField name="version" value="${userInstance?.version}"/>
	</g:if>
	<ul>
		<li>
			<label for="nickname">English or Chinese:</label>
			<g:set var="nickNameClass" value="validate[required,custom[noSpecialCaracters],length[0,20],ajax[ajaxUser]]"/>
			<g:checkBox name="enOrCn" value="${htmlTitleInstance?.enOrCn}" ></g:checkBox>
		</li>
		<li>
			<label for="firstname">First Name:</label>
			<g:textField type="text" id="name" name="name" value="${fieldValue(bean:htmlTitleInstance,field:'name')}" class="validate[required] longRangeInput"/>
		</li>
		<li>
			<label>&nbsp;</label>
			<g:if test="${isEdit}">
				<g:actionSubmit value="Update" action="update"/>
			</g:if>
			<g:if test="${!isEdit}">
				<g:actionSubmit value="Create" action="save"/>
			</g:if>
		</li>
	</ul>
</g:form>