post '/tags' do
  if params[:name] != ""
    redirect to ("/tags/#{params[:name]}")
  else
    @noTag = true
    erb :index
  end  
end

get '/tags/:name' do #display a specific
  if Tag.exists?(name: params[:name])
    @tag = Tag.find_by(name: params[:name])
    @posts = @tag.posts
    erb :show_tags
  else
    @noTag = true
    erb :index
  end
end