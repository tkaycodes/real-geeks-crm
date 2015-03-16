class Api::V1::LeadsController < ApplicationController
  def index
    @leads = Lead.all
    render json: @leads
  end
end
