class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :confirm_update, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @product_search_form = ProductSearchForm.new(product_search_form_params)
    @products = Product.matches(@product_search_form)
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  def confirm_create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.valid?
        format.html { render }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # GET /products/1/edit
  def edit
  end

  def confirm_update
    @product.attributes = product_params

    respond_to do |format|
      if @product.valid?
        format.html { render }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # POST /products
  # POST /products.json
  def create
    @product = Product.new(product_params)

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: t("message.successfully_created", name: Product.model_name.human) }
        format.json { render action: 'show', status: :created, location: @product }
      else
        format.html { render action: 'new' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
    @product.attributes = product_params

    respond_to do |format|
      if @product.save
        format.html { redirect_to @product, notice: t("message.successfully_updated", name: Product.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @product.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
    # NOTE: scaffold でつくられるコントローラでは destroy が使われていますが、
    #       戻り値を使わないのであれば、destroy! を使う方がより適切なので変えています。
    @product.destroy!
    respond_to do |format|
      format.html { redirect_to products_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:code, :name, :short_name, :kana, :product_group_id, :price, :cost_price, :tax_type, :tax_class_id, :district, :supplire_id, :unit_id, :qty_per_box, :price_type, :item_of_matrixlist, :valid_from, :valid_until, :create_user_id, :update_user_id)
    end

    def product_search_form_params
      params.fetch(:product_search_form, {}).permit(:code, :name, :kana)
    end
end
