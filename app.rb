require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get "/play" do
    @hp = Player::STARTING_HP
    @turn = $game.turn
    @pl1_name = $game.player1.name
    @pl2_name = $game.player2.name
    @pl1_hp = $game.player1.hp
    @pl2_hp = $game.player2.hp
    erb(:play)
  end

  get "/attack" do
    $game.attack
    redirect "/play"
  end

  post '/names' do
    player_1 = Player.new(params[:player1])
    player_2 = Player.new(params[:player2])
    $game = Game.new(player_1, player_2)
    redirect "/play"
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
