# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


Cat.create([
  {birth_date: Date.parse("2018-07-07"), name: "Freddy", color: "orange", sex: "M"}, 
  {birth_date: Date.parse("2019-01-20"), name: "Noynoy", color: "white", sex: "F"}, 
  {birth_date: Date.parse("2009-02-25"), name: "Crescent", color: "grey", sex: "F"}, 
  {birth_date: Date.parse("2015-03-27"), name: "Tiggy", color: "orange", sex: "M"},
  {birth_date: Date.parse("2006-06-06"), name: "Tenderloin", color: "white", sex: "F"},
  {birth_date: Date.parse("1995-05-30"), name: "Vince", color: "black", sex: "F"},
  {birth_date: Date.parse("1988-07-07"), name: "KikiCat", color: "white", sex: "F"}
])

CatRentalRequest.create([
  {cat_id: 1, start_date: Date.parse("2019-03-15"), end_date: Date.parse("2025-07-07"), status: "approved"},
  {cat_id: 1, start_date: Date.parse("2019-07-15"), end_date: Date.parse("2020-07-07"), status: "pending"},
  {cat_id: 1, start_date: Date.parse("2020-03-15"), end_date: Date.parse("2022-07-07"), status: "denied"},
  {cat_id: 2, start_date: Date.parse("2018-12-25"), end_date: Date.parse("2019-02-15"), status: "approved"},
  {cat_id: 6, start_date: Date.parse("2018-12-25"), end_date: Date.parse("2019-02-15"), status: "approved"},
  {cat_id: 6, start_date: Date.parse("2019-03-01"), end_date: Date.parse("2019-04-15"), status: "approved"},
  {cat_id: 6, start_date: Date.parse("2019-05-01"), end_date: Date.parse("2019-07-15"), status: "approved"},
  {cat_id: 6, start_date: Date.parse("2019-07-19"), end_date: Date.parse("2019-12-31"), status: "approved"},
  {cat_id: 4, start_date: Date.parse("2018-12-25"), end_date: Date.parse("2019-02-15"), status: "approved"},
  {cat_id: 5, start_date: Date.parse("2018-12-25"), end_date: Date.parse("2019-02-15"), status: "approved"}

])
