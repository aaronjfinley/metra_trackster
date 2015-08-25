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
      @trains = Train.all.sort_by {|k| k[:arrives_at]}

      @platform_stats = {}
      @trains.each do |train|
        @platform_stats[train.id.to_s] = {}
        arrival_count = train.arrivals.count.to_f

        [1, 2, 3].each do |p|
          @platform_stats[train.id.to_s][p.to_s] = {"count" => train.arrivals.where(:platform => p).count}
          if @platform_stats[train.id.to_s][p.to_s]["count"] > 0
            @platform_stats[train.id.to_s][p.to_s]["pct"] = ((@platform_stats[train.id.to_s][p.to_s]["count"] / arrival_count).round(2)*100).to_i.to_s+"%"
          else
            @platform_stats[train.id.to_s][p.to_s]["pct"] = nil
          end
        end
      end
      render "./trains/index.html.erb"
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
