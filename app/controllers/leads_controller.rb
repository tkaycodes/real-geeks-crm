class LeadsController < ApplicationController
  def index
    if  current_agent.role == "Admin"
      @leads = Lead.order "created_at DESC"
    else
      @leads = current_agent.leads.order "created_at DESC"
    end
  end

  def show
    @lead = Lead.find(params[:id])
  end
end
