$(function () {

  // Fit text area height
  $('.tolk_translations td textarea').each(function () {
    $(this).css({ height: $(this).parent('td').css('height')});
  });

});
