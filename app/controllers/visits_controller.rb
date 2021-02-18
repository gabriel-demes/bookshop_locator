class VisitsController < ApplicationController

    def index
        @visits = current_user.visits.paginate(page: params[:page], per_page: 10)
        
    end
    
    def new
        @visit = Visit.new
        @bookshops = current_user.bookshops
    end

    def create
        @visit = current_user.visits.create(user_id: current_user.id, bookshop_id: session[:shop_id])
        redirect_to bookshop_path(session[:shop_id])
    end

    def favorite
        @visit = current_user.visits.find_by(user_id: current_user.id, bookshop_id: session[:shop_id])
        @visit.update(favorite: true)
        redirect_to bookshop_path(session[:shop_id])
    end

    def unfavorite
        @visit = current_user.visits.find_by(user_id: current_user.id, bookshop_id: session[:shop_id])
        @visit.update(favorite: false)
        redirect_to bookshop_path(session[:shop_id])
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
