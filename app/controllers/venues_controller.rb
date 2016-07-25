class VenuesController < ApplicationController

  def index
    @venues = Venue.all
  end


  def create
    @venue = Venue.create(permitted_params)
    flash[:message] = @venue.valid? ? "Success" : "Failure"
    redirect_to '/'
  end

  def show
    @venue = Venue.find(params['id'])
  end

  def update
    @venue = Venue.find(params['id'])
    @venue.update_attributes(permitted_params)
    redirect_to "/venues/#{@venue.id}"
    flash[:message] = "Update Successful"
  end

  def destroy
    Venue.find(params['id']).destroy
    redirect_to root
  end

  private

  def permitted_params
    params.require(:venue).permit(:name, :address, :phone_number, :website_url, :neighborhood, :twitter_url, :facebook_url, :instagram_url, :email, :other)
  end

end



















