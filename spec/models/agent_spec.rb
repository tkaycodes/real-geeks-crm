require 'rails_helper'

RSpec.describe Agent, :type => :model do
  describe "validations" do
    it { should validate_inclusion_of(:role).in_array(Agent::ROLES) }
  end
end
