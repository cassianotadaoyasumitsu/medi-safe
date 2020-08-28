class Notifications
  constructor: ->
    @notifications = $("[data-behavior='notifications']")

    if @notifications.length > 0
      @handleSuccess @notifications.data("notifications")
      $("[data-behavior='notifications-link']").on "click", @handleClick

      setInterval (=>
        @getNewNotifications()
      ), 15000

  getNewNotifications: ->
    $.ajax(
      url: "/notifications.json"
      dataType: "JSON"
      method: "GET"
      success: @handleSuccess
    )

  handleClick: (e) =>
    $.ajax(
      url: "/notifications/mark_as_read"
      dataType: "JSON"
      method: "PATCH"
      success: ->
        $("[data-behavior='unread-count']").text('')
        $("[data-behavior='notification-bell']").removeClass('notify')
        $("[data-behavior='unread-count']").removeClass('notification-count')

    )

  handleSuccess: (data) =>
    items = $.map data, (notification) ->
      notification.template

    unread_count = 0
    $.each data, (i, notification) ->
      if notification.unread
        $("[data-behavior='notification-bell']").addClass('notify')
        unread_count += 1

    if unread_count > 0
      $("[data-behavior='unread-count']").text(unread_count)
      $("[data-behavior='unread-count']").addClass('notification-count')


    $("[data-behavior='notification-items']").html(items)


jQuery ->
  new Notifications
