class Search < ActiveRecord::Base
  
 
  def curriculos
    @curriculos ||= find_curriculos  
  end
  
  private
  
  def find_curriculos
    Curriculo.find(:all, :conditions => conditions)
  end
  
  def nome_conditions
    ["curriculos.nome LIKE ?", "%#{nome}%"] unless nome.blank?
  end
  
  def empregado_conditions
    ["curriculos.empregado = ?", empregado] unless empregado.blank?
  end
  
  def escolaridade_conditions
    ["curriculos.escolaridade = ?", escolaridade] unless escolaridade.blank?
  end
  
  def cidade_conditions
    ["curriculos.cidade LIKE ?", "%#{cidade}%"] unless cidade.blank?
  end
  
  def estado_conditions
    ["curriculos.estado LIKE ?", "%#{estado}%"] unless estado.blank?
  end
  
  def area_atuacao_conditions
    ["curriculos.area_id1 = ? OR curriculos.area_id2 = ? OR curriculos.area_id3 = ?", area_atuacao, area_atuacao, area_atuacao] unless area_atuacao.blank?
  end
  
  def ingles_conditions
    ["curriculos.english LIKE ?", "%#{ingles}%"] unless ingles.blank?
  end
  
  def espanhol_conditions
    ["curriculos.spanish LIKE ?", "%#{espanhol}%"] unless espanhol.blank?
  end
  
  def informatica_conditions
    ["curriculos.informatica LIKE ?", "%#{informatica}%"] unless informatica.blank?
  end
  
  def conditions
    [conditions_clauses.join(' AND '), *conditions_options]
  end
  
  def conditions_clauses
    conditions_parts.map { |condition| condition.first }
  end
  
  def conditions_options
    conditions_parts.map { |condition| condition[1..-1] }.flatten
  end
  
  def conditions_parts
    private_methods(false).grep(/_conditions$/).map { |m| send(m) }.compact
  end
end
