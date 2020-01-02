### This code doesn't work, hence it breaks the .gifts one as well.
# json.extract! @guest do
#   json.partial! 'guest', guest: @guest
# end



json.extract! @guest, :name, :age, :favorite_color

json.gifts do 
  # @guest.gifts.each do |gift|
  #   json.title gift.title
  #   json.description gift.description
  # end
  json.array! @guest.gifts, :title, :description
end