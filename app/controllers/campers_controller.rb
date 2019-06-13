class CampersController < ApplicationController
  before_action :find_camper, only: [:show]

  def index
    @campers = Camper.all
  end

  def new
    @camper = Camper.new
  end

  def create
    @camper = Camper.create(camper_params)
    if @camper.valid?
      redirect_to @camper
    else
      flash[:errors] = @camper.errors.full_messages
      redirect_to new_camper_path
    end
  end
end




def find_camper
  @camper = Camper.find_by(id: params[:id])
end

def camper_params
  params.require(:camper).permit(:name, :age)
end
