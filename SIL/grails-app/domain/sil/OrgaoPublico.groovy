package sil

class OrgaoPublico {
	String nome
	String sigla
	String endereco
	String cnpj
	String telefone
	String email
	List<Dotacao> dotacoes

    static constraints = {
		cnpj unique:true
    }
}
