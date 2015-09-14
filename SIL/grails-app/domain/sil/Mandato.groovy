package sil

import autenticacao.Usuario

class Mandato {
	
	Date dataInicio
	Date dataFim
	Date dataEncerramento
	Cidade cidade
	Usuario prefeito
	
    static constraints = {
		dataEncerramento nullable:true
		dataInicio nullable:false
		dataFim nullable:false
		cidade nullable:false
		prefeito nullable:false
    }
}
