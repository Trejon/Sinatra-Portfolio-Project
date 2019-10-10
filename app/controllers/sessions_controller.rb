class SessionsController < ApplicationController

get '/login' do
  erb :"sessions/login.html"
end

post '/sessions' do
    login(params[:email], params[:password])
  redirect '/recipes'
end
  # get '/signup' do
  #   erb :"users/signup.html"
  # end
  #
  # post '/signup' do
  #   if params[:username] == "" || params[:email] == "" || params[:password] == ""
  #     redirect to '/signup'
  #   else
  #     @user = User.new(:username => params[:username], :email => params[:email], :password => params[:password])
  #     @user.save
  #     session[:user_id] = @user.id
  #     redirect to '/recipes'
  #   end
  # end

#   post '/sessions' do
#     redirect '/recipes'
#   end
# end


#   get '/login' do
#     if !logged_in?
#     erb :'/sessions/login.html'
# else
#   redirect to '/recipes'
#     end
#   end
#
#   post '/login' do
#     log_in(params[:email], params[:password])
#     redirect '/recipes'
#   end
#
   get '/logout' do
     log_out!
     redirect '/login'
   end
#
# end
end
