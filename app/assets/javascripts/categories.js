// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function()  {

function draw(data){
  d3.select( ".category-show-chart-container" )
    .selectAll( "div" )
      .data( data )
    .enter().append( "div" )
      .style( "width", function(d) { return d * 100 + "px"; })
      .text( function(d) { return (d * 100).toFixed(2) + "%"; });
  }


if($(".category-show-chart-container")) {
    $.ajax({
         type: "GET",
         url: window.location.pathname+'/category_positions',
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