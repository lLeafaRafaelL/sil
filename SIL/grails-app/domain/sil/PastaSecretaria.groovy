package sil

class PastaSecretaria {
	Date dataInicio
	Date dataFim
	Date dataEncerramento
	OrgaoPublico orgao
	Usuario secretario
	
    static constraints = {
		dataEncerramento nullable:true
    }
}
