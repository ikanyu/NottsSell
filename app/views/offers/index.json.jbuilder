json.array!(@offers) do |offer|
  json.extract! offer, :id, :product_id, :priceOffer, :user_id
  json.url offer_url(offer, format: :json)
end
