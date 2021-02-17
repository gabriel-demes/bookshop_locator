class VisitsController < ApplicationController

    def index
        @visits = @current_user.visits
    end
    
    def new
        @visit = Visit.new
        @bookshops = @current_user.bookshops
    end

    def create
        @visit = @current_user.visits.create(visit_params)
        redirect_to grades_path(@visit.user_id)
    end

    # def destroy
    #     @visit = @current_user.visits.find(params[:id])
    #     @visit.destroy
    #     redirect_to user_path(@visit.user_id)
    # end

    private

    def visit_params
        params.require(:visit).permit(:favorite)
    end

end
