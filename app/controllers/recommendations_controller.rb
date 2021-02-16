class RecommendationsController < ApplicationController

    def index
    end

    def new
        @recommendation = Recommendation.new
    end

    def create
        @recommendation = Recommendation.create(rec_params)
        rediect_to recommendations_path()
    end






    private
    def rec_params
        params.require(:recommendation).permit(:friendship_id, :bookshop_id, :message)
    end


end
