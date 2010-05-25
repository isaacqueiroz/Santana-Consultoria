module CurriculosHelper
  
  def fields_for_escolaridade(escolaridade, &block)
    prefix = escolaridade.new_record? ? 'new' : 'existing'
    fields_for("curriculo[#{prefix}_escolaridade_att][]", escolaridade, &block)
  end
  
  def add_escolaridade_link(name) 
    link_to_function name, :id=>"escola" do |page| 
      page.insert_html :top, :esc_divs, :partial => 'escolaridade', :object => Escolaridade.new 
    end 
  end 
  
  def fields_for_exp(exp, &block)
    prefix = exp.new_record? ? 'new' : 'existing'
    fields_for("curriculo[#{prefix}_exp_att][]", exp, &block)
  end
  def add_exp_link(name) 
    link_to_function name, :id=>"xp" do |page| 
      page.insert_html :top, :exps_div, :partial => 'exp', :object => Exp.new
    end 
  end 
  
  def escol_method(escolaridade)
    case escolaridade
      when 0
        'Primeiro Grau (Incompleto)'
      when 1
        'Primeiro Grau (Completo)'
      when 2
        'Segundo Grau (Incompleto)'
      when 3
        'Segundo Grau (Completo)'
      when 4
        'Ensino Superior (Incompleto)'
      when 5
        'Ensino Superior (Completo)'
      when 6
        'Pós Graduação'
    end
  end
  
  def get_tipo_curso(tipo_curso)
    case tipo_curso
      when 0
        'Primeiro Grau'
      when 1
        'Segundo Grau'
      when 2
        'Ensino Superior'
      when 3
        'Pós Graduação'
      when 4
        'Mestrado'
      when 5
        'Doutorado'
      when 6
        'Técnico'
    end
  end
  
  def get_estado_curso(estado)
      case estado
        when 0
          'Concluído'
        when 1
          'Incompleto'
        when 2
          'Em andamento'
      end
  end
  
end
