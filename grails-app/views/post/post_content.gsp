<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>${title}${request.category}</title>
		<meta name="layout" content="main" />
        <link rel="stylesheet" href="${resource(dir:'css',file:'jquery.rating.css')}"/>      
        <script type="text/javascript" src="${resource(dir:'js',file:'jquery.rating.js')}"></script>      
        <script type="text/javascript">
          $(
              function()
              {
                  var loc = window.location.pathname;
                  $('span[id^="average_rating_"]').each(
                      function()
                      {
                          var currentAverageRating = parseInt($(this).text());
                          var divId = $(this).attr('id').substring(15);
                          if(!isNaN(currentAverageRating))
                          {
                              $('input[value=' + currentAverageRating + ']').attr("checked","checked");
                          }
                          else
                          {
                            var totalRatingId = $(this).attr('id').substring(15);
                            $('#total_rating_' + totalRatingId).html('<span style="color:#FEB729;">0</span>');
                            $(this).html('<span style="color:#FEB729;">N/A</span>');
                          }
                          $('div[id="' + divId + '"] input[name=commentPageURI]').attr('value', loc);
                      }
                  );
                  $('.auto-submit-star').rating(
                      {
                          callback: function(value, link)
                          {
                              var postId = this.form.id.substring(12);
                              $.post('${request.contextPath}/rateable/rate/' + postId + '?type=post&xhr=true',{rating: value,ratingIsActive : true},
                                  function(data)
                                  {
                                      var avg = data.split(',')[0];
                                      var total = data.split(',')[1];
                                      $('#total_rating_' + postId).text(total);
                                      $('#average_rating_' + postId).text(avg);
                                  }
                              );
                          }
                      }
                  );
                  $('input[value="Comment"]').click(
                      function()
                      {
                          var commentContainerId = $(this).attr('id').substring(15);
                          if($('#comment_body_'+commentContainerId).val()!=0 )
                          {
                            var params = $(this).parent().serialize();
                            var action = "${request.contextPath}/commentable/add";
                            var commentContainer = $('#comment_' + commentContainerId);
                            var preloader = $('#comment_loader_'+commentContainerId);
                            preloader.show();
                            $.post(
                                    action,
                                    params,
                                    function(data)
                                    {
                                      commentContainer.append(data);
                                      preloader.hide();
                                      $('#comment_body_'+commentContainerId).val('');
                                    }
                            );
                          }
                      }
                  );
              }
          );
      </script>

    </head>
    <body>
		<g:applyLayout name="../common/form/pane" template="standalone_content"/>
		<g:renderRightSideBar/>
    </body>
</html>
