class Public::RecipesController < ApplicationController
  def index
    @recipes = Menu.all
    if params[:search]
      @recipes.where!(profession: params[:search])
    end
    @user = current_customer
  end

  def show
    @recipe = Menu.find(params[:id])
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
    params.require(:menu).permit(:name, :difficulty,:price, :time, :number, :genre_id, :impression, :calorie, :way,:authority)
  end
end
