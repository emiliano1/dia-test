class ShortenedUrlsController < ApplicationController
  def new
    @short_url = ShortenedUrl.new
  end

  def create
    @short_url = ShortenedUrl.find_by(url: short_url_params[:url])
    if @short_url
      flash[:success] = "Your shortened URL is: #{shortened_url_url(@short_url)}"
      redirect_to :root
    else
      @short_url = ShortenedUrl.new(short_url_params)
      if @short_url.save
        flash[:success] = "Your shortened URL is: #{shortened_url_url(@short_url)}"
        redirect_to :root
      else
        render :new
      end
    end
  end

  def redirect_token
    @short_url = ShortenedUrl.find_by_token(params[:token])
    return redirect_to :root unless @short_url
    redirect_to @short_url.url
  end

  private

  def short_url_params
    params.require(:shortened_url).permit(:url)
  end
end
