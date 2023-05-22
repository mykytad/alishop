class ReviewsController < ApplicationController
  def create
    @product = Product.find(params[:product_id])
    @review = @product.review.create(review_params)
    @review = current_user.id
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
