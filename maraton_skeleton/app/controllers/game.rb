get '/:user_id/play/:deck_name/:num_card' do
  @user_id = params[:user_id]
  @deck = Deck.find_by(name: params[:deck_name])
  @deck.rounds << User.find(@user_id).rounds.last
  user = User.find(@user_id)

  # AQUI ME QUEDEEEE!!!!!!!!!
  if params[:answer] != "" || params[:answer] != nil
    if params[:answer] == @deck.cards[params[:num_card].to_i].answer
      puts "Respuesta Correcta"
      intento = user.rounds.last.guesses.last
      intento.result = true
      intento.save()
      @num_card = (params[:num_card].to_i + 1).to_s
      guess = Guess.create(tries: 0, result: false)
      user.rounds.last.guesses << guess
    else
      puts "Respuesta incorrecta"
      guess = user.rounds.last.guesses.last
      guess.tries += 1
      guess.save()
      @num_card = (params[:num_card].to_i).to_s
    end
  end
   # AQUI ME QUEDEEEE!!!!!!!!!
  if @num_card.to_i < @deck.cards.length
    @try = user.rounds.last.guesses.last.tries
    i = params[:num_card].to_i
    @cards = @deck.cards[i]
    @answers = [@cards.answer, @cards.fake_answer1, @cards.fake_answer2].shuffle
    erb :play
  else
    erb :statistics
  end
end

post '/:user_id/play/:deck_name/:num_card' do
  redirect("/#{params[:user_id]}/play/#{params[:deck_name]}/#{params[:num_card]}?answer=#{params[:answer]}")
end

post '/:user_id/play/:deck_name' do
  @user_id = params[:user_id]
  user = User.find(@user_id)
  guess = Guess.create(tries: 0, result: false)
  user.rounds.last.guesses << guess
  redirect("/#{params[:user_id]}/play/#{params[:deck_name]}/0")
end

post '/statistics' do
  erb :statistics
end