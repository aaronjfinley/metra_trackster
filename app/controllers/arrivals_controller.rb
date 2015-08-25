class ArrivalsController < ApplicationController
  def index
    @arrivals = Arrival.all
  end

  def show
    @arrival = Arrival.find(params[:id])
  end

  def new
    @arrival = Arrival.new
  end

  def create
    @arrival = Arrival.new
    @arrival.train_id = params[:train_id]
    @arrival.platform = params[:platform]

    if @arrival.save
      redirect_to "/arrivals", :notice => "Arrival created successfully."
    else
      render 'new'
    end
  end

  def create_from_index
    @arrival = Arrival.new
    @arrival.train_id = params[:train_id]
    @arrival.platform = params[:platform]

    if @arrival.save
      redirect_to "/trains", :notice => "Arrival created successfully."
    else
      redirect_to "/trains"
    end

  end

  def edit
    @arrival = Arrival.find(params[:id])
  end

  def update
    @arrival = Arrival.find(params[:id])

    @arrival.train_id = params[:train_id]
    @arrival.platform = params[:platform]

    if @arrival.save
      redirect_to "/arrivals", :notice => "Arrival updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @arrival = Arrival.find(params[:id])

    @arrival.destroy

    redirect_to "/arrivals", :notice => "Arrival deleted."
  end
end
