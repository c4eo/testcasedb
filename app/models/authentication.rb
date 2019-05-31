class Authentication < ActiveRecord::Base
  validates :user_id, :uid, :provider, :presence => true
  validates_uniqueness_of :uid, :scope => :provider
  
  belongs_to :user
end
