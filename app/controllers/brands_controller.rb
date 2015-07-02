class BrandsController < ApplicationController
  def new
    @brand = Brand.new
  end

  def create
    @brand = Brand.new(brand_params)
    if @brand.save
      flash[:notice] = 'Successfully Added'
      redirect_to root_path
    else
      flash[:notice] = @brand.errors.full_messages.join('. ')
      render :new
    end
  end

  def index
    @brands = Brand.all
  end

  private

  def brand_params
    params.require(:brand).permit(:name, :country)
  end
end
