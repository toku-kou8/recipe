class Public::RecipesController < ApplicationController
  def index
    @recipes = Menu.all
    if params[:tag_name]
      @recipes = Menu.tagged_with("#{params[:tag_name]}")
    end
    @tags = @recipes.tag_counts_on(:tags).most_used(20)
    @user = current_customer
  end

  def show
    @recipe = Menu.find(params[:id])
    @tags = @recipe.tag_counts_on(:tags)
    @user = current_customer
  end

  def new
    @recipe = Menu.new
  end

  def edit
    @recipe = Menu.find(params[:id])
  end

  def update
    @recipe = Menu.update(recipe_params)
  end

  def create
    @recipe = Menu.new(recipe_params)
    @recipe.customer_id = current_customer.id
    if @recipe.save
      redirect_to recipe_path(@recipe)
    else
      render :new
    end
  end

  private

  def recipe_params
    params.require(:menu).permit(:name, :difficulty,:price, :time, :number, :genre_id, :impression, :calorie, :way,:authority,:tag_list)
  end
end
