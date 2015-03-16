class Lead < ActiveRecord::Base
  belongs_to :agent
  validates_presence_of :name, :email, :phone, :start_date

  # @@next_agent = Agent.first
  # before_save :default_values

  # def default_values
  
  # self.agent_id = @@next_agent.id
  # @@next_agent = Agent.find(@@next_agent.id+1)
  # @@next_agent = Agent.first unless @@next_agent
  # end
 
end
