get '/posts' do #display a list of all
  @posts = Post.all
  erb :show_posts
end

get '/posts/new' do # return an HTML form for creating a new 
end

post '/posts' do #create a new
  post = Post.create(title: params[:title], body: params[:body])
  if params[:tags] != nil
    tags = params[:tags].split(',')
    tags.each do |tag|
      if Tag.exists?(name: tag.strip)  
        post.tags << Tag.find_by(name: tag.strip)
      else
        post.tags << Tag.create(name: tag.strip)
      end  
    end
  end
  redirect to ("/posts")
end

#REVISARRRR

post '/posts_get' do
  redirect to ("/posts/#{params[:title]}")
end

get '/posts/:id' do #display a specific
  title = params[:id]
  if Post.exists?(title: title) 
    @posts = Post.where(title: title)
    erb :show_posts
  else
    @falla = true
    erb :index
  end
end

get '/posts/:id/edit' do #return an HTML form for editing
end

patch "/posts/:id" do #update a specific

end

delete "/posts/:id" do  #delete a specific
end

get "/posts/delete/:id" do
  Post.delete(params[:id])
  @posts= Post.all
  erb :show_posts
end