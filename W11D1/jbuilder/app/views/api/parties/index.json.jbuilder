json.array! @parties, :name, :location, :guest_ids

# json.parties do
  # @parties.each do |party|
  #   json.set! party.id do
  #     json.extract! party, :name, :location, :guest_ids
  #     ### guest_ids usable through associations (must be pluralized for has_many)
  #   end
  # end
# end


# json.guests do
  # @parties.each do |party|
  #   party.guests.each do |guest|
  #     json.set! guest.id do
  #       json.extract! guest, :name
  #     end
  #   end
  # end
# end