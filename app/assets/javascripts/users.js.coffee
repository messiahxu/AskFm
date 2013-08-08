# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready ->
  $(".user").on "click", ".follow", ->
    user_id = $(this).attr("data-user-id")
    _this = $(this)
    $.ajax(
      type: "POST"
      url: "/relationships"
      dataType: "json"
      data:
        user_id: user_id
      success: (data) ->
        _this.text("取消关注").attr("data-relationship-id", data["relationship-id"]).removeClass("follow").addClass "unfollow"
    )

  $(".user").on "click", ".unfollow", ->
    user_id = $(this).attr("data-user-id")
    _relationship_id = $(this).attr("data-relationship-id")
    _this = $(this)
    $.ajax(
      type: "POST"
      url: "/relationships/" + _relationship_id
      dataType: "json"
      data:
        user_id: user_id
        _method: "delete"
      success: ->
        _this.text("关注").removeAttr("data-relationship-id").removeClass("unfollow").addClass "follow"
    )


