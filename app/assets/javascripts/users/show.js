$(function(){
  $('.post-index').click(function(){
      $('.my-post').show();
      $('.my-fav-post').hide();
  });

  $('.fav-post-index').click(function(){
      $('.my-fav-post').show();
      $('.my-post').hide();
  });
});
