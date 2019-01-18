$(function() {
  $(document).on("ajax:success", ".fav", function(e) {
    if ($('#' + e.detail[0]).hasClass('yellow-star')) {
      $('#' + e.detail[0]).removeClass('yellow-star').addClass('black-star');
    } else {
      $('#' + e.detail[0]).removeClass('black-star').addClass('yellow-star');
    }
  })
})
