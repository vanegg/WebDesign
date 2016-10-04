post '/upload' do
  @photo = Photo.new(params[:photo])
  @photo.save!
  @album = Album.find(params[:id_album])
  @album.photos << @photo
  redirect '/'
end

get '/user/:id_user/album/:id_album' do 
  @album = Album.find(params[:id_album])
  @photos = @album.photos
  erb :view_photos
end

post "/create_album" do
  album = Album.create(title: params[:name_album])
  current_user.albums << album
  album.id.to_s
end