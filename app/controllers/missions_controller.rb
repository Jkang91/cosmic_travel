class MissionsController < ApplicationController
    def new
        @mission = Mission.new
        @planets = Planet.all
        @scientists = Scientist.all
    end

    def create
        @mission = Mission.create(mission_params)
        if @mission.valid?
            redirect_to scientist_path(@mission.scientist)
        else
            flash[:errors] = @mission.errors.full_messages
            redirect_to new_mission_path
        end
    end

    private
    
    def mission_params
        params.require(:mission).permit(:name, :scientist_id, :planet_id)
    end
end
