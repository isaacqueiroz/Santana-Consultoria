class CreateQuestionTabs < ActiveRecord::Migration
  def self.up
    create_table :question_tabs do |t|
      t.string :titulo
      t.text :texto
      t.integer :test_tab_id
      t.string :picture_file_name
      t.string :picture_content_type
      t.integer :picture_file_size
      t.datetime :picture_updated_at
      t.timestamps
    end
  end

  def self.down
    drop_table :question_tabs
  end
end
