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

    if params.has_key? "trains_show_page"
      if @arrival.save
        redirect_to "/trains/#{params[:train_id]}", :notice => "Arrival added successfully."
      else
        redirect_to "/trains/#{params[:train_id]}", :alert => "Platform already added for #{@arrival.train.arrives_at.strftime("%l:%M%P")} train on #{Date.today}."
      end
    else
      if @arrival.save
        redirect_to "/arrivals", :notice => "Arrival created successfully."
      else
        render 'new'
      end
    end
  end

  def create_from_index
    @arrival = Arrival.new
    @arrival.train_id = params[:train_id]
    @arrival.platform = params[:platform]

    if @arrival.save
      redirect_to "/trains", :notice => "Arrival added successfully."
    else
      redirect_to "/trains", :alert => "Platform already added for #{@arrival.train.arrives_at.strftime("%l:%M%P")} train on #{Date.today}."

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

    if params.has_key? "train_id"
      redirect_to "/trains/#{params[:train_id]}", :notice => "Arrival deleted."
    else
      redirect_to "/arrivals", :notice => "Arrival deleted."
    end
  end
end
