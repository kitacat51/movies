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
  n_movie = Movie.create!(overview: movie["table"]["overview"], 
               title: movie["table"]["title"], 
               published: movie["table"]["release_date"], 
               image: movie["table"]["poster_path"])  
             
 Tmdb::Movie.detail(movie["table"]["id"])["genres"].pluck(:name).each do |genre|
     n_genre = Genre.find_by(name: genre)
   
    if !n_genre
        n_genre = Genre.create!(name: genre)
         n_genre.movie_genres.create!(movie_id: n_movie.id)
   
    else
     n_genre.movie_genres.create!(movie_id: n_movie.id)
    end

 end

end