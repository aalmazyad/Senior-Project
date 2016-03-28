# comments.js.coffee
	jQuery ->
	  # Create a comment
	  $(".form-group")
	    .on "ajax:beforeSend", (evt, xhr, settings) ->
	      $(this).find('textarea')
	        .addClass('uneditable-input')
	        .attr('disabled', 'disabled');
	    .on "ajax:success", (evt, data, status, xhr) ->
	      $(this).find('textarea')
	        .removeClass('uneditable-input')
	        .removeAttr('disabled', 'disabled')
	        .val('');
	      $(xhr.responseText).hide().insertAfter($(this)).show('slow')
