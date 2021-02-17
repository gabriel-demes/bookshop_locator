class VisitsController < ApplicationController

    def new
        @visit = Visit.new
    end

    def create
        @visit = Visit.create(params[:visit])
    end

end
