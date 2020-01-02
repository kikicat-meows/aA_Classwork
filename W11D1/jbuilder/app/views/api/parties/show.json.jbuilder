json.extract! @party, :name, :location, :guest_ids

# json.party do
#   json.set! @party.id do
#     json.extract! @party, :name, :location
#   end
# end

json.guests do
  json.array! @party.guests do |guest|
    # json.name guest.name
    # json.gifts
    json.extract! guest, :name, :age, :favorite_color
    
    json.gifts do
      json.array! guest.gifts.each do |gift|
        json.extract! gift, :title, :description
      end
    end
  end
end

# json.gifts do
#   @party.gifts.each do |gift|
#     json.set! gift.id do
#       json.extract! gift, :title, :description
#     end
#   end
# end

