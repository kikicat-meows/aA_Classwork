# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

users = User.create([{username: 'jon'}, {username: 'helen'}, {username: 'walker'}, {username: 'dog'}, {username: 'cat'}, {username: 'jonjon'}, {username: 'jonsnow'}, {username: 'jon2'}])

Artwork.create(title: 'WinterSnowflakes', img_url: '123.com/snowflakes.jpg', artist_id: 1)
Artwork.create(title: 'SummerRain', img_url: '123.com/summerrain.jpg', artist_id: 2)
Artwork.create(title: 'FallFire', img_url: 'deathanddestruction.com/fire.jpg', artist_id: 1)
Artwork.create(title: 'SpringGarden', img_url: '123.com/springgarden.jpg', artist_id: 2)

ArtworkShare.create(artwork_id: 1, viewer_id: 3)
ArtworkShare.create(artwork_id: 2, viewer_id: 3)
ArtworkShare.create(artwork_id: 2, viewer_id: 5)
ArtworkShare.create(artwork_id: 1, viewer_id: 4)
ArtworkShare.create(artwork_id: 4, viewer_id: 1)



Comment.create(artwork_id: 1, author_id: 1, body: 'Nahhhhhhhhh no snow')
Comment.create(artwork_id: 3, author_id: 3, body: 'Walker away')
Comment.create(artwork_id: 2, author_id: 2, body: 'Mine is the best')
Comment.create(artwork_id: 4, author_id: 4, body: 'woooooof')
Comment.create(artwork_id: 2, author_id: 5, body: 'moooo')