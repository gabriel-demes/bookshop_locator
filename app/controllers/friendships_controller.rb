class FriendshipsController < ApplicationController

    def index
    end

    def new
        @friendship = Friendship.new(friender_id: current_user.id, friendee_id: session[:friendee_id])
    end

    def create
        @friendship = Friendship.create(friender_id: current_user.id, friendee_id: session[:friendee_id])
        redirect_to myfriends_path(current_user)
    end

    def destroy
        @friendship = Friendship.find(params[:id])
        @friendship.destroy
        redirect_to myfriends_path(current_user)
    end

    private

    def fs_params
        params.require(:freindship).permit(:friendee_id, :friender_id,)
    end


end
