require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get "/play" do
    @pl1_name = $game.player1.name
    @pl2_name = $game.player2.name
    erb(:play)
  end

  post '/names' do
    player_1 = Player.new(params[:player1])
    player_2 = Player.new(params[:player2])
    $game = Game.new(player_1, player_2)
    redirect "/play"
  end

  get "/attack" do
    @hp = $game.attack
    erb :attack
  end
  
  # start the server if ruby file executed directly
  run! if app_file == $0
end
