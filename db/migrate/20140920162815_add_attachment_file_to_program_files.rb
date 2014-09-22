class AddAttachmentFileToProgramFiles < ActiveRecord::Migration
  def self.up
    change_table :program_files do |t|
      t.attachment :file
    end
  end

  def self.down
    remove_attachment :program_files, :file
  end
end
