json.array!(@employees) do |employee|
  json.extract! employee, :id, :avatar, :firstname, :lastname, :jobtitle, :skills, :email, :phone
  json.url employee_url(employee, format: :json)
end
