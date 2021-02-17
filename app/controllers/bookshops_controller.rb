class BookshopsController < ApplicationController

    def index
        @bookshops = Bookshop.all
    end

    def show
        @bookshop = Bookshop.find(params[:id])
    end

    def new
        @bookshop = Bookshop.new
    end

    def create
        @bookshop = Bookshop.create(params[:bookshop])
    end

    def edit
        @bookshop = Bookshop.find(params[:id])
    end

    def update
        @bookshop = Bookshop.find(params[:id])
        if @bookshop.update(bookshop_params)
            redirect_to bookshop_path(@path)
        else
            redirect_to edit_bookshop_path(@bookshop)
        end
    end

    def destroy
        @bookshop = Bookshop.find(params[:id])
        @bookshop.destroy
        redirect_to bookshops_path
    end

    private

    def bookshop_params
        params.require(:bookshop).permit(:name, :address, :zipcode, :phone_number)
    end
end
