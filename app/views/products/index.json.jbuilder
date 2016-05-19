json.array!(@products) do |product|
  json.extract! product, :id, :productphoto, :name, :price, :descripton, :dosage
  json.url product_url(product, format: :json)
end
