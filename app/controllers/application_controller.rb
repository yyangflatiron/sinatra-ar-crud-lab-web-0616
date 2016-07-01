require_relative '../../config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

#NEW
  get '/posts/new' do
    erb :new
  end

#CREATE
  post '/posts' do
    @post = Post.create(params)
    erb :show
  end

# #CREATE
#   post '/posts/:id' do
#     @post = Post.create(params[:id])
#     redirect '/posts' #WHY REDIRECT??
#   end

#INDEX
  get '/posts' do
    @posts = Post.all
    erb :index
  end

#SHOW
  get '/posts/:id' do
    @post = Post.find(params[:id])
    erb :show
  end


#UPDATE PART 1
  get '/posts/:id/edit' do
    @post = Post.find(params[:id])
    erb :edit
  end

#UPDATE PART 2
  patch '/posts/:id' do
    @post = Post.find(params[:id])
    @post.name = params[:name]
    @post.content = params[:content]
    @post.save
    erb :show
  end

#DELETE
  delete '/posts/:id/delete' do
    @post = Post.find(params[:id])
    @post.delete
    erb :deleted
  end


end