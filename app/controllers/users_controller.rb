class UsersController < ApplicationController
    skip_before_action :authorized, only: [:login, :handle_login, :new, :create, :home]
    def login 
    end

    def handle_login
        @user = User.find_by(username: params[:username])
        if @user && @user.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:errors] = ["Incorrect Username or Password"]
            redirect_to login_path
        end
    end

    def logout
        logout_user
        redirect_to users_path
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
        session[:friendee_id]= @user.id
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(user_params)
        session[:user_id] = @user.id
        redirect_to user_path(@user.id)

        # if @student.valid?
        #     session[:user_id] = @user.id
        #     redirect_to user_path(@user)
        # else
        #     flash[:error] = @user.errors.full_messages
        #     redirect_to new_user_path
        # end
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user)
        else
            flash[:errors] = @user.errors.full_messages
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    def myfriends
    end

    def incomingrecs
    end

    def search
        
        if params[:search_display] != ""
            redirect_to search_display_path(current_user,params[:search_display])
        else
            redirect_to users_path
        end
    end

    def search_display
        @term = params[:search_display]
    end

    def home
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :username, :password, :seach_display)
    end
end
