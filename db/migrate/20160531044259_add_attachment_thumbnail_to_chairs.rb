class AddAttachmentThumbnailToChairs < ActiveRecord::Migration
  def self.up
    change_table :chairs do |t|
      t.attachment :thumbnail
    end
  end

  def self.down
    remove_attachment :chairs, :thumbnail
  end
end
