class Lead < ActiveRecord::Base
  belongs_to :agent
  validates_presence_of :name, :email, :phone, :start_date
end
