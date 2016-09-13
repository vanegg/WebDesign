get '/posts' do #display a list of all
  @posts = Post.all
  erb :show_posts
end

get '/posts/new' do # return an HTML form for creating a new 
end

post '/posts' do #create a new
end

get '/posts/:id' do #display a specific
end

get '/posts/:id/edit' do #return an HTML form for editing
end

patch "/posts/:id" do #update a specific
end

delete "/posts/:id" do  #delete a specific
end