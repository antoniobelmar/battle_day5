require 'sinatra/base'

class Battle < Sinatra::Base
  enable :sessions
  get '/' do
    erb :index
  end

  get "/play" do
    @pl1 = session[:pl1]
    @pl2 = session[:pl2]
    erb(:play)
  end

  post '/names' do
    session[:pl1] = params[:player1]
    session[:pl2] = params[:player2]
    redirect "/play"
  end

  get "/attack" do
    erb :attack
  end

  # start the server if ruby file executed directly
  run! if app_file == $0
end
