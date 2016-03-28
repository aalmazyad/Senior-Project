require 'rubygems'
require 'mini_magick'
class ProductsController < ApplicationController
  before_action :set_product, only: [:show, :edit, :update, :destroy]

  # GET /products
  # GET /products.json
  def index
    @store = Store.find(params[:store_id])
    @products = @store.products
  end

  # GET /products/1
  # GET /products/1.json
  def show
  @users = User.all
  @product = Product.find(params[:id])
  @comments = @product.comment_threads.order('created_at desc')
  @new_comment = Comment.build_from(@product, current_user.id, "") 
  end

  # GET /products/new
  def new
    @store = Store.find(params[:store_id])
    @product = @store.products.new
  end

  # GET /products/1/edit
  def edit
  end

  # POST /products
  # POST /products.json
  def create
    @store = Store.find(params[:store_id])
    @product = @store.products.new(product_params)
    @product.generate_filename
    @uploaded_io = params[:product][:uploaded_file]
   
    
    File.open(Rails.root.join('public', 'images', @product.filename), 'wb') do |file|
        file.write(@uploaded_io.read)
    end
    if @product.save      
      redirect_to stores_path, notice: 'product was successfully created.'
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
     redirect_to stores_path, notice: 'product was successfully destroyed.'
  end

  def add_new_comment
      comment = params[:comment]
      @obj = Product.find(params[:id])
      # Not implemented: check to see whether the user has permission to create a comment on this object
      @comment = Comment.build_from(@obj, current_user.id,comment)
      if @comment.save
        render :partial => "comments/comment", :locals => { :comment => @comment }, :layout => false, :status => :created
      else
        render :js => "alert('error saving comment');"
      end
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
