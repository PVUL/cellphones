class PhonesController < ApplicationController
  def new
    @phone = Phone.new
    @brands = Brand.all
  end

  def create
    @phone = Phone.new(phone_params)
    @brands = Brand.all
    if @phone.save
      flash[:notice] = 'Successfully Added'
      redirect_to phones_path
    else
      flash[:notice] = @phone.errors.full_messages.join('. ')
      render :new
    end
  end

  def index
    @phones = Phone.all
  end

  private

  def phone_params
    params.require(:phone).permit(:brand_id, :year, :battery, :description)
  end

end
