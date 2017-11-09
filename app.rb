require 'sinatra/base'
require_relative './lib/player'
require_relative './lib/game'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get "/play" do
    @pl1_name = $pl1.name
    @pl2_name = $pl2.name
    erb(:play)
  end

  post '/names' do
    $pl1 = Player.new(params[:player1])
    $pl2 = Player.new(params[:player2])
    redirect "/play"
  end

  get "/attack" do
    Game.new.attack($pl2)
    @pl2_hp = $pl2.hp
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
