class CreateCurriculos < ActiveRecord::Migration
  def self.up
    create_table :curriculos do |t|
      t.string :nome
      t.string :sobrenome
      t.datetime :data_nasc
      t.string :estado_civil
      t.boolean :empregado
      t.integer :escolaridade
      t.boolean :filhos
      t.string :endereco
      t.integer :numero
      t.string :complemento
      t.string :bairro
      t.string :cidade
      t.string :estado
      t.string :celular
      t.string :telefone
      t.integer :area_id
      t.integer :sub_area_id
      t.integer :salario
      t.references :user

      t.timestamps
    end
  end

  def self.down
    drop_table :curriculos
  end
end
