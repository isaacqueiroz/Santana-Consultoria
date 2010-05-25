class CreateAllowTests < ActiveRecord::Migration
  def self.up
    create_table :allow_tests do |t|
      t.boolean :authorization, :default => true
      t.integer :test_tab_id
      t.integer :user_id

      t.timestamps
    end
  end

  def self.down
    drop_table :allow_tests
  end
end
