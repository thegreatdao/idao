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
            <span class="user_label">You are</span> : ${user?.nickName}
          </li>
          <li>
            <span class="user_label">Useful link</span> :
            <a href="javascript:void(0)">MTags</a>
            <a href="javascript:void(0)">Edit</a>
            <a href="${request.contextPath}/logout">Logout</a>
          </li>
          <li>
            <span class="user_label">Last login</span> : <g:formatDate format="MMM dd, yyyy H:m:s" date="${user?.lastLogin}"/>
          </li>
          <li>
            <span class="user_label">Member since</span> : <g:formatDate format="MMM dd, yyyy" date="${user?.dateCreated}"/>
          </li>
          <li>
            <span class="user_label">Login</span> : ${user?.logins}
          </li>
        </ul>
      </div>
  </div>
</g:if>