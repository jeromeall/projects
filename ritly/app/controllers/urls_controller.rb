class UrlsController < ApplicationController
before_filter :signed_in_user, only: [:create, :new, :edit, :update]
  

  def index
    # Create an instance to work with in the view
  	@url = Url.new
  end

  # Create new row in db
  def create
  	@url = Url.new(url_params)

    if @url.random_string != ''
          @url['random_string'] = @url.random_string
        else
          @url['random_string'] = SecureRandom.urlsafe_base64(10)
    end
    if @url.save
        flash[:success] = "Ritly Done!"
        redirect_to @url
    else
        render'index'
    end
  end

  # Show page
  def show
    url_info = params[:id]
    @url = Url.find(url_info)
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

  # Redirect to URL
  def transfer
    url_info = params[:random_string]
    @url = Url.find_by(random_string: url_info)
    
    redirect_to "http://#{@url.link}"
  end

  def preview
    url_info   = params[:random_string]
    @url = Url.find_by(random_string: url_info)

  end

  def show_all
    @urls = Url.all
  end




  private
  def url_params
  	params.require(:url).permit(:link, :random_string)
  end

end
