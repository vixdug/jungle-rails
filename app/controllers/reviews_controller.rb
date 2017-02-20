class ReviewsController < ApplicationController

  def create
     @product = Product.find(params["product_id"])
     @review = Review.new(review_params)
     @review.user = current_user
     if !@review.user
       flash[:danger]="Why do trees have so many friends? They branch out, also please log in"
       redirect_to :back
     end

     if @review.user && @review.save
       redirect_to :back
     else
       if
       puts @review.errors.to_a
     end
   end
 end



   def destroy
     @review = Review.find params[:id]
     @review.destroy
     redirect_to :back, notice: 'Review was deleted!'
   end

   private
     def review_params
       params.require(:review).permit(:rating, :description, :product_id)
     end




 end
