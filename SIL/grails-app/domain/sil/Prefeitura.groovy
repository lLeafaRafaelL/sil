package sil

class Prefeitura {
	Cidade cidade
	String endereco
	int cep
	String cnpj
	String email
	String telefone

    static constraints = {
		cidade unique:true
		email email:true, nullable:true, blank:true
		telefone blank:true, nullable: true
		endereco blank:false, nullable:false
		cnpj blank:false, nullable:false
		cep nullable:false, blank:false
    }
}
