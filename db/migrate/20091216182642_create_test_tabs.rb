class CreateTestTabs < ActiveRecord::Migration
  def self.up
    create_table :test_tabs do |t|
      t.string :nome
      t.text :descricao

      t.timestamps
    end
  end

  def self.down
    drop_table :test_tabs
  end
end
