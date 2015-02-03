class TympanogramsController < ApplicationController
  before_action :set_tympanogram, only: [:show, :edit, :update, :destroy]

  # GET /tympanograms
  def index
    @tympanograms = Tympanogram.all
  end

  # GET /tympanograms/1
  def show
  end

  # GET /tympanograms/new
  def new
    @tympanogram = Tympanogram.new
  end

  # GET /tympanograms/1/edit
  def edit
  end

  # POST /tympanograms
  def create
    @tympanogram = Tympanogram.new(tympanogram_params)

    if @tympanogram.save
      redirect_to @tympanogram, notice: 'Tympanogram was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /tympanograms/1
  def update
    if @tympanogram.update(tympanogram_params)
      redirect_to @tympanogram, notice: 'Tympanogram was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /tympanograms/1
  def destroy
    @tympanogram.destroy
    redirect_to tympanograms_url, notice: 'Tympanogram was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_tympanogram
      @tympanogram = Tympanogram.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def tympanogram_params
      params.require(:tympanogram).permit(:patient_id, :examiner_id, :examdate, :comment, :image_location, :impedancemeter, :hospital, :rt_pvt, :rt_sc, :rt_peak, :rt_interval, :rt_data, :rt_data_length, :lt_pvt, :lt_sc, :lt_peak, :lt_interval, :lt_data, :lt_data_length)
    end
end
