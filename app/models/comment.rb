class Comment < ActiveRecord::Base
  
  belongs_to :test_case 
  belongs_to :test_plan
  belongs_to :user
  belongs_to :task
    
	validates :user_id, :presence => true
  validates :comment, :presence => true
end
