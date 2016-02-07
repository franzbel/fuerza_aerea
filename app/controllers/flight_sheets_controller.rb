class FlightSheetsController < ApplicationController
  def index
    @flight_sheets = FlightSheet.all
  end

  def new
    # render(:text => params
    @flight_sheet = FlightSheet.new
  end

  def create
    # render(:text => params)
    @flight_sheet = FlightSheet.new(flight_sheet_params)
    @flight_sheet.helicopter = Helicopter.find(params[:flight_sheet][:helicopter_id])
    @flight_sheet.save
    redirect_to @flight_sheet
  end

  def show
    # render(:text => params)
    @flight_sheet = FlightSheet.find(params[:id])
  end

  def edit
    # render(:text => params)
    @flight_sheet = FlightSheet.find(params[:id])
  end

  def destroy
    @flight_sheet = FlightSheet.find(params[:id])
    @flight_sheet.destroy
    redirect_to flight_sheets_path
  end

  def update
    @flight_sheet = FlightSheet.find(params[:id])
    @flight_sheet.update(flight_sheet_params)
    redirect_to @flight_sheet
  end

  private
  def flight_sheet_params
    params.require(:flight_sheet).permit(:departure_time, :arrival_time, :helicopter_id)
  end
end
