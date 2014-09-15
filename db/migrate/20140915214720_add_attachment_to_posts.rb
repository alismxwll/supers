class AddAttachmentToPosts < ActiveRecord::Migration
  def change
    add_attachment :posts, :pictures
  end
end
