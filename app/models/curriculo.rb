class Curriculo < ActiveRecord::Base
  belongs_to :user
  has_many :escolaridades, :dependent => :destroy
  has_many :exps, :dependent => :destroy
   
  after_update :save_tasks, :save_exp

  #Atributo especial para permitir a manipulação da tabela escolaridade.
  def new_escolaridade_att=(escolaridade_att)
      escolaridade_att.each do |attributes|
      escolaridades.build(attributes)
    end
  end
  
  #Define se vai excluir ou criar outro item na tabela.
  def existing_escolaridade_att=(escolaridade_att)
    escolaridade.reject(&:new_record?).each do |task|
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
    exp.reject(&:new_record?).each do |task|
      exp_attributes = exp_att[exp.id.to_s]
      if exp_attributes
        exp.exp_attributes = exp_attributes
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