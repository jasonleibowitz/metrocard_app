$( document ).ready(function() {
    console.log( "loaded bro!" );

    // bind startApp function to the start button
    $('#start').click(partOne);

    // bind ajax request on click of submit button
    $('#submit').click(calculate);

    // get value of weekend when first submit clicked
    $('#weekday-submit').click(partTwo);

    $('#weekend-submit').click(partThree);


});

function partOne(){
  $('#part-1').remove();
  $('#part-2').css('visibility', 'visible');
}

function partTwo(){
  weekday = $('#weekday').val();
  console.log(weekday);
  $('#part-2').remove();
  $('#part-3').css('visibility', 'visible');
}

function partThree(){
  weekend = $('#weekend').val();
  console.log(weekend);
  $('#part-3').remove();
  calculate();
}

function calculate(){
  $('.loading').css('visibility', 'visible');
  $.getJSON( "metrocard", { weekday: weekday, weekend: weekend })
  .done(function(json){
    console.log("JSON Data: " + json.text);
    $('.loading').css('visibility', 'hidden');
    $('.answer').append(json.text);
    $('.answer').append("<br /><br /><button id='restart'>Start Again</button>");
    $('button#restart').click(function(){
      location.reload();
    });
  });
}
