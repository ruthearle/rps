
require 'sinatra/base'
require './lib/player'
require './lib/game'

class RockPaperScissors < Sinatra::Base
configure :production do
  require 'newrelic_rpm'
end


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
    @player1 = Player.new(params[:name])
    GAME.add_player1(@player1)
    computer = generate_computer
    GAME.add_player2(computer)
    erb :play
  end

  post '/play' do
    @player1 = GAME.players.first
    @player1.picks = params[:pick]
    @player2 = GAME.players.last
    @player2.picks = comp_choice
    @messages = GAME.messages
    GAME.play
    erb :play
  end

  post '/play_again' do
    @player1 = params[:name]
    erb :play
  end


  def generate_computer
   comp = Player.new("computer")
   comp
  end

  def comp_choice
    choice = ["Rock","Paper","Scissors"].sample
    choice
  end

end
