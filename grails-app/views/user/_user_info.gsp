<g:if test="${user}">
  <div id="user_panel">
      <div style="height:36px;">
      </div>
      <div id="user_info">
        <ul>
          <li style="margin-left:50px;">
            <img id="user_profile_image" src="<g:createLink controller="asset" params='[id: "${user.profile.profileImage}", user:"", imageId:"${user.id}" ]'/>"/>
          </li>
          <li>
            <span class="user_label"><g:message code="you.are"/></span> : ${user?.nickName}
          </li>
          <li>
            <span class="user_label"><g:message code="useful.link"/></span> :
            <a href="javascript:void(0)"><g:message code="mtags"/></a>
            <a href="javascript:void(0)"><g:message code="edit"/></a>
            <a href="${request.contextPath}/logout"><g:message code="logout"/></a>
          </li>
          <li>
            <span class="user_label"><g:message code="last.login"/></span> : <g:formatDate format="MMM dd, yyyy H:m:s" date="${user?.lastLogin}"/>
          </li>
          <li>
            <span class="user_label"><g:message code="member.since"/></span> : <g:formatDate format="MMM dd, yyyy" date="${user?.dateCreated}"/>
          </li>
          <li>
            <span class="user_label"><g:message code="login"/></span> : ${user?.logins}
          </li>
        </ul>
      </div>
  </div>
</g:if>