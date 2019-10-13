class SessionsController < ApplicationController

get '/login' do
  erb :"sessions/login.html"
end

post '/sessions' do
    login(params[:email], params[:password])
  redirect '/recipes'
end

   get '/logout' do
     log_out!
     redirect '/'
   end
end
