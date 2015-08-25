class TrainsController < ApplicationController
  def index
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
  end

  def show
    @train = Train.find(params[:id])

    @platform_stats = {}
    arrival_count = @train.arrivals.count.to_f

    [1, 2, 3].each do |p|
      @platform_stats[p.to_s] = {"count" => @train.arrivals.where(:platform => p).count}
      if @platform_stats[p.to_s]["count"] > 0
        @platform_stats[p.to_s]["pct"] = ((@platform_stats[p.to_s]["count"] / arrival_count).round(2)*100).to_i.to_s+"%"
      else
        @platform_stats[p.to_s]["pct"] = nil
      end
    end


  end

  def new
    @train = Train.new
  end

  def create
    @train = Train.new
    @train.arrives_at = params[:arrives_at]
    @train.line = params[:line]

    if @train.save
      redirect_to "/trains", :notice => "Train created successfully."
    else
      render 'new'
    end
  end

  def edit
    @train = Train.find(params[:id])
  end

  def update
    @train = Train.find(params[:id])

    @train.arrives_at = params[:arrives_at]
    @train.line = params[:line]

    if @train.save
      redirect_to "/trains", :notice => "Train updated successfully."
    else
      render 'edit'
    end
  end

  def destroy
    @train = Train.find(params[:id])

    @train.destroy

    redirect_to "/trains", :notice => "Train deleted."
  end
end
