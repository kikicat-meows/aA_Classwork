# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

ActiveRecord::Base.transaction do
    Todo.destroy_all
    titles = ['groceries', 'laundry', 'car wash', 'dinner date', 'wipedown']
    body = ['stuff1', 'stuff2', 'stuff3', 'stuff4', 'stuff5']
    titles.each_with_index do |title, idx| 
        Todo.create!(title: title, body: body[idx], done: false)
        
    end 
end