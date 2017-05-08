class Admin::ProductsController < ApplicationController
  layout "admin"
  before_action :authenticate_user!
  before_action :admin_required

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)

    if @product.save
      redirect_to admin_products_path
    else
      render :new
    end
  end

  def index
    @products = Product.all
  end

  def show
    @product = Product.find_by_friendly_id!(params[:id])
  end

  def edit
    @product = Product.find_by_friendly_id!(params[:id])
  end

    def update
      @product = Product.find_by_friendly_id!(params[:id])
      if @product.update(product_params)
        redirect_to admin_products_path
      else
        render :edit
      end
    end

    def destroy
    @product = Product.find_by_friendly_id!(params[:id])
    @product.destroy
    flash[:alert] = "Product deleted"
    redirect_to  admin_products_path
  end


  private
    def product_params
      params.require(:product).permit(:title, :friendly_id, :description,:quantity, :price, :image, :category_id, :location_attributes => [:id, :name, :_destroy], :group_ids => [])
    end
end
