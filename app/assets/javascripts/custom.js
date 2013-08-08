//$(document).ready(function() {
//  $(".user").on("click", ".follow", function() {
//    var user_id = $(this).attr("data-user-id");
//    var _this = $(this);
//    $.ajax({
//      type: "POST",
//      url:  "/relationships",
//      dataType: "json",
//      data: { 'user_id': user_id },
//      success: function(data) {
//        _this.text("取消关注").attr("data-relationship-id", data['relationship-id']).removeClass("follow").addClass("unfollow");
//      }
//    });
//  });
//
//  $(".user").on("click", '.unfollow', function() {
//    var user_id = $(this).attr("data-user-id");
//    var _relationship_id = $(this).attr("data-relationship-id");
//    var _this = $(this);
//    $.ajax({
//      type: "POST",
//      url: "/relationships/" + _relationship_id,
//      dataType: "json",
//      data: { 'user_id': user_id, "_method": "delete" },
//      success: function() {
//        _this.text("关注").removeAttr("data-relationship-id").removeClass("unfollow").addClass("follow");
//      }
//    });
//  });
//});
//
