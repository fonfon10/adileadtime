class PartNumbersController < ApplicationController
  before_action :set_part_number, only: [ :edit, :update, :destroy]

  def index

    @part_numbers = PartNumber.all
    @stocks = Stock.all
  
  end





  def show
    @part_numbers = PartNumber.all.where("part_numbers.id = ?", params[:id])
    @stocks = Stock.all.where("part_number_id = ?", params[:id]).order(created_at: :DESC)
    @stock_average = @stocks.average(:leadtime)
    @stock_max = @stocks.maximum(:leadtime)
    @stock_min = @stocks.minimum(:leadtime)
    @stock_lastchange = @stocks[0].leadtime-@stocks[1].leadtime

  end

  def new
    @part_number = PartNumber.new
  end

  def edit
  end

  def create
    @part_number = PartNumber.new(part_number_params)

    if @part_number.save
      redirect_to @part_number, notice: 'Part number was successfully created.'
    else
      render :new 
    end
  end

  def update
    if @part_number.update(part_number_params)
      redirect_to @part_number, notice: 'Part number was successfully updated.'
    else
      render :edit
    end
  end

  def destroy
    @part_number.destroy
      redirect_to part_numbers_url, notice: 'Part number was successfully destroyed.' 
  end

  private
    def set_part_number
      @part_number = PartNumber.find(params[:id])
    end

    def part_number_params
      params.require(:part_number).permit(:partnumber)
    end
end
