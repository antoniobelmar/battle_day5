require 'sinatra/base'
require_relative './lib/player'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get "/play" do
    @pl1 = $pl1.name
    @pl2 = $pl2.name
    erb(:play)
  end

  post '/names' do
    $pl1 = Player.new(params[:player1])
    $pl2 = Player.new(params[:player2])
    redirect "/play"
  end

  get "/attack" do
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
