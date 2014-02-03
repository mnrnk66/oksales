class SuppliresController < ApplicationController
  before_action :set_supplire, only: [:show, :edit, :confirm_update, :update, :destroy]

  # GET /supplires
  # GET /supplires.json
  def index
    @supplire_search_form = SupplireSearchForm.new(supplire_search_form_params)
    @supplires = Supplire.matches(@supplire_search_form)
  end

  # GET /supplires/1
  # GET /supplires/1.json
  def show
  end

  # GET /supplires/new
  def new
    @supplire = Supplire.new
  end

  def confirm_create
    @supplire = Supplire.new(supplire_params)

    respond_to do |format|
      if @supplire.valid?
        format.html { render }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # GET /supplires/1/edit
  def edit
  end

  def confirm_update
    @supplire.attributes = supplire_params

    respond_to do |format|
      if @supplire.valid?
        format.html { render }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # POST /supplires
  # POST /supplires.json
  def create
    @supplire = Supplire.new(supplire_params)

    respond_to do |format|
      if @supplire.save
        format.html { redirect_to @supplire, notice: t("message.successfully_created", name: Supplire.model_name.human) }
        format.json { render action: 'show', status: :created, location: @supplire }
      else
        format.html { render action: 'new' }
        format.json { render json: @supplire.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /supplires/1
  # PATCH/PUT /supplires/1.json
  def update
    @supplire.attributes = supplire_params

    respond_to do |format|
      if @supplire.save
        format.html { redirect_to @supplire, notice: t("message.successfully_updated", name: Supplire.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @supplire.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /supplires/1
  # DELETE /supplires/1.json
  def destroy
    # NOTE: scaffold でつくられるコントローラでは destroy が使われていますが、
    #       戻り値を使わないのであれば、destroy! を使う方がより適切なので変えています。
    @supplire.destroy!
    respond_to do |format|
      format.html { redirect_to supplires_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_supplire
      @supplire = Supplire.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def supplire_params
      params.require(:supplire).permit(:code, :name, :short_name, :kana, :supplire_group_id, :price, :cost_price, :tax_type, :tax_class_id, :district, :supplire_id, :unit_id, :qty_per_box, :price_type, :item_of_matrixlist, :valid_from, :valid_until, :create_user_id, :update_user_id)
    end

    def supplire_search_form_params
      params.fetch(:supplire_search_form, {}).permit(:code, :name, :kana)
    end
end
