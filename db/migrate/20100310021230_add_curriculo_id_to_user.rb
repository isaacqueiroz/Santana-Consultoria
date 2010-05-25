class AddCurriculoIdToUser < ActiveRecord::Migration
  def self.up
    add_column :users, :curriculo_id, :integer
  end

  def self.down
    remove_column :users, :curriculo_id
  end
end
