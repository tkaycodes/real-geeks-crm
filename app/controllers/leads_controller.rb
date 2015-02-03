class LeadsController < ApplicationController
  def index
    @lead_class = Struct.new(:name, :start_date, :last_active_at, :last_search, :agent)
    @leads = []
    20.times { @leads << @lead_class.new("Frank Miller", 3.months.ago, 2.days.ago, "$50,000+ Honolulu, type: Condo", "Jeff Manson") }
  end
end
