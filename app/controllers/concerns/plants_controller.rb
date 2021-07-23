class PlantsController < ApplicationController

    # GET /plants
    def index
      plants = Plant.all
      render json: plants
    end
  
    # GET /plants/:id
    def show
      plant = Plant.find_by(id: params[:id])
      render json: plant
    end
  
    # POST /plants
    def create
      plant = Plant.create(plant_params)
      if (plant)
        render json: plant, status: :created
      else
        render json: {error: "Invalid data"}
      end
    end
  
    private
  
    def plant_params
      params.permit(:name, :image, :price)
    end
  end