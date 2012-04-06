$(function () {
  $('#search-box').bind('keyup', function() {
    var form = $('#search-form');
    var form_data = form.serialize();
    $.getJSON('/search', form_data, function (ids) {
      var id_matching = new Object();
      $('.quote').hide();
      for (var i = 0; i < ids.length; i++) {
        id = ids[i];
        $('#quote-' + id).show();
      }
    });
  });
});