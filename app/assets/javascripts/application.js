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
//= require jquery.turbolinks
//= require_tree .

$(function(){
  $("#question_content").on("keyup keydown mouseleave", checkLength);
  $("#answer_content").on("keyup keydown mouseleave", checkLength);

  function checkLength() {
    var maxLength = 200;
    var length = $(this).val().length;
    $(".post .counter").text(maxLength - length);
    if ( length == 0 || length > 200) {
      $(".post .button").attr("disabled", "disabled").addClass("disabled");
    }
    else {
      $(".post .button").removeAttr("disabled").removeClass("disabled");
    }
  };
});
