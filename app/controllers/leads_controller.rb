class LeadsController < ApplicationController
  before_filter :get_lead, only: [:show, :update]
  def index
    if current_agent.admin?
      @leads = Lead.order "created_at DESC"
    else
      @leads = current_agent.leads.order "created_at DESC"
    end
  end

  def show
    respond_to do |format|
      format.html { render }
      format.json { render json: @lead.to_json }
    end
  end

  def update
    if @lead.update_attributes(lead_params)
      respond_to do |format|
        format.html {redirect_to lead_path(@lead), notice: "Successfully updated Lead"}
        format.js
      end
    else
      flash[:error] = "Could not save lead: #{@lead.errors.full_messages.join(', ')}"
      render "show"
    end
     # @agents=Agent.find(:all)
  end

  def new
    @newlead=Lead.new
  end

  #this create leads method is probably not necessary, since i am 
  #assuming leads are only obtained from the api, and not 
  #also made manually, but i have it here anyways, mostly
  #for testing purposes

  def create
    @newlead=Lead.new(lead_params)
    if @newlead.save
      redirect_to leads_path, notice: "Lead Created"
    else
    redirect_to leads_path, notice: "Something went wrong"
    end
  end

  private

  def lead_params
    params[:lead].permit(:name, :email, :phone, :address, :agent_id, :activity_log, :start_date)
  end

  def get_lead
    @lead = Lead.find(params[:id])
  end

 

end
