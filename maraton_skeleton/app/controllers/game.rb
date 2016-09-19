post '/play/:name' do
  p params
  @deck = Deck.find_by(name: params[:name])
  ran = rand(@deck.cards.length)
  redirect("/play/#{params[:name]}/:id")
end

 get '/play/:name/:id' do
  
 end

post '/statistics' do
  p params
  erb :statistics
end