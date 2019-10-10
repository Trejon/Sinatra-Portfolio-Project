class RecipesController < ApplicationController

   get '/recipes' do
     if logged_in?
       @recipes = current_user.recipes
     erb :'/recipes/recipes.html'
   else
   redirect '/login'
   end
 end

   get '/recipes/new' do
     if !logged_in?
       redirect "/login"
     else
       erb :"recipes/new.html"
     end
   end

   post '/recipes' do
     @recipe = current_user.recipes.build(params)
     # @recipe.title = params[:title]
     # @recipe.content = params[:content]
     # @recipe.cook_time = params[:cook_time]
     if @recipe.save
       redirect '/recipes'
     else
       erb :"/recipes/new.html"
     end
   end

   get '/recipes/:id/edit' do
     if !logged_in?
       redirect "/login"
     else
       if @recipe = current_user.recipes.find_by(params[:id])

       "A edit post form #{current_user.id} is editing #{@recipe.id}"
       erb :"/recipes/edit.html"
    else
      redirect '/recipes'

    end
    end
  end 

   get '/recipes/:id' do
     @recipe = Recipe.find_by_id(params[:id])
    erb :"/recipes/show.html"
  end

  #     redirect_if_not_logged_in
  #       @recipes = Recipe.all
  #       erb :'/recipes.html'
  #   end
  #
  #   get '/recipes/new' do
  #     if logged_in?
  #       erb :'/recipes/new'
  #     else
  #       redirect '/login'
  #     end
  #   end
  #
  #   get '/recipes/:id' do
  #     if logged_in?
  #       @recipe = Recipe.find_by_id(params[:id])
  #       erb :'/recipes/show'
  #     else
  #       redirect '/login'
  #     end
  #   end
  #
  #   post '/recipes' do
  #     if logged_in?
  #       if params[:name] == ""
  #         redirect '/recipes/new'
  #       else
  #         @recipe = current_user.recipes.build(name: params[:name], description: params[:description], cook_time: params[:cook_time])
  #         @recipe.save
  #         redirect "/recipes/#{@recipe.id}"
  #       end
  #     end
  #   end
  #
  #   get '/recipes/:id/edit' do
  #     if logged_in?
  #       @recipe = Recipe.find_by_id(params[:id])
  #       if @recipe.user = current_user
  #       erb :'/recipes/edit'
  #       else
  #         flash[:notice] = "Sorry, but that one doesn't belong to you!"
  #         redirect to '/recipes'
  #       end
  #     else
  #       redirect '/login'
  #     end
  #   end
  #
  #   patch '/recipes/:id' do
  #     if logged_in? && @recipe.user == current_user
  #       if params[:content] == "" || params[:title] == "" || params[:cook_time] == ""
  #         redirect "/recipes/#{params[:id]}/edit"
  #       else
  #         @recipe = Recipe.find_by_id(params[:id])
  #         @recipe.update(title: params[:title], content: params[:content], cook_time: params[:cook_time])
  #         @recipe.save
  #         flash[:notice] = "Your recipe was successfully updated!"
  #         redirect "/recipes/#{@recipe.id}"
  #       end
  #     else
  #       redirect '/login'
  #     end
  #   end
  #
  #     delete '/recipes/:id/delete' do
  #       if logged_in?
  #         @recipe = Recipe.find_by_id(params[:id])
  #         if @recipe && @recipe.user == current_user
  #           @recipe.delete
  #           flash[:notice] = "Your recipe was successfully deleted!"
  #         else
  #           flash[:notice] = "Sorry, but that one doesn't belong to you!"
  #         end
  #         redirect to '/recipes'
  #       else
  #         redirect to '/login'
  #       end
     end
