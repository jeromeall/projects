require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'

get '/' do
  @title = "Movie Search"
  @background = "/images/film_reel.jpg"
  erb :index
end


post '/result' do
  search_str = params[:movie]
  @title = "Movie Results"
  
  # Make a request to the omdb api here!
  
  s_response = Typhoeus.get("www.omdbapi.com", :params => {:s => search_str})
  binding.pry
  @s_result = JSON.parse(s_response.body)

  imdb_id_arr = @s_result["Search"].map{|movie_title| movie_title["imdbID"]}

  @info_arr = []
  imdb_id_arr.each do |imdb_id|    
    i_response = Typhoeus.get("www.omdbapi.com", :params => {:i => imdb_id})
    i_result = JSON.parse(i_response.body)
    @info_arr << i_result
  end
  # binding.pry

  erb :result

  # Modify the html output so that a list of movies is provided.

end


