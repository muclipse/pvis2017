class AddAttachmentThumbnailToSponsors < ActiveRecord::Migration
  def self.up
    change_table :sponsors do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :sponsors, :thumbnail
  end
end
