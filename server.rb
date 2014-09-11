require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base

  enable :sessions
  #set :views, Proc.new { File.join(root, "..", "views") }
  GAME = Game.new

  get '/' do
    erb :index
  end

  get '/new-game' do
    erb :new_game
  end

  post '/register' do
    @player1 = params[:name]
    GAME.player1= nil
    GAME.player2= nil
    erb :play
  end


  post '/add_another_player' do
    @player2 = params[:name]
    erb :new_game
  end

  post '/play_again' do
    @player1 = params[:name]
    erb :play
  end
  
  post '/play' do
    player = Player.new(params[:name])
    player.picks = params[:pick]
    GAME.add_player(player)
    computer = generate_computer
    GAME.add_player(computer)
    erb :outcome
  end


   def generate_computer
    choice = ["Rock","Paper","Scissors"].sample
    comp = Player.new("computer")
    comp.picks = choice
    comp
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
