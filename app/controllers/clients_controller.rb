class ClientsController < ApplicationController
  before_action :set_client, only: [:show, :edit, :confirm_update, :update, :destroy]

  # GET /clients
  # GET /clients.json
  def index
    @client_search_form = ClientSearchForm.new(client_search_form_params)
    @clients = Client.matches(@client_search_form)
  end

  # GET /clients/1
  # GET /clients/1.json
  def show
  end

  # GET /clients/new
  def new
    @client = Client.new
  end

  def confirm_create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.valid?
        format.html { render }
      else
        format.html { render action: 'new' }
      end
    end
  end

  # GET /clients/1/edit
  def edit
  end

  def confirm_update
    @client.attributes = client_params

    respond_to do |format|
      if @client.valid?
        format.html { render }
      else
        format.html { render action: 'edit' }
      end
    end
  end

  # POST /clients
  # POST /clients.json
  def create
    @client = Client.new(client_params)

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: t("message.successfully_created", name: Client.model_name.human) }
        format.json { render action: 'show', status: :created, location: @client }
      else
        format.html { render action: 'new' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /clients/1
  # PATCH/PUT /clients/1.json
  def update
    @client.attributes = client_params

    respond_to do |format|
      if @client.save
        format.html { redirect_to @client, notice: t("message.successfully_updated", name: Client.model_name.human) }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @client.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /clients/1
  # DELETE /clients/1.json
  def destroy
    # NOTE: scaffold でつくられるコントローラでは destroy が使われていますが、
    #       戻り値を使わないのであれば、destroy! を使う方がより適切なので変えています。
    @client.destroy!
    respond_to do |format|
      format.html { redirect_to clients_url }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_client
      @client = Client.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def client_params
      params.require(:client).permit(:name, :abbr, :code, :full_name, :full_name_kana, :zipcode, :pref_name, :address_city, :address_extra, :sales_person_name, :sales_person_email)
    end

    def client_search_form_params
      params.fetch(:client_search_form, {}).permit(:name, :code, :full_name_kana)
    end
end
