class ReviewsController < ApplicationController
  before_action :authenticate_user!
  
  def new
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:product_id])
    @review = @product.reviews.create(review_params)
    @review.user_id = current_user.id

    if @review.save
      redirect_to store_product_path(@store, @product)
    else
      render :new
    end
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = current_user.products.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:name, :body, :rating)
  end
end
