class AddAttachmentToPost < ActiveRecord::Migration
  def change
    def self.up
      add_attachment :users, :avatar
    end
  end
end
