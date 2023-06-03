class ClientsController < ApplicationController

  def index
    if params[:query].present?
      @clients = Client.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @clients = Client.all
    end
  end
end
