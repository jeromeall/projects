class UrlsController < ApplicationController
  def index
  	@url = Url.new
  end


  # Create new row in db
  def create
  	@url = Url.create(url_params)
    if @url.random_string != ''
          @url['random_string'] = @url.random_string
        else
          @url['random_string'] = SecureRandom.urlsafe_base64(10)
    end
  	@url.save
  	redirect_to url_path(@url.id)
  end


  # Redirect to URL
  def transfer
    random_string = params[:random_string]
    url = Url.find_by_random_string(random_string)
    
    redirect_to "http://#{url.link}"
  end

  def preview
    random_string = params[:random_string]
    @url = Url.find_by_random_string(random_string)

  end

  def show_all
    @urls = Url.all
    
  end


  # Show page
  def show
  	@url = Url.find_by(params[:id])
  end

  def edit
    @url = Url.find(params[:id])
  end

  def update
     @url = Url.find(params[:id])
    if @url.update(url_params)
      redirect_to @url
    else
      render 'edit'
    end
  end

  def destroy
    id = params[:id]
    Url.find(id).delete

    redirect_to "/urls"
  end


  private
  def url_params
  	params.require(:url).permit(:link, :random_string)
  end

end
