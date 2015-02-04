require 'rails_helper'

RSpec.describe Lead, :type => :model do
  describe "associations" do
    it { should belong_to :agent }
  end

  describe "validations" do
    it { should validate_presence_of :name }
    it { should validate_presence_of :email }
    it { should validate_presence_of :phone }
    it { should validate_presence_of :start_date }
  end
end
