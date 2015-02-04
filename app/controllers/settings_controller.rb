class SettingsController < ApplicationController
  SUCCESS_MSG = "Your agent settings were updated"
  ERROR_MSG = "Oops! Could not save your settings, correct problems below..."
  before_filter :set_agent

  def show
  end

  def update
    if @agent.update_attributes(agent_params)
      redirect_to settings_path, notice: SUCCESS_MSG
    else
      flash[:error] = ERROR_MSG
      render :show
    end
  end

  private

  def agent_params
    params[:agent].permit(:email, :name, :phone)
  end

  def set_agent
    @agent = current_agent
  end
end
