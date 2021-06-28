class BirdsController < ApplicationController
  def index
    birds = Bird.all
    render json: birds, except: [:created_at, :updated_at]

  end

  def show
    bird = Bird.find_by(id: params[:id])
    if bird
      render json: bird.slice(:id, :name, :species) #slice only works for a single hash so we cant use it for index of birds, rather we use except or only for index of birds
    else
      render json: { message: 'Bird not found' }   
    end
  end
  
end 