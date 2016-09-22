get '/' do
  erb :index
end

post '/game' do
  redirect("/game?player1=#{params[:player1]}&player2=#{params[:player2]}")
end

get '/game' do 

  if Player.exists?(name: params[:player1])
    @player1 = Player.find_by(name: params[:player1])
  else
    @player1 = Player.create(name:: params[:player1])
  end

  if Player.exists?(name: params[:player2])
    @player2 = Player.find_by(name: params[:player2])
  else
    @player2 = Player.create(name: params[:player2])
  end  
  erb :game
end

post '/result' do 
  if request.xhr?
    #AJAX
    gamep = params[:user_input].split(",")

    result_1 = gamep[0].to_i
    result_2 = gamep[1].to_i
    win = gamep[2]
    name1 = gamep[3]
    name2 = gamep[4]

    @game = Game.create(winner: win, result1: result_1, result2: result_2)
    @player1 = Player.find_by(name: name1)
    @player2 = Player.find_by(name: name2)
    @player1.games << @game
    @player2.games << @game
    erb :_url, layout: false
    @game.id.to_s
  else
    #HTML  
    @player1 = Player.find_by(name: params[:player1])
    @player2 = Player.find_by(name: params[:player2])
    erb :result 
  end 

end

get '/result' do 
  p @game = Game.find(params[:game])
  p @player1 = Player.find_by(name: params[:player1])
  p @player2 = Player.find_by(name: params[:player2])
  erb :result
end