class Api::V1::LeadsController < ApplicationController
  def index
    @leads = Lead.all
    render json: @leads
  end

  def show
    @lead = Lead.find params[:id]
    render json: @lead
  end

  def create
    # render json: {}
    # @lead=Lead.new(params: lead_params)

   @lead = Lead.new(lead_params)
    respond_to do |format|
        if @lead.save
          format.json{render json: @lead, status: :created }
        else
          format.json{render json: @lead.errors, status: :unprocessable_entity }
        end
    end

  end

  private

  def lead_params
    params[:lead].permit(:name, :email, :phone, :address, :agent_id, :activity_log, :start_date)
  end

end

