// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.

$(document).ready(function()  {

function draw(data){
  d3.select( ".category-party-chart" )
    .selectAll( "div" )
      .data( data )
    .enter().append( "div" )
      .style( "width", function(d) { return d * 100 + "px"; })
      .text( function(d) { return d; });
  }


if($(".category-party-chart")) {
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