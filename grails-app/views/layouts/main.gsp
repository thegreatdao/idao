<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN"
   "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="en" lang="en">
	<head>
		<meta http-equiv="Content-type" content="text/html; charset=utf-8" />
		<title><g:layoutTitle default="Welcome to I DAO"/></title>
		<link rel="shortcut icon" href="${resource(dir:'img',file:'i-dao.ico')}" type="image/x-icon" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'reset.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'text.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'960.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'main.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'jquery.autocomplete.css')}" />
		<link rel="stylesheet" href="${resource(dir:'css',file:'jHtmlArea.css')}" />

		<script type="text/javascript" src="${resource(dir:'js',file:'jquery-1.3.2.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.qtip-1.0.0-rc3.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.cycle.all.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.easing.1.3.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery-ui-1.7.2.custom.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'main.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'ui.core.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'ui.accordion.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'swfobject.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.watermark.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.autogrow.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.text-overflow.min.js')}"></script>
		<script type="text/javascript" src="${resource(dir:'js',file:'jquery.autocomplete.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'jHtmlArea-0.7.0.min.js')}"></script>
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.ba-bbq.min.js')}"></script>

        <g:layoutHead/>

		<script type="text/javascript">
			$.fn.cycle.defaults.timeout = 6000;
			var numOfPics = 0;
			var index = 0;
            var hash = $.deparam.fragment();
            var accordionIndex = 0;
            if(hash.index)
            {
                accordionIndex = parseInt(hash.index);
            }
			$(
				function()
				{
				  //$('.comment textarea').autogrow();
                  $('#body').htmlarea();
					$("input[name='q']").autocomplete(
						'${request.contextPath}/search/getSearchSuggestion',
						{
							width: 206
						}
					);
					$('#search :button').click(
						function()
						{
							this.form.submit();
						}
					);

					$('#accordion').accordion
                    (
						{
							autoHeight: false,
						    animated: 'bounceslide',
							collapsible: true,
                            active: accordionIndex,
							changestart: function(event, ui)
							{
								var oldHeader = ui.oldHeader;
								oldHeader.find("img").attr('src','${resource(dir:'img',file:'closed_bullet.png')}');
								oldHeader.find("div").attr('class','list_header');
								var newHeader = ui.newHeader;
                                /*var nextAccordionIndex = newHeader.next().attr('id')
                                nextAccordionIndex = nextAccordionIndex.substring(nextAccordionIndex.indexOf('_')+1);
                                var paramsObj = { index : nextAccordionIndex};
                                var pathName = window.location.pathname + window.location.hash;
                                document.location = pathName;
                                console.log(nextAccordionIndex);
                                console.log($.param.fragment(pathName, paramsObj));*/
								newHeader.find("img").attr('src','${resource(dir:'img',file:'open_bullet.png')}');
								newHeader.find("div").attr('class','list_header_top_rounded');
							}
						}
					);
                    if(accordionIndex != 0)
                    {
                      var accordionHeader = $('div[tabindex=0] div:last-child');
                      accordionHeader.attr('class','list_header_top_rounded');
                      var accordionHeaderImg = accordionHeader.children(':first');
                      accordionHeaderImg.attr('src','${resource(dir:'img',file:'open_bullet.png')}');

                      var firstAccordionHeader = $('#accordion').children(':first').children(':last');
                      firstAccordionHeader.attr('class','list_header');
                      firstAccordionHeader.children(':first').attr('src','${resource(dir:'img',file:'closed_bullet.png')}');
                    }
					$('.ellipse').textOverflow();
					$("#j_username").watermark('username');
					$("#j_password").watermark('password');
					if($.browser.mozilla)
					{
						$('#profile').css('color','#000000');
					}

					var so = new SWFObject("${resource(dir:'',file:'tagcloud.swf')}", "tagcloud", "240", "200", "7", "#ffffff");
					so.addParam("wmode", "transparent");
					so.addVariable("tcolor", "0x333333");
					so.addVariable("mode", "tags");
					so.addVariable("distr", "true");
					so.addVariable("tspeed", "20");
					so.addVariable("tagcloud", "<tags><a href='javascript:void(0);' style='12'>Zen</a><a href='javascript:void(0);' style='12'>LaoZi</a><a href='javascript:void(0);' style='16'>Mindless</a><a href='javascript:void(0);' style='14'>Empty</a><a href='javascript:void(0);' style='12'>Eternity</a><a href='javascript:void(0);' style='12'>Himility</a><a href='javascript:void(0);' style='9'>Mindfulness</a><a href='javascript:void(0);' style='10'>Being and non being</a><a href='javascript:void(0);' style='10'>Merits</a><a href='javascript:void(0);' style='12'>Mercy</a><a href='javascript:void(0);' style='12'>Buddha</a><a href='javascript:void(0);' style='12'>Integral</a><a href='javascript:void(0);' style='12'>Meditation</a><a href='javascript:void(0);' style='16'>Compassion</a><a href='javascript:void(0);' style='14'>8 Gua</a><a href='javascript:void(0);' style='12'>Eternity</a><a href='javascript:void(0);' style='12'>Himility</a><a href='javascript:void(0);' style='9'>Heartless</a><a href='javascript:void(0);' style='10'>Being and non being</a><a href='javascript:void(0);' style='10'>6 Saints</a><a href='javascript:void(0);' style='12'>Wisdom</a><a href='javascript:void(0);' style='12'>Buddha</a><a href='javascript:void(0);' style='12'>I</a><a href='javascript:void(0);' style='12'>Dao</a><a href='javascript:void(0);' style='16'>Void</a><a href='javascript:void(0);' style='14'>Hexagram</a><a href='javascript:void(0);' style='12'>ZhuangZi</a><a href='javascript:void(0);' style='12'>Himility</a><a href='javascript:void(0);' style='9'>Kindness</a><a href='javascript:void(0);' style='10'>Being and non being</a><a href='javascript:void(0);' style='10'>Karma</a><a href='javascript:void(0);' style='12'>Freud</a><a href='javascript:void(0);' style='12'>Symphacy</a><a href='javascript:void(0);' style='12'>Nirvana</a></tags>");
					so.write("tagcloud");

					$('#login_button').click(function(){
							$('#wrong_login').text('');
							var params = $('#loginform').serialize() + '&spring-security-redirect=/login/ajaxSuccess';
							$.post($('#loginform').attr('action'), params, function(response)
							{
								if(response.success)
								{
                                    $('#login').hide('slow');
                                    $.get("<g:createLink controller='login' action='ajaxUserInfo'/>",function(data){$('#login').after(data);});
								}
								else if(response.error)
								{
									$('#wrong_login').text('Wrong login');
                                    $('#wrong_login').fadeOut('slow').fadeIn('slow').fadeOut('slow').fadeIn('slow').fadeOut('slow').fadeIn('slow');
								}
								else
								{
									$('#wrong_login').text(response);
								}
							},'json')
						}
					)

					numOfPics = $('.flashy_pic').length;

					animateGallery();

                    $('.flashy_pic').click
                    (
                      function()
                      {
                        window.location = "${request.contextPath}/post/show/" + $(this).attr('id').substring(14);
                      }
                    );
					var position = {corner: {target: 'topRight', tooltip: 'bottomLeft'}};
					var logoPosition = {corner: {target: 'center', tooltip: 'center'}};
					var style = {border: {width: 2,radius: 3}, name: 'dark', tip: true};

					$('#language img,#footer img').qtip(
						{
							position: position,
							style: style
						}
					);

					$('#logo').qtip(
						{
							position: logoPosition,
							style: style
						}
					);

					var currentTab = "${request.category}";
					$('.menu_item').each(
						function()
						{
							var tab = $(this).attr('id').substring(4);
							if(currentTab.length != 0)
							{
								if(currentTab == tab)
								{
									$(this).css('background-image',"url(${resource(dir:'img',file:'roll_over_menu_bg.png')})");
								}
							}
						}
					);

					$('.menu_item').mouseover(
						function()
						{
							$(this).css('background-image',"url(${resource(dir:'img',file:'roll_over_menu_bg.png')})");
						}
					);

					$('.menu_item').mouseout(
						function()
						{
							var tab = $(this).children('a')[0].childNodes[0].data;
							if(currentTab != tab)
							{
								$(this).css('background-image','');
							}
						}
					);

					$('#previous').click(
						function()
						{
							index--;
							index += numOfPics;
							index %= numOfPics;
							$('#flashy_pic_container').cycle(index);
						}
					);

					$('#next').click(
						function()
						{
							index++;
							index %= numOfPics;
							$('#flashy_pic_container').cycle(index);
						}
					);

                    $('#previous').hover(
					   function()
					   {
						   $(this).attr('src','${request.contextPath}/img/previous_arrow_on.png');
					   },
					   function()
					   {
						   $(this).attr('src','${request.contextPath}/img/previous_arrow.png');
					   }
                    );

                    $('#next').hover(
					   function()
					   {
						   $(this).attr('src','${request.contextPath}/img/next_arrow_on.png');
					   },
					   function()
					   {
						   $(this).attr('src','${request.contextPath}/img/next_arrow.png');
					   }
                    );

					$('div#footer ul li').each(
						function()
						{
							var tab = $(this).attr('id').substring(10);
							if(currentTab == tab)
							{
								$(this).children('a')[0].className = "reverse";
							}
						}
					)
               }
			);

			function animateGallery()
			{
				index++;
				index %= numOfPics;
				var randomNumber=Math.floor(Math.random()*2);
				var effectType = 'all';
				if(randomNumber == 1)
				{
					effectType = 'blindX,blindY,blindZ,cover,curtainX,curtainY,fade,fadeZoom,growX,growY,slideX,slideY,turnUp,turnDown,turnLeft,turnRight,uncover,wipe,zoom';
				}
				$('#flashy_pic_container').cycle(
					{
						fx:		effectType,
						delay:   -4000
					}
				)
			}
		</script>
	</head>
	<body>
		<div class="container_12" id="content">
			<div class="grid_12 alpha omega" id="header">
				<a href="${resource(dir:'')}"><img src="${resource(dir: 'img', file: 'logo.png')}" id="logo" title="<g:message code='logo'/>"/></a>
				<div id="language">
					<a href="javascript:void(0);"><img src="${resource(dir: 'img', file: 'cn.png')}" title="<g:message code="simplified.chinese"/>"/></a>
					<!--<a href="javascript:void(0);"><img src="${resource(dir: 'img', file: 'hk.png')}" title="<g:message code="traditional.chinese"/>"/></a>-->
					<a href="javascript:void(0);"><img src="${resource(dir: 'img', file: 'us.png')}" title="English"/></a>
				</div>
				<div id="menu">
					<div class="menu_item" id="menu0"><a href="${resource(dir:'')}"><g:message code="Home"/></a></div>
					<div class="menu_item" id="menu1"><a href="<g:createLink controller="post" action="list" params="[category: 1]"/>"><g:message code="I-Ching"/></a></div>
					<div class="menu_item" id="menu2"><a href="<g:createLink controller="post" action="list" params="[category: 2]"/>"><g:message code="Dao"/></a></div>
					<div class="menu_item" id="menu3"><a href="<g:createLink controller="post" action="list" params="[category: 3]"/>"><g:message code="Zen-Buddhaism"/></a></div>
					<div class="menu_item"><a href="javascript:void(0);"><g:message code="Cast-I-Ching"/></a></div>
					<div class="menu_item"><a href="javascript:void(0);"><g:message code="About"/></a></div>
					<div class="menu_item"><a href="javascript:void(0);"><g:message code="Contact"/></a></div>
				</div>
				<div id="search">
					<g:form controller="search"  method="get" name="searchable">
						<input type="text" name="q" value="${params.q}"/>
						<input type="button" value="<g:message code="search"/>"/>
					</g:form>
				</div>
			</div>

			<div class="clear"></div>

			<g:layoutBody/>

			<div class="grid_12" id="footer">
					<img src="${resource(dir: 'img', file: 'buddist_lotus.png')}" title="<g:message code="mind.is.Buddha"/>"/>
					<ul>
						<li id="bottomMenu0"><a href="${resource(dir:'')}"><g:message code="Home"/></a></li>
						<li id="bottomMenu1"><a href="<g:createLink controller="post" action="list" params="[category: 1]"/>"><g:message code="I-Ching"/></a></li>
						<li id="bottomMenu2"><a href="<g:createLink controller="post" action="list" params="[category: 2]"/>"><g:message code="Dao"/></a></li>
						<li id="bottomMenu3"><a href="<g:createLink controller="post" action="list" params="[category: 3]"/>"><g:message code="Zen-Buddhaism"/></a></li>
						<li><a href="javascript:void(0);"><g:message code="Cast-I-Ching"/></a></li>
						<li><a href="javascript:void(0);"><g:message code="About"/></a></li>
						<li><a href="javascript:void(0);"><g:message code="Contact"/></a></li>
					</ul>
					<img src="${resource(dir: 'img', file: 'buddist_lotus_reflective.png')}" title="<g:message code="mind.is.Buddha"/>" style="float:right;margin-right:6px;"/>
					<div class="clear"></div>
					<div id="copyright">
						copyright &copy; 2009 i-dao.com
						<span style="color:#2e6ab1;">
						Version <g:meta name="app.version"/>
						on Grails <g:meta name="app.grails.version"/>
						</span>
					</div>
			</div>
			<div class="clear"></div>
		</div>

	</body>
</html>