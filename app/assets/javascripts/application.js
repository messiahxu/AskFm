// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or vendor/assets/javascripts of plugins, if any, can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/sstephenson/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .

$(function(){
  function checkLength() {
    var maxLength = 200;
    var length = $(this).val().length;
    var rest = $(".post .counter").text(maxLength - length);
    if (rest.text() <= 0) {
      $(".post .button").attr("disabled", "disabled").addClass("disabled");
      var keep = $(this).val().slice(0, 200);
      $(this).val(keep);
    }
  };
  $("#question_content").keyup(checkLength);
  $("#answer_content").keyup(checkLength);
});
