// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

	$('.foo').on('submit', function(event){
		event.preventDefault();

		var $target = $(event.target);
		$.ajax({
      		url: $target.attr('action'),
			type: $target.attr('method'),
			data: $target.serialize()
		}).done(function(response){
			$('#homepage-tab').append(response);
		});
		
	});


});