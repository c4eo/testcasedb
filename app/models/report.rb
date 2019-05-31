class Report < ActiveRecord::Base
  
  belongs_to :product
  belongs_to :version
  belongs_to :second_version, :class_name => "Version"
  belongs_to :user
end
