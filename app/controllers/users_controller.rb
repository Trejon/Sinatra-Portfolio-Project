class UsersController < ApplicationController

  get '/signup' do
    erb :"users/signup.html"
  end

  post '/users' do
    @user = User.new
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
      redirect '/login'
    else
      erb :"users/signup.html"
    end
  end
  # post '/users' do
  #     redirect '/login'
  #   end
  #
  #
  # get '/users/:id' do
  #     if !logged_in?
  #       redirect '/login'
  #     end
  #
  #     # @user = User.find_by_id(params[:id])
  #     # @meal = Meal.where(user_id: current_user.id)
  #     @recipes = current_user.recipes
  #     if !@recipes.empty?
  #       erb :'users/show'
  #     else
  #       flash[:notice] = "Sorry, you have no recipes!"
  #       redirect '/recipes'
  #     end
  #   end
  #
  #   get '/signup' do
  #     if !logged_in?
  #       erb :'users/signup.html'
  #     else
  #       flash[:notice] = "You already have an account!"
  #       redirect '/recipes'
  #     end
  #   end
  #
  #   post '/signup' do
  #     if params[:email] == "" || params[:password] == "" || params[:username]
  #       # flash[:notice] = "Fields cannot be blank!"
  #       redirect '/signup'
  #     else
  #         @user = User.new(:email => params[:email], :password => params[:password], :username => params[:username])
  #       @user.save
  #       session[:user_id] = @user.id
  #       # flash[:notice] = "You're now signed up!"
  #       redirect '/recipes.html'
  #     end
  #   end
  #
  #   # get '/login' do
  #   #   if !logged_in?
  #   #     erb :'sessions/login.html'
  #   #   else
  #   #     session[:id] == @user_id
  #   #     redirect '/recipes'
  #   #   end
  #   # end
  #   #
  #   # post '/login' do
  #   #   @user = User.find_by(:email => params[:email])
  #   #   if @user && @user.authenticate(params[:password])
  #   #     session[:user_id] = @user.id
  #   #     redirect '/recipes/recipes.html'
  #   #   else
  #   #     # flash[:notice] = "Oops! We had a problem with your log in! Please try again."
  #   #     redirect '/login'
  #   #   end
  #   # end
  #   #
  #    get '/logout' do
  #     if logged_in?
  #       session.destroy
  #       redirect to '/login'
  #     else
  #       redirect to '/'
  #     end
  #   end
  # end
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  #
  # post '/users' do
  #   @user = User.new
  #   @user.email = params[:email]
  #   @user.password = parmas[:password]
  #   if @user.save
  #     redirect '/login'
  #   else
  #     erb :"users/new.html"
  #   end
end
