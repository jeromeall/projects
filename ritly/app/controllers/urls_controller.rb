class UrlsController < ApplicationController
  def index
  	@url = Url.new
  end

  def create
  	@url = Url.create(url_params)
  	@url['random_string'] = SecureRandom.urlsafe_base64(10)
  	
  	@url.save
  	redirect_to url_path(@url.id)

  end

  def show
  	
  	@url = Url.find(params[:id])

  end

  private
  def url_params
  	params.require(:url).permit(:link, :random_string)
  end

end
