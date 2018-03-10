class StocksController < ApplicationController
  before_action :set_stock, only: [:show, :edit, :update, :destroy]


  def index
    @stocks = Stock.all
  end


  def show
  end




  private
    def set_stock
      @stock = Stock.find(params[:id])
    end

    def part_number_params
      params.require(:leadtime, :part_number_id).permit(:leadtime, :part_number_id)
    end


end
