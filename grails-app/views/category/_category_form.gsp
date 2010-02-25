<g:hasErrors bean="${categoryInstance}">
	<div class="errors">
		<g:renderErrors bean="${categoryInstance}" as="list" />
	</div>
</g:hasErrors>
<g:form class="mainForm">
	<g:if test="${isEdit}">
		<g:hiddenField name="id" value="${categoryInstance?.id}"/>
		<g:hiddenField name="version" value="${categoryInstance?.version}"/>
	</g:if>
	<ul>
		<li>
			<label for="categoryNameEn">Category Name en:</label>
			<g:textField type="text" id="categoryNameEn" name="name" value="${fieldValue(bean:categoryInstance,field:'name')}" class="validate[required,length[0,20]] shortRangeInput"/>	
		</li>
		<li>
			<label for="categoryNameCn">Category name cn:</label>
			<g:textField type="text" id="categoryNameCn" name="chineseName" value="${fieldValue(bean:categoryInstance,field:'chineseName')}" class="validate[required,length[0,20]] shortRangeInput"/>	
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
