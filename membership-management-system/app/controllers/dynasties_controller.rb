class DynastiesController < ApplicationController
  before_action :set_dynasty, only: [:show, :edit, :update, :destroy]
  before_action :has_access?

  # GET /dynasties
  # GET /dynasties.json
  def index
    @dynasties = Dynasty.all
  end

  # GET /dynasties/1
  # GET /dynasties/1.json
  def show
  end

  # GET /dynasties/new
  def new
    @dynasty = Dynasty.new
  end

  # GET /dynasties/1/edit
  def edit
  end

  # POST /dynasties
  # POST /dynasties.json
  def create
    @dynasty = Dynasty.new(dynasty_params)

    respond_to do |format|
      if @dynasty.save
        format.html { redirect_to @dynasty, notice: 'Dynasty was successfully created.' }
        format.json { render :show, status: :created, location: @dynasty }
      else
        format.html { render :new }
        format.json { render json: @dynasty.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /dynasties/1
  # PATCH/PUT /dynasties/1.json
  def update
    respond_to do |format|
      if @dynasty.update(dynasty_params)
        format.html { redirect_to @dynasty, notice: 'Dynasty was successfully updated.' }
        format.json { render :show, status: :ok, location: @dynasty }
      else
        format.html { render :edit }
        format.json { render json: @dynasty.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /dynasties/1
  # DELETE /dynasties/1.json
  def destroy
    @dynasty.destroy
    respond_to do |format|
      format.html { redirect_to dynasties_url, notice: 'Dynasty was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def has_access?
      if (session[:admin_id] == nil)
      flash[:notice] ="You shoud have admin access to view this information"
      redirect_to root_url
      return
      end
    end
    # Use callbacks to share common setup or constraints between actions.
    def set_dynasty
      @dynasty = Dynasty.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def dynasty_params
      params.require(:dynasty).permit(:name)
    end
end
