class ScientistsController < ApplicationController
    before_action :find_scientist, only: [:show, :edit, :update, :destroy]
    
    def index
        @scientists = Scientist.all
    end

    def show 
    end

    def new
        @scientist = Scientist.new
    end

    def create 
        @scientist = Scientist.create(scientist_params)
        if @scientist.valid?
            redirect_to @scientist
        else
            flash[:errors] = @scientist.errors.full_messages
            redirect_to new_scientist_path(@scientist)
        end
    end

    def edit 
    end

    def update
        if @scientist.valid?
            @scientist.update
            redirect_to @scientist
        else
            flash[:errors] = @scientist.errors.full_messages
            redirect_to edit_scientist_path(@scientist)
        end
    end

    def destroy
        @scientist.destroy
        redirect_to scientists_path
    end

    private

    def scientist_params
        params.require(:scientist).permit(:name, :field_of_study)
    end

    def find_scientist
        @scientist = Scientist.find(params[:id])
    end
end
