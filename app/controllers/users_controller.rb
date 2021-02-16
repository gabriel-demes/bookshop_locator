class UsersController < ApplicationController

    def login 
    end

    def handle_login
        @user = User.find(username: params[:username])
        if @user && @student.authenticate(params[:password])
            session[:user_id] = @user.id
            redirect_to user_path(@user)
        else
            flash[:error] = [Incorrect Username or Password]
            redirect_to login_path
        end
    end

    def logout
        logout_student
        redirect_to users_path
    end

    def index
        @users = User.all
    end

    def show
        @user = User.find(params[:id])
    end

    def new
        @user = User.new
    end

    def create
        @user = User.create(params[:user])
    end

    def edit
        @user = User.find(params[:id])
    end

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@path)
        else
            redirect_to edit_user_path(@user)
        end
    end

    def destroy
        @user = User.find(params[:id])
        @user.destroy
        redirect_to users_path
    end

    private

    def user_params
        params.require(:user).permit(:name, :age, :username)
    end
end
