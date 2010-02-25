<div class="grid_9" id="main_form_content">

	<div id="round_transparent_tab">					
		<div class="tab_left_bg">				
		</div>
		<div class="tab_content_bg">
			${title}
		</div>
		<div class="tab_right_bg">				
		</div>
	</div>

	<div>
		<div id="form_body_top_bg">
		</div>
		<div id="form_boby_center_bg">
			<g:if test="${flash.message}">
				<div class="message">${flash.message}</div>
			</g:if>
			<g:layoutBody/>
		</div>
		<div id="form_body_bottom_bg">
		</div>
	</div>
	
</div>