package sil
import autenticacao.Usuario

class PastaSecretaria {
	Date dataInicio
	Date dataFim
	Date dataEncerramento
	OrgaoPublico orgao
	Usuario secretario
	
    static constraints = {
		dataEncerramento nullable:true
		dataInicio nullable:false
		dataFim nullable:false
		orgao nullable:false
		secretario nullable:false
    }
}
