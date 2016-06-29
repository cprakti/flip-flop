// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function()  {

function draw(data){
  d3.select( ".yes-no-chart" )
    .selectAll( "div" )
      .data( data )
    .enter().append( "div" )
      .attr('class', 'bar')
      .style( "width", function(d) { return d * 6 + "px"; })
      .text( function(d) { return d; });
  }


if($(".yes-no-chart")) {
    $.ajax({
         type: "GET",
         url: window.location.pathname,
         dataType: 'json',
         success: function(data) {
            draw(data);
         },
         error: function (xhr, status, error) {
             console.log('ERROR', error)
         }
     });
 };

});