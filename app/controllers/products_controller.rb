class ProductsController < ApplicationController
  before_action :authenticate_user!

  def index
    @group = current_user.groups.find(params[:group_id])
    @products = @group.products.all.order(created_at: :DESC)
  end

  def new
    @groups = current_user.groups.all
    @product = current_user.products.new
  end

  def create
    @product = current_user.products.new(product_params)
    @product.groups << Group.find(params[:groups]) unless params[:groups].nil?
    if @product.save
      redirect_to root_path
      flash[:alert] = 'Your product was created successfully'
    else
      redirect_back(fallback_location: root_path)
      flash[:alert] = 'Your product was not created'
    end
  end

  private

  def product_params
    params.permit(:name, :amount)
  end
end
