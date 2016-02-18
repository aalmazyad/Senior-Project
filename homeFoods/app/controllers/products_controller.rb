class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @products = Product.all
  end

  # GET /products/1
  # GET /products/1.json
  def show
  end

  # GET /products/new
  def new
    @product = Product.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @stores = Store.all
    @stores.each do |i|
      if i.user == current_user
          @store = i 
      end
    end 
    @product = Product.new(product_params)
    @product.generate_filename
    @product.store = @store
      @uploaded_io = params[:product][:uploaded_file]

    File.open(Rails.root.join('public', 'images', @product.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end

    if @product.save
      redirect_to @product, notice: 'product was successfully created.'
    else
      render :new
    end

   
  end

  # PATCH/PUT /products/1
  # PATCH/PUT /products/1.json
  def update
     @uploaded_io = params[:product][:uploaded_file]

   if @uploaded_io != nil
    File.open(Rails.root.join('public', 'images', @product.filename), 'wb') do |file|
        file.write(@producted_io.read)
    end
  end

   if @product.update(product_params)
      redirect_to @product, notice: 'product was successfully edited.'
    else
      render :edit
    end
  end

  # DELETE /products/1
  # DELETE /products/1.json
  def destroy
     @product.destroy
     redirect_to products_url, notice: 'product was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_product
      @product = Product.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def product_params
      params.require(:product).permit(:filename, :name, :description, :quantity, :price, :store_id)
    end
end