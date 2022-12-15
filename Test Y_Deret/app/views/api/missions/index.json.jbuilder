json.array! @missions do |mission|
  json.extract! mission, :listing_id, :mission_type, :date, :price
end
