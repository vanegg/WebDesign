get '/' do
  erb :index
end

get '/:new_word' do
  @anagrams = []
	@new_word = params[:new_word]
  @anagrams = Word.find_anagrams(@new_word)
  erb :word
end

post '/new_word' do
  redirect to ("/#{params[:user_word]}")
end