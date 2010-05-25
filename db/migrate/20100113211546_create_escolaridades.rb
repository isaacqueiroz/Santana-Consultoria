class CreateEscolaridades < ActiveRecord::Migration
  def self.up
    create_table :escolaridades do |t|
      t.string :local
      t.integer :estado, :limit => 2
      t.integer :tipo_curso, :limit => 2
      t.string :area
      t.references :curriculo

      t.timestamps
    end
  end

  def self.down
    drop_table :escolaridades
  end
end
