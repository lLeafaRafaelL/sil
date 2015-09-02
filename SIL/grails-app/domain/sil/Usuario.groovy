package sil

class Usuario {
	String nome
	String login
	String senha
	Date dataNascimento
	String tipoPessoa
	String rg
	String cpf
	String cnpj
	String endereco
	String cep
	String telefone
	String email
	String outrasInformacoes
	ClassificacaoUsuario classificacaoUsuario
	
    static constraints = {
		login unique: true, blank: false, nullable:false, validator: { val, obj -> val.size() >= 3 }
		email email:true, blank: true, nullable:true
		dataNascimento max: new Date()
		tipoPessoa inList:['F', 'J']
		outrasInformacoes blank:true, nullable:true
    }
}
