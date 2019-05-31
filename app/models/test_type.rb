class TestType < ActiveRecord::Base
	has_many :test_cases
	validates :name, :presence => true
	validates :name, :uniqueness => true
end
