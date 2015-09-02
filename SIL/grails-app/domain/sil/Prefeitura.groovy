package sil

class Prefeitura {
	Cidade cidade
	String endereco
	String cep
	String cnpj
	String email
	String telefone

    static constraints = {
		cidade unique:true
		email email:true, nullable:true, blank:true
		telefone blank:true, nullable: true
    }
}
