class LeadsController < ApplicationController
  def index
    @leads = Lead.order "created_at DESC"
  end
end
