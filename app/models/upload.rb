class Upload < ActiveRecord::Base
  has_attached_file :upload, :url => ":class/:id/:style/:filename", 
                    :path => '%s/:class/:id_partition/:style_:filename' %[Rails.env.test? ? ":rails_root/spec/test_files/#{Rails.env}" : ':rails_root/assets'],
                    :styles => { :preview => "600x600>", :thumb => "75x75>" }
  
  validates_attachment_presence :upload
  validates_attachment_size :upload, :less_than => 10.megabytes
  validates_attachment_content_type :upload, :content_type => ["image/test", "image/jpeg", "image/png", "image/gif", "image/bmp"]

  before_create :default_description
  
  def downloadable?(user)
    user != :guest
  end
  
  belongs_to :uploadable, polymorphic: true

  def default_description
    self.description ||= File.basename(upload_file_name, '.*').titleize
  end
end
