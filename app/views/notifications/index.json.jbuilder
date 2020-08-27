json.array! @notifications do |notification|
  json.id notification.id
  json.unread !notification.read_at?
  # This builds where to put specific html for each different notification type
  # the partial looks into the notifications folder and follows a specific convention
  json.template render partial: "notifications/#{notification.notifiable_type.underscore.pluralize}/#{notification.action.downcase}", locals: {notification: notification}, formats: [:html]
end
