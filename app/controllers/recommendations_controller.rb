class RecommendationsController < ApplicationController

    def index
        @recommendations = Recommendation.paginate(page: params[:page], per_page: 10)
    end

    def new
        @recommendation = Recommendation.new(bookshop_id: session[:shop_id])
        
    end

    def create
        @recommendation = Recommendation.create(rec_params)
        @recommendation.update(bookshop_id: session[:shop_id])
        redirect_to user_path(current_user)
    end






    private
    def rec_params
        params.require(:recommendation).permit(:friendship_id, :bookshop_id, :message)
    end


end
