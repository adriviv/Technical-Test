json.array! @listings do |listing|
  json.extract! listing, :id, :num_rooms
end
