require 'rails_helper'

RSpec.describe LeadsController, :type => :controller do
  before :all do
    @agent = Agent.create(
      email: Faker::Internet.email,
      password: "bluthbananas",
      name: Faker::Name.name,
      phone: Faker::PhoneNumber.phone_number,
      role: "Agent"
    )
    @admin = Agent.create(
      email: Faker::Internet.email,
      password: "bluthbananas",
      name: Faker::Name.name,
      phone: Faker::PhoneNumber.phone_number,
      role: "Admin"
    )
  end

  describe "GET#index" do
    before :all do
      Lead.destroy_all
      10.times do
        Lead.create(
          name: Faker::Name.name, email: Faker::Internet.email,
          phone: Faker::PhoneNumber.phone_number, start_date: 10.days.ago,
          active_at: (1..10).to_a.sample.hours.ago, agent: [@agent, @admin].sample
        )
      end
    end
    context "when signed in as an admin" do
      before :each do
        sign_in @admin
      end

      it "should retrieve all the leads ordered by most recently active" do
        expect(Lead).to receive(:order).with("created_at DESC")
        get :index
      end
    end
  end

end
