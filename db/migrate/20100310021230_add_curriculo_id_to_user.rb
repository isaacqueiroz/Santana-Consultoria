class AddCurriculoIdToUser < ActiveRecord::Migration
  def self.up
    remove_column :searches, :empregado
    add_column :searches, :empregado, :boolean
  end

  def self.down
     remove_column :searches, :empregado
       add_column :searches, :empregado, :integer
  end
end
