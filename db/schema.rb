# This file is auto-generated from the current state of the database. Instead of editing this file, 
# please use the migrations feature of Active Record to incrementally modify your database, and
# then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your database schema. If you need
# to create the application database on another system, you should be using db:schema:load, not running
# all the migrations from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20100610174949) do

  create_table "allow_tests", :force => true do |t|
    t.boolean  "authorization", :default => true
    t.integer  "test_tab_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "areas", :force => true do |t|
    t.string   "name"
    t.text     "description"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "contatos", :force => true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "curriculos", :force => true do |t|
    t.string   "nome"
    t.string   "sobrenome"
    t.datetime "data_nasc"
    t.string   "estado_civil"
    t.boolean  "empregado"
    t.integer  "escolaridade"
    t.boolean  "filhos"
    t.string   "endereco"
    t.integer  "numero"
    t.string   "complemento"
    t.string   "bairro"
    t.string   "cidade"
    t.string   "estado"
    t.string   "celular"
    t.string   "telefone"
    t.integer  "salario",      :limit => 11, :precision => 11, :scale => 0
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "english"
    t.string   "spanish"
    t.string   "informatica"
    t.integer  "area_id1"
    t.integer  "area_id2"
    t.integer  "area_id3"
  end

  create_table "escolaridades", :force => true do |t|
    t.string   "local"
    t.integer  "estado",       :limit => 2
    t.integer  "tipo_curso",   :limit => 2
    t.string   "area"
    t.integer  "curriculo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "exps", :force => true do |t|
    t.string   "local"
    t.string   "departamento"
    t.string   "cargo"
    t.text     "experiencia"
    t.string   "motivo_saida"
    t.datetime "data_inicio"
    t.datetime "data_fim"
    t.integer  "curriculo_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "noticias", :force => true do |t|
    t.string   "title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "permissions", :force => true do |t|
    t.integer  "role_id",    :null => false
    t.integer  "user_id",    :null => false
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "question_tabs", :force => true do |t|
    t.string   "titulo"
    t.text     "texto"
    t.integer  "test_tab_id"
    t.string   "picture_file_name"
    t.string   "picture_content_type"
    t.integer  "picture_file_size"
    t.datetime "picture_updated_at"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "questions", :force => true do |t|
    t.integer  "question_tab_id"
    t.string   "resposta"
    t.integer  "test_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "roles", :force => true do |t|
    t.string   "rolename"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "searches", :force => true do |t|
    t.string   "nome"
    t.string   "empregado"
    t.integer  "escolaridade"
    t.string   "cidade"
    t.string   "estado"
    t.integer  "area_atuacao"
    t.string   "ingles"
    t.string   "espanhol"
    t.string   "informatica"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "selections", :force => true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "servicos", :force => true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "test_tabs", :force => true do |t|
    t.string   "nome"
    t.text     "descricao"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "tests", :force => true do |t|
    t.integer  "test_tab_id"
    t.integer  "user_id"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "users", :force => true do |t|
    t.string   "login"
    t.string   "email"
    t.string   "crypted_password",          :limit => 40
    t.string   "salt",                      :limit => 40
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "remember_token"
    t.datetime "remember_token_expires_at"
    t.string   "activation_code",           :limit => 40
    t.datetime "activated_at"
    t.string   "password_reset_code",       :limit => 40
    t.boolean  "enabled",                                 :default => true
    t.string   "name"
    t.string   "surname"
    t.integer  "curriculo_id"
  end

  create_table "whos", :force => true do |t|
    t.string   "title"
    t.string   "sub_title"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
