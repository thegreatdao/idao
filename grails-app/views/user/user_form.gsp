<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>        
        <title>${title}</title>
		<link rel="stylesheet" href="${resource(dir:'css',file:'validationEngine.jquery.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'template.css')}" />
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.showpassword-1.0.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.validationEngine.js')}"></script>
		<script type="text/javascript">
			$(
				function()
				{
					var max = setEachWidth('.mainForm label');
					$('#fakeInput').css('left',max + 35);
					$('#showpasswordtext').css('left',max + 350);
					$('#fileupload').css('left',max + 195);
					$('#password').showPassword('#showpassword');
					$(".mainForm").validationEngine(
							{
							  success :  false,
							  failure : function() {}
							}
					);
				}
			);
		</script>
		<meta name="layout" content="main" />
    </head>
    <body>
		<g:applyLayout name="../common/form/pane" template="user_form"/>
		<g:renderRightSideBar/>
    </body>
</html>
