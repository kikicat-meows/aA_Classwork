@pokemon.each do |poke|
  json.set! poke.id do
    json.extract! poke, :id, :name
    json.image_url asset_path("pokemon_snaps/#{poke.image_url}")
    # json.image_url asset_path("pokemon_snaps/#{poke.id}.svg") ## this doesn't work, but #{num} or num.svg works
  end
end