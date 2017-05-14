class RestaurantsController < ApplicationController
  def index
    if(params[:category_id])
      @restaurants = Restaurant.includes(:categories).where(categories: {id: params['category_id']} )
      @category = Category.find(params[:category_id])
    else
      @restaurants = Restaurant.all.order(id: :desc)
    end
  end

  def new
    @restaurant = Restaurant.new
    @category_collection = Category.all
  end

  def create
    @restaurant = Restaurant.new(restaurant_params)
    @category_collection = Category.all
    if params[:restaurant][:category_ids]
      @restaurant.categories = Category.where(id: params[:restaurant][:category_ids])
    end
    if @restaurant.save
      flash[:success] = "Restaurant added successfully."
      redirect_to restaurant_path(@restaurant)
    else
      flash[:alert] = @restaurant.errors.full_messages.to_sentence
      render :new
    end
  end

  def show
    @restaurant = Restaurant.find(params[:id])
  end

  private

  def restaurant_params
    params.require(:restaurant).permit(:name, :address, :city, :state, :zip, :description)
  end
end
