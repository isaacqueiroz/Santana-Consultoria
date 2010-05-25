class AddLanguagesToCurriculos < ActiveRecord::Migration
  def self.up
    add_column :curriculos, :english, :string
    add_column :curriculos, :spanish, :string
    add_column :curriculos, :informatica, :string
  end

  def self.down
    remove_column :curriculos, :english
    remove_column :curriculos, :spanish
    remove_column :curriculos, :informatica
  end
end
