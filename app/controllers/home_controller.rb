class HomeController < ApplicationController

  def index
    session[:image] = nil
  end

  def create
    pf = PhotoFetcher.new

    @image = pf.get_image
    sender = params[:users_name]
    recipient = parse_phone_number(params[:phone_number])

    if SphynxSender.send(@image, sender, recipient)
      session[:image] = @image
      redirect_to :sent
    else
      flash[:error] = "There was an issue sending your message. Please check the phone number."
      render index
    end
  end

  def sent
    @image = session[:image]
  end

  private

  def parse_phone_number(number)
    "+1" + number
  end
end
