class CreateTests < ActiveRecord::Migration
  def self.up
    create_table :tests do |t|
      t.integer :test_tab_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :tests
  end
end
