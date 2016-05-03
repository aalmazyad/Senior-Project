require 'rubygems'
require 'mini_magick'
class StoresController < ApplicationController
  before_action :set_store, only: [:show, :edit, :update, :destroy]

  # GET /stores
  # GET /stores.json
  def index
    @stores = Store.all

    @stores.each do |store|
		   	  if store.user_id == current_user.id
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
    @store.products.new
    @foodType = Array.new
    @days = Array.new
    @hours = Array.new
    @zones = Array.new
    @contactMethod = Array.new
    @foodType = ["American"," Aisan","Middle Eastern","Indian","Italian"]
    @contactMethod = ["Telegram","Whatsapp","Kik","Cellular"]
    @days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
    @hours = 1..12
    @minutes = 0..59
    @zones = ["am","pm"]
  end

  # GET /stores/1/edit
  def edit
  	@foodType = Array.new
    @hours = Array.new
    @minutes = Array.new
    @zones = Array.new
    @contactMethod = Array.new
    @days = Array.new
    @foodType = ["American"," Aisan","Middle Eastern","Indian","Italian"]
    @contactMethod = ["Telegram","Whatsapp","Kik","Cellular"]
    @hours = 1..12
    @minutes = 0..59
    @zones = ["am","pm"]
    @days = ["Monday","Tuesday","Wednesday","Thursday","Friday","Saturday","Sunday"]
  end

   def create
    @store = Store.new(store_params)
    @store.generate_filename
    @store.user = current_user
    @uploaded_io = params[:store][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @store.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @store.save
      redirect_to stores_path, notice: 'store was successfully created.'
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
     redirect_to stores_url, notice: 'store was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_store
      @store = Store.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def store_params
      params.require(:store).permit(:filename, :name, :contactMethod, :contactId, :foodType, :description, :fromDay, :toDay, :fromHour, :fromMinute, :toMinute, :fromZone, :toHour, :toZone, :tags, :address, :city, :state, :zipcode, :showAddress, :country,:user_id,products_attributes: [:filename,:name,:description,:quantity,:price])
    end
end
