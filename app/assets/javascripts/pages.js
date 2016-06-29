// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function() {

	$('.poli-search').hide();
	$('.twitter-button').click(function() {
		$('.twitter-button').hide();
		$('.legis-button').hide();
		$('.poli-search').show();
	});

	$('.legis-search').hide();
	$('.legis-button').click(function() {
		$('.twitter-button').hide();
		$('.legis-button').hide();
		$('.legis-search').show();
	});

	$('.poli-search').on('submit', function(event){
		event.preventDefault();

		$('.list-unstyled').empty();

		var $target = $(event.target);
		$.ajax({
      		url: $target.attr('action'),
			type: $target.attr('method'),
			data: $target.serialize()
		}).done(function(response){
			$('#homepage-tab').append(response);
		});
		
	});

	$('.legis-search').on('submit', function(event){
		event.preventDefault();

		$('.list-unstyled').empty();

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