class ClientsController < ApplicationController

  def index
    if params[:query].present?
      @clients = Client.where("name ILIKE ?", "%#{params[:query]}%")
    else
      @clients = Client.all
    end
  end

  def new
    @client = Client.new
  end

  def edit;end

  def show
    @client = Client.find(params[:id])
  end

  def update
    @client.update(client_params)
    redirect_to clients_path(@client)
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      redirect_to clients_path(@client)
    else
      render :new, status: :unprocessable_entity
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path, status: :see_other
  end
end

private

def client_params
  params.require(:client).permit(:name,:photo)
end

def set_client
  @client = Client.find(params[:id])
end
