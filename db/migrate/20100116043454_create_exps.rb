class CreateExps < ActiveRecord::Migration
  def self.up
    create_table :exps do |t|
      t.string :local
      t.string :departamento
      t.string :cargo
      t.text :experiencia
      t.string :motivo_saida
      t.datetime :data_inicio
      t.datetime :data_fim
      t.references :curriculo

      t.timestamps
    end
  end

  def self.down
    drop_table :exps
  end
end
