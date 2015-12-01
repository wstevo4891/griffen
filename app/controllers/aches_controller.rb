class AchesController < ApplicationController
  before_action :set_ach, only: [:show, :edit, :update, :destroy]

  # GET /aches
  # GET /aches.json
  def index
    @aches = Ach.all
  end

  # GET /aches/1
  # GET /aches/1.json
  def show
  end

  # GET /aches/new
  def new
    @ach = Ach.new
  end

  # GET /aches/1/edit
  def edit
  end

  # POST /aches
  # POST /aches.json
  def create
    @ach = Ach.new(ach_params)

    respond_to do |format|
      if @ach.save
        format.html { redirect_to @ach, notice: 'Ach was successfully created.' }
        format.json { render :show, status: :created, location: @ach }
      else
        format.html { render :new }
        format.json { render json: @ach.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /aches/1
  # PATCH/PUT /aches/1.json
  def update
    respond_to do |format|
      if @ach.update(ach_params)
        format.html { redirect_to @ach, notice: 'Ach was successfully updated.' }
        format.json { render :show, status: :ok, location: @ach }
      else
        format.html { render :edit }
        format.json { render json: @ach.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /aches/1
  # DELETE /aches/1.json
  def destroy
    @ach.destroy
    respond_to do |format|
      format.html { redirect_to aches_url, notice: 'Ach was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ach
      @ach = Ach.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def ach_params
      params[:ach]
    end
end
