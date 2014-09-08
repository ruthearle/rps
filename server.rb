require 'sinatra/base'

class RockPaperScissors < Sinatra::Base

  #set :views, Proc.new { File.join(root, "..", "views") }

  get '/' do
    erb :index
  end

  get '/register' do
    erb :new_game
  end

  post '/play' do
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
