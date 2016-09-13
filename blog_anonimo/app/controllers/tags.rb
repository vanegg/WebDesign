post '/tags' do
  redirect to ("/tags/#{params[:name]}")
end

get '/tags/:name' do #display a specific
  @tag = Tag.find_by(name: params[:name])
  @posts = @tag.posts
  erb :show_tags
end