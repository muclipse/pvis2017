class Sponsor < ActiveRecord::Base

  has_attached_file :thumbnail,
    :preserve_files => "false", 
    :use_timestamp => false,
    :url => "/files/:class/:attachment/:id_:hash.:extension",
    :hash_secret => "HelloPVis"
  validates_attachment_content_type :thumbnail,
    :content_type=>['image/png', 'image/jpg', 'image/jpeg']
end
