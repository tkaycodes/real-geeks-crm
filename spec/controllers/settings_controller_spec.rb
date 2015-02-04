require 'rails_helper'

RSpec.describe SettingsController, :type => :controller do
  let(:agent) {Agent.create(
    email: Faker::Internet.email,
    password: "bluthbananas",
    name: Faker::Name.name,
    phone: Faker::PhoneNumber.phone_number,
    role: "Agent"
  )}

  before :each do
    sign_in agent
  end

  describe "GET#show" do
    it "should not be broken" do
      get :show
      response.should be_successful
    end

    it "set @agent to the agent who is signed in" do
      get :show
      assigns(:agent).should eq(agent)
    end
  end

  describe "PATCH#update" do
    before :each do
      @agent_params = agent.attributes.except("id", "role")
    end

    it "set @agent to the agent who is signed in" do
      get :show
      assigns(:agent).should eq(agent)
    end

    context "when the parameters are valid" do
      it "should update the agent's attributes" do
        old_name = @agent_params["name"].clone
        @agent_params["name"] += " has been changed"
        patch :update, agent: @agent_params
        agent.reload
        agent.name.should eq(old_name + " has been changed")
      end

      it "should redirect back to the settings_path" do
        patch :update, agent: @agent_params
        response.should redirect_to settings_path
        flash[:notice].should eq(SettingsController::SUCCESS_MSG)
      end
    end

    context "when the parameters are not valid" do
      before :each do
        @agent_params["email"] = ""
      end
      it "should not update the agent" do
        patch :update, agent: @agent_params
        agent.reload
        agent.email.should_not be_blank
      end

      it "should not redirect but render the template again" do
        patch :update, agent: @agent_params
        response.should render_template :show
        flash[:error].should eq(SettingsController::ERROR_MSG)
      end
    end
  end
end
