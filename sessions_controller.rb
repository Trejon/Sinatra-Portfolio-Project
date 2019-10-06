class SessionsController < ApplicationController

  get '/login' do
    erb :'/sessions/login.html'
  end

  post '/sessions' do
    log_in(params[:email], params[:password])
    redirect '/posts'
  end

  get '/logout' do
    log_out!
    redirect '/posts'
  end

end
