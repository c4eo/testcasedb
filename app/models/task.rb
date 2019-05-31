class Task < ActiveRecord::Base
  belongs_to :user
  has_many :comments, :dependent => :destroy
	belongs_to :assignment
	has_many :results, :through => :assinment
  validates :user_id, :presence => true
  validates :due_date, :presence => true  
  validates :task, :presence => true
  validates :status, :presence => true
  validates :name, :presence => true
end
