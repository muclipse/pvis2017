class Chair < ActiveRecord::Base
  has_many :chair_assignments, dependent: :destroy
  has_many :chair_groups, through: :chair_assignments

  has_attached_file :thumbnail,
    :preserve_files => "false", 
    :use_timestamp => false,
    :url => "/files/:class/:attachment/:id_:style_:hash.:extension",
    :hash_secret => "HelloPVis",
    :styles => {
      :thumb=> "300x300#",
      :thumb_retina=>"600x600#"
    }

  validates_attachment_content_type :thumbnail,
    :content_type=>['image/png', 'image/jpg', 'image/jpeg']
end
