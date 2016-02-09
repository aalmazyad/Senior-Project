class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all
    @stores.each do |store|
		   	  if store.user = current_user
           		 @mystore = store
		      end
		  end

  end

  # GET /stores/1
  # GET /stores/1.json
  def show
  end

  # GET /stores/new
  def new
    @store = Store.new
  end

  # GET /stores/1/edit
  def edit
  end

  # POST /stores
  # POST /stores.json
  def create
    @store = Store.new(store_params)
    @store.generate_filename
    @store.user = current_user
    @uploaded_io = params[:store][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @store.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @store.save
      redirect_to @store, notice: 'store was successfully created.'
    else
      render :new
    end

   
  end

  # PATCH/PUT /stores/1
  # PATCH/PUT /stores/1.json
  def update
      @uploaded_io = params[:store][:uploaded_file]

   if @uploaded_io != nil
    File.open(Rails.root.join('public', 'images', @store.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end
  end

   if @store.update(store_params)
      redirect_to @store, notice: 'store was successfully edited.'
    else
      render :edit
    end
  end

  # DELETE /stores/1
  # DELETE /stores/1.json
  def destroy
    @store.destroy
    redirect_to @store , notice: 'store was successfully deleted.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:filename, :name, :foodType, :description, :tags, :user_id)
    end
end
