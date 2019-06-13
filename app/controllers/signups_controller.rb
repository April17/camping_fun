class SignupsController < ApplicationController
  before_action :setup_select, only: [:new, :create]

  def new
    @signup = Signup.new
  end

  def create
    @signup = Signup.create(signup_params)
    if @signup.valid?
      redirect_to @signup.camper
    else
      flash[:errors] = @signup.errors.full_messages
      redirect_to new_signup_path
    end
  end
end

def setup_select
  @campers = Camper.all.map {|camper| [camper.name, camper.id]  }
  @activities = Activity.all.map {|activity| [activity.name, activity.id]  }
  @time = Array(0..23)
end

def signup_params
  params.require(:signup).permit(:camper_id, :activity_id, :time)
end
