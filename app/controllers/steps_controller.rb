class StepsController < ApplicationController

  def index
    @steps = Step.all.order(index: :asc)
  end

  def new
    @step = Step.new
  end

  def create
    @step = Step.new(step_params)
    @step.index = Step.all.pluck(:index).max + 1
    if @step.save
      redirect_to steps_path
    else
      render :new, status: :unprocessable_entity
    end
  end

  def reorder
    drag_in = Step.find_by_index(params[:old_index])
    drag_out = Step.find_by_index(params[:new_index])
    drag_in.index = params[:new_index]
    drag_out.index = params[:old_index]
    drag_in.save
    drag_out.save
  end

  private

  def step_params
    params.require(:step).permit(:name, :color, :user_id)
  end


end
