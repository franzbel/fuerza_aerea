class HelicoptersController < ApplicationController
  def index
    @helicopters = Helicopter.all
  end

  def new
    # render(:text => 'ok')
    @helicopter = Helicopter.new
  end

  def create
    # render(:text => 'ok')
    # render(:text => params)
    @helicopter = Helicopter.new(helicopter_params)
    @helicopter.save
    redirect_to @helicopter
  end

  def show
    # render(:text => params)
    @helicopter = Helicopter.find(params[:id])
  end

  def edit
    # render(:text => params)
    @helicopter = Helicopter.find(params[:id])
  end

  def update
    # render(:text => params)
    @helicopter = Helicopter.find(params[:id])
    @helicopter.update(helicopter_params)
    redirect_to @helicopter
  end

  def destroy
    @helicopter = Helicopter.find(params[:id])
    @helicopter.destroy
    redirect_to helicopters_path
  end

  private
  def helicopter_params
    params.require(:helicopter).permit(:plate_number)
  end

end
