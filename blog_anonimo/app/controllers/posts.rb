get '/posts' do #display a list of all
  @posts = Post.all
  erb :show_posts
end

get '/posts/new' do # return an HTML form for creating a new 
end

post '/posts' do #create a new
  post = Post.new(title: params[:title], body: params[:body])
  if post.valid?
    post.save()
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
  else
    @post = post
    @errors_post = true
    erb :index
  end
end

post '/posts_get' do
  if params[:title] != ""
    redirect to ("/posts/#{params[:title]}")
  else
    @noPost = true
    erb :index
  end
end

get '/posts/:title' do #display a specific
  title = params[:title]
  if Post.exists?(title: title)
    @posts = Post.where(title: title)
    erb :show_posts
  else
    @noPost = true
    erb :index
  end
end

get '/posts/:id/edit' do #return an HTML form for editing
  @post = Post.find(params[:id])
  @tags = []
  @post.tags.each do |tag|
    @tags << tag.name
  end
  @tags = @tags.join(', ')
  erb :edit_post
end

patch "/posts/:id" do #update a specific
end

post '/posts/edit' do #return an HTML form for editing
  post = Post.find(params[:id])
  post.title = params[:title]
  post.body = params[:body]
  post.tags = []

  #Para los tags viejos
  p original_tags = params[:original_tags].split(',')
  p tags = params[:tags].split(',')
  p old_tags = original_tags - tags
  if old_tags.length > 0
    old_tags.each do |name_tag|
      p tag = Tag.find_by(name: name_tag.strip)
      if tag.posts.length <= 1
        Tag.delete(tag.id)
      end
    end
  end
  #Para los tags nuevos
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
  post.save()
  @posts = Post.all
  erb :show_posts
end

delete "/posts/:id" do  #delete a specific
end

get "/posts/delete/:id" do
  post = Post.find(params[:id])
    post.tags.each do |tag|
      if tag.posts.length == 1
        Tag.delete(tag.id)
      end
    end
  Post.delete(params[:id])
  @posts= Post.all
  erb :show_posts
end