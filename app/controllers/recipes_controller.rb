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
      patch '/recipes/:id' do
     if logged_in?
       @recipe = Recipe.find_by_id(params[:id])
       if @recipe && @recipe.user == current_user
       if params[:title] == "" || params[:content] == "" || params[:cook_time] == ""
          redirect "/recipes/#{params[:id]}/edit"
        else
         @recipe.update(title: params[:title], content: params[:content], cook_time: params[:cook_time])
         @recipe.save
           redirect "/recipes/#{@recipe.id}"
         end
       end
          else
            redirect '/login'
      end
    end





       delete '/recipes/:id/delete' do
         if logged_in?
           @recipe = Recipe.find_by_id(params[:id])
           if @recipe && @recipe.user == current_user
             @recipe.delete
           end
              redirect '/recipes'
           else
           redirect '/login'
         end
     end
 end
