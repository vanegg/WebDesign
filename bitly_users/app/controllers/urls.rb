get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  @short_url = params[:short_url]
  if @short_url
    urls << Url.find_by(user_id: session[:id])
  end
  erb :index
end

get '/urls/unregistred' do
  url = Url.new(long_url: params[:long_url])
  if url.save 
    @short_url = params[:short_url]
    @urls = []
    @urls << Url.find_by(user_id: nil)
  else
    @falla = true
  end
  erb :index    
end

get '/urls' do
  url = Url.new(long_url: params[:long_url])
  if current_user
   current_user.urls << url
  end

  if url.save 
    @short_url = params[:short_url]
  else
    @falla = true
  end
  erb :profile     
end

post '/urlshort' do
  redirect to ("/url/#{params[:short_url]}")
end

get '/url/:short_url' do
  # redirige a la URL original
  if Url.exists?(short_url: params[:short_url])
    url = Url.find_url(params[:short_url])
    redirect to url
  end
end