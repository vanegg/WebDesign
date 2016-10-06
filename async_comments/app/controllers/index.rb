get '/' do
  @comments = Comment.all
  erb :index
end

post '/add' do
  comm = Comment.new(text: params[:comment], author: params[:author]);
  return comm.save ? "true" : "false"
end