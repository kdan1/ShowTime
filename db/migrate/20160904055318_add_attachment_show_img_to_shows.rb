class AddAttachmentShowImgToShows < ActiveRecord::Migration
  def self.up
    change_table :shows do |t|
      t.attachment :show_img
    end
  end

  def self.down
    remove_attachment :shows, :show_img
  end
end
