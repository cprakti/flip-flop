// Place all the behaviors and hooks related to the matching controller here.
// All this logic will automatically be available in application.js.
$(document).ready(function()  {

function draw(data){
  d3.select( ".legislator-show-chart-container" )
    .selectAll( "div" )
      .data( data )
    .enter().append( "div" )
      .style( "width", function(d) { return d * 150 + "vmin"; })
      .text( function(d) { return (d * 100).toFixed(1) + "%"; });
  }


if($(".legislator-show-chart-container")) {
    $.ajax({
         type: "GET",
         url: window.location.pathname+'/legislator_votes',
         dataType: 'json',
         success: function(data) {
            draw(data);
         },
         error: function (xhr, status, error) {
             console.log('ERROR', error)
         }
     });
 };

    // $.ajax({
    //      type: "GET",
    //      url: window.location.pathname+'/yes_votes',
    //      dataType: 'json',
    //      success: function(data) {
    //         draw(data);
    //      },
    //      error: function (xhr, status, error) {
    //       // debugger;
    //          console.log('ERROR', error)
    //      }
    //  });

//window.location.pathname
        // debugger;
// if($(".votes-yes")) {
//     $.ajax({
//          type: "GET",
//          url: window.location.pathname+'/yes_votes',
//          dataType: 'json',
//          success: function(data) {
//             draw(data);
//          },
//          error: function (xhr, status, error) {
//           // debugger;
//              console.log('ERROR', error)
//          }
//      });
//  // };

// // if($(".votes-no")) {
//     $.ajax({
//          type: "GET",
//          url: window.location.pathname+'/no_votes',
//          dataType: 'json',
//          success: function(data) {
//             draw(data);
//          },
//          error: function (xhr, status, error) {
//           // debugger;
//              console.log('ERROR', error)
//          }
//      });
 // };


});