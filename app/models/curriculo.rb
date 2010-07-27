class Curriculo < ActiveRecord::Base
  belongs_to :user
  has_many :escolaridades, :dependent => :destroy
  has_many :exps, :dependent => :destroy
   
  after_update :save_escolaridade, :save_exp
  
  #Validação

   validates_length_of :nome, :sobrenome, :bairro, :cidade,
    :in => 2..255
   
   validates_numericality_of :numero
   
   validates_presence_of :data_nasc, :estado_civil, :empregado,:escolaridade,
    :filhos, :estado
   
   validates_length_of :endereco, :telefone,
    :in => 8..255
    
   validates_length_of :numero,
    :in => 2..4
    
   validates_length_of :complemento, :celular,
    :in => 0..255
  

  #Atributo especial para permitir a manipulação da tabela escolaridade.
  def new_escolaridade_att=(escolaridade_att)
      escolaridade_att.each do |attributes|
      escolaridades.build(attributes)
    end
  end
  
  #Define se vai excluir ou criar outro item na tabela.
  def existing_escolaridade_att=(escolaridade_att)
    escolaridades.reject(&:new_record?).each do |escolaridade|
      attributes = escolaridade_att[escolaridade.id.to_s]
      if attributes
        escolaridade.attributes = attributes
      else
        escolaridades.delete(escolaridade)
      end
    end
  end
  
  #Garante que a tabela será salva e ignora as validações.
  def save_escolaridade
    escolaridades.each do |escolaridade|
      escolaridade.save(false)
    end
  end
  
  def new_exp_att=(exp_att)
      exp_att.each do |attributes|
      exps.build(attributes)
    end
  end
  
  def existing_exp_att=(exp_att)
    exps.reject(&:new_record?).each do |exp|
      attributes = exp_att[exp.id.to_s]
      if attributes
        exp.attributes = attributes
      else
        exps.delete(exp)
      end
    end
  end
  
  def save_exp
    exps.each do |exp|
      exp.save(false)
    end
  end
  
end