json.pokemon do
  json.extract! @poke, :id, :name, :attack, :defense, :poke_type, :moves, :image_url, :item_ids
end

json.items do
  @poke.items.each do |item|
    json.set! item.id do
      json.extract! item, :id, :name, :pokemon_id, :price, :happiness, :image_url
    end
  end
end