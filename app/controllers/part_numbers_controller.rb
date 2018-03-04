class PartNumbersController < ApplicationController
  before_action :set_part_number, only: [:show, :edit, :update, :destroy]

  # GET /part_numbers
  # GET /part_numbers.json
  def index
    @part_numbers = PartNumber.all
  end

  # GET /part_numbers/1
  # GET /part_numbers/1.json
  def show
  end

  # GET /part_numbers/new
  def new
    @part_number = PartNumber.new
  end

  # GET /part_numbers/1/edit
  def edit
  end

  # POST /part_numbers
  # POST /part_numbers.json
  def create
    @part_number = PartNumber.new(part_number_params)

    respond_to do |format|
      if @part_number.save
        format.html { redirect_to @part_number, notice: 'Part number was successfully created.' }
        format.json { render :show, status: :created, location: @part_number }
      else
        format.html { render :new }
        format.json { render json: @part_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /part_numbers/1
  # PATCH/PUT /part_numbers/1.json
  def update
    respond_to do |format|
      if @part_number.update(part_number_params)
        format.html { redirect_to @part_number, notice: 'Part number was successfully updated.' }
        format.json { render :show, status: :ok, location: @part_number }
      else
        format.html { render :edit }
        format.json { render json: @part_number.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /part_numbers/1
  # DELETE /part_numbers/1.json
  def destroy
    @part_number.destroy
    respond_to do |format|
      format.html { redirect_to part_numbers_url, notice: 'Part number was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_part_number
      @part_number = PartNumber.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def part_number_params
      params.require(:part_number).permit(:partnumber)
    end
end
