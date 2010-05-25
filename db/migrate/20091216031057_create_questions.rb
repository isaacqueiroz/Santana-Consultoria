class CreateQuestions < ActiveRecord::Migration
  def self.up
    create_table :questions do |t|
      t.integer :question_tab_id
      t.string :resposta
      t.references :test

      t.timestamps
    end
  end

  def self.down
    drop_table :questions
  end
end
