class Public::RecipesController < ApplicationController
  before_action :set_q, only: [:index, :search]

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

  def search
    @results = @q.result
  end

  private

  def set_q
    @q = Menu.ransack(params[:q])
  end

  def recipe_params
    params.require(:menu).permit(:name, :difficulty,:price, :time, :number, :genre_id, :impression, :calorie, :way,:authority)
  end
end
