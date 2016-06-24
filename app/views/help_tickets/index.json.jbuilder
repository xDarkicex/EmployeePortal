json.array!(@help_tickets) do |help_ticket|
  json.extract! help_ticket, :id, :user_id, :device, :title, :comments, :body
  json.url help_ticket_url(help_ticket, format: :json)
end
