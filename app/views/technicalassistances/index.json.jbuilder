json.array!(@technicalassistances) do |technicalassistance|
  json.extract! technicalassistance, :id, :title, :device, :descripton, :avatar
  json.url technicalassistance_url(technicalassistance, format: :json)
end
