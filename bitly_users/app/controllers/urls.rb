get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  @short_url = params[:short_url]
  if @short_url
     urls << Url.find_by(user_id: session[:id])
  end
  erb :index
end

post '/urls' do
  url = Url.new(long_url: params[:long_url])
  if current_user
   p current_user.urls << url
  end

  if url.save 
     @short_url = params[:short_url]
  else
    @falla = true
  end

    erb :profile 
    
end

post '/urlshort' do
  redirect to ("/#{params[:short_url]}")
end

get '/:short_url' do
  # redirige a la URL original
  url = Url.find_url(params[:short_url])
  redirect to url
end