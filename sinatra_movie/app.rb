require 'sinatra'
require 'sinatra/reloader'
require 'typhoeus'
require 'json'
require 'pry'

get '/' do
  @title = "Movie Search"
  erb :index
end

post '/result' do
  search_str = params[:movie]
  @title = "Movie Results"
  # Make a request to the omdb api here!
  response = Typhoeus.get("www.omdbapi.com", :params => {:s => search_str})
  @result = JSON.parse(response.body)

  erb :result

  # Modify the html output so that a list of movies is provided.

end




get '/poster/:imdb' do |imdb_id|
  @title = "Movie Poster"
  # Make another api call here to get the url of the poster.
  response = Typhoeus.get("www.omdbapi.com", :params => {:i => imdb_id })
  @result = JSON.parse(response.body)

  erb :poster
end

