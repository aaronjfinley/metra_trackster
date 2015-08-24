class TrainsController < ApplicationController
  def index
    @trains = Train.all.sort_by {|k| k[:arrives_at]}
  end

  def show
    @train = Train.find(params[:id])
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
