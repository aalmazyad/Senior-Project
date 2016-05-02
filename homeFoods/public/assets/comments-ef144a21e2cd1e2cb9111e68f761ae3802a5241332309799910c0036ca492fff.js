(function() {
  jQuery(function() {
    $(".form-group").on("ajax:beforeSend", function(evt, xhr, settings) {
      return $(this).find('textarea').addClass('uneditable-input').attr('disabled', 'disabled');
    }).on("ajax:success", function(evt, data, status, xhr) {
      $(this).find('textarea').removeClass('uneditable-input').removeAttr('disabled', 'disabled').val('');
      return $(xhr.responseText).hide().insertAfter($(this)).show('slow');
    });
    return $(document).on("ajax:beforeSend", ".well", function() {
      return $(this).fadeTo('fast', 0.5);
    }).on("ajax:success", ".well", function() {
      return $(this).hide('fast');
    }).on("ajax:error", ".well", function() {
      return $(this).fadeTo('fast', 1);
    });
  });

}).call(this);
