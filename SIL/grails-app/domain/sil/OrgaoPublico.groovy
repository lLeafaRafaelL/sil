package sil

class OrgaoPublico {
	String nome
	String sigla
	String endereco
	String cnpj
	String telefone
	String email
	Cidade cidade
	
	static hasMany =[dotacoes:Dotacao]

    static constraints = {
		cnpj unique:true
		email email:true, blank:true, nullable:true
		cidade nullable:false, blank: true
		telefone blank:true, nullable: true
		nome unique:true, validator: { val, obj -> val.size() >= 3 }
		sigla blank:true, nullable: true
    }
}
