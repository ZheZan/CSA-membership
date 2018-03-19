class AdminsController < ApplicationController
  before_action :set_admin, only: [:show, :edit, :update, :destroy]
  before_action :has_access?
  # GET /admins
  # GET /admins.json
  def index
    @admins = Admin.all
  end

  # GET /admins/1
  # GET /admins/1.json
  def show
    @admin = Admin.find(params[:id])
  end

  # GET /admins/new
  def new
    @admin = Admin.new
  end

  # GET /admins/1/edit
  def edit
  end

  # POST /admins
  # POST /admins.json
  def create
    @admin = Admin.new(admin_params)

    respond_to do |format|
      if @admin.save
        log_in @admin
        flash[:success] = "Successfully created！"
        format.html { redirect_to @admin }
        format.json { render :show, status: :created, location: @admin }
      else
        format.html { render :new }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /admins/1
  # PATCH/PUT /admins/1.json
  def update
    respond_to do |format|
      if @admin.update(admin_params)
        flash[:success] = "Successfully update!"
        format.html { redirect_to @admin}
        format.json { render :show, status: :ok, location: @admin }
      else
        format.html { render :edit }
        format.json { render json: @admin.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /admins/1
  # DELETE /admins/1.json
  def destroy
    @admin.destroy
    flash[:success] = "Successfully destroy！"
    respond_to do |format|
      format.html { redirect_to admins_url }
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
    def set_admin
      @admin = Admin.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def admin_params
      params.require(:admin).permit(:name, :uin, :tel, :email, :password, :password_confirmation)
    end
end
