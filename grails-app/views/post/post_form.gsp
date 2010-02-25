<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>        
        <title>${title}</title>
		<link rel="stylesheet" href="${resource(dir:'css',file:'validationEngine.jquery.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'template.css')}" />
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.validationEngine.js')}"></script>
		%{--<script type="text/javascript" src="${resource(dir:'js',file:'jquery.autogrow-textarea.js')}"></script>		--}%
		<script type="text/javascript">
			$(
				function()
				{
					setEachWidth('.mainForm label');
					$('.mainForm').validationEngine(
							{
							  success :  false,
							  failure : function() {}
							}
					);
//				  	$('textarea').autogrow();				
				}
			);
		</script>
		<meta name="layout" content="main" />
    </head>
    <body>
		<g:applyLayout name="../common/form/pane" template="post_form"/>
		<g:renderRightSideBar/>
    </body>
</html>
