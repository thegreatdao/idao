<g:hasErrors bean="${postInstance}">
<div class="errors">
	<g:renderErrors bean="${postInstance}" as="list" />
</div>
</g:hasErrors>
<g:uploadForm class="mainForm">
	<g:if test="${isEdit}">
		<g:hiddenField name="id" value="${postInstance?.id}"/>
		<g:hiddenField name="version" value="${postInstance?.version}"/>
	</g:if>
	<ul>
		<li>
			<label for="title">Title:</label>
			<g:textField name="title" id="title" value="${postInstance?.title}" class="validate[required,length[0,200]] longestRangeInput"/>		
		</li>
		<li>
			<label for="category">Category:</label>
			<g:select optionKey="id" from="${com.i.Category.list()}" name="category.id" optionValue="name" value="${postInstance?.category?.id}"></g:select>
		</li>
		<li>
			<label for="body">Body:</label>
			<g:textArea name="body" id="body" value="${postInstance?.body}" class="longestRangeInput"/>
		</li>
		<li>
			<label for="titleImg">Title Image:</label>
			<input type="file" id="titleImg" name="titleImg" size="50"/>
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