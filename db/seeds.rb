# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#Admin.create!(email: "admin@123.com", password: "aaaaaa")



require 'themoviedb-api'
 Tmdb::Api.key("3804a932a84eed879946981a8af29cbf")
 Tmdb::Api.language("ja")

JSON.parse((Tmdb::Movie.popular).to_json)["table"]["results"].each do |movie|
  byebug
  Movie.create(overview: movie["table"]["overview"], 
               title: movie["table"]["title"], 
               published: movie["table"]["release_date"], 
               genre_id: movie["table"]["genres"], 
               image: movie["table"]["poster_path"])

end

