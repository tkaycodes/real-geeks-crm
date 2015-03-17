class Lead < ActiveRecord::Base
  belongs_to :agent
  validates_presence_of :name, :email, :phone, :start_date

  @@next_agent = Agent.first
  before_create :default_values

  def default_values
    self.agent_id = @@next_agent.id
    @@next_agent = Agent.where(id: @@next_agent.id+1)[0]
    # @@next_agent = Agent.where(@@next_agent.id+1);
    # @@next_agent = Agent.find(@@next_agent.id+1);
    @@next_agent = Agent.first if !@@next_agent
  end
 
end
