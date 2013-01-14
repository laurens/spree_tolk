//= require admin/spree_core

$(function() {
  var container = $("div.tolk_translations");
  
  if (!container.length) {
    return;
  }

  container.find("td textarea").each(function() {
    var textarea = $(this);
    
    textarea.css('height', textarea.closest("td").height());
  })
})