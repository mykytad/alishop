class ReviewsController < ApplicationController
  def new
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:product_id])
    @review = @product.reviews.new
  end

  def create
    @store = Store.find(params[:store_id])
    @product = Product.find(params[:product_id])
    @review = @product.review.create(review_params)
    @review.user_id = current_user.id
    @review.save
    redirect_to product_path(@product)
  end

  def destroy
    @product = Product.find(params[:product_id])
    @review = current_user.products.find(params[:id])
    @review.destroy
    redirect_to product_path(@product)
  end

  private

  def review_params
    params.require(:review).permit(:name, :body)
  end
end
