class PointRulesController < ApplicationController
  before_action :set_point_rule, only: [:show, :edit, :update, :destroy]
  before_action :has_access?
  # GET /point_rules
  # GET /point_rules.json
  def index
    @point_rules = PointRule.all
  end

  # GET /point_rules/1
  # GET /point_rules/1.json
  def show
  end

  # GET /point_rules/new
  def new
    @point_rule = PointRule.new
  end

  # GET /point_rules/1/edit
  def edit
  end

  # POST /point_rules
  # POST /point_rules.json
  def create
    @point_rule = PointRule.new(point_rule_params)

    respond_to do |format|
      if @point_rule.save
        format.html { redirect_to @point_rule, notice: 'Point rule was successfully created.' }
        format.json { render :show, status: :created, location: @point_rule }
      else
        format.html { render :new }
        format.json { render json: @point_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /point_rules/1
  # PATCH/PUT /point_rules/1.json
  def update
    respond_to do |format|
      if @point_rule.update(point_rule_params)
        format.html { redirect_to @point_rule, notice: 'Point rule was successfully updated.' }
        format.json { render :show, status: :ok, location: @point_rule }
      else
        format.html { render :edit }
        format.json { render json: @point_rule.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /point_rules/1
  # DELETE /point_rules/1.json
  def destroy
    @point_rule.destroy
    respond_to do |format|
      format.html { redirect_to point_rules_url, notice: 'Point rule was successfully destroyed.' }
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
    def set_point_rule
      @point_rule = PointRule.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def point_rule_params
      params.require(:point_rule).permit(:name, :score)
    end
end
