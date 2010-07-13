class CreateSearches < ActiveRecord::Migration
  def self.up
    create_table :searches do |t|
      t.string :nome
      t.string :empregado
      t.integer :escolaridade
      t.string :cidade
      t.string :estado
      t.integer :area_atuacao
      t.string :ingles
      t.string :espanhol
      t.string :informatica
      t.timestamps
    end
  end
  
  def self.down
    drop_table :searches
  end
end
