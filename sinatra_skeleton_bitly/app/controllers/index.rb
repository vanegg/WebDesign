get '/' do
  # Deja a los usuarios crear una URL reducida y despliega una lista de URLs. 
  @short_url = params[:short_url]
  if @short_url
    @urls = Url.all
  end
  erb :index
end

post '/urls' do
  url = Url.new(long_url: params[:long_url])
  if url.save 
    redirect to ("/?short_url=#{url.short_url}")
  else
    @falla = true
    erb :index
  end
end

post '/urlshort' do
  redirect to ("/#{params[:short_url]}")
end

# e.g., /q6bda
get '/:short_url' do
  # redirige a la URL original
  url = Url.find_url(params[:short_url])
  puts "EL URL #{url}"
  redirect to url
end