package sil

class TipoUsuario {
	String descricao
	int nivelAcesso

    static constraints = {
		nivelAcesso size:0..5, blank: false
    }
}
