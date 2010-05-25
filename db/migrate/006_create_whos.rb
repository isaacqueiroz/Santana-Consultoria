class CreateWhos < ActiveRecord::Migration
  def self.up
    create_table :whos do |t|
      t.string :title
      t.string :sub_title
      t.text :body

      t.timestamps
    end
  end

  def self.down
    drop_table :whos
  end
end
