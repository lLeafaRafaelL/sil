package sil

class ClassificacaoUsuario {
	String descricao
	List<Usuario> usuarios
	TipoUsuario tipoUsuario

    static constraints = {
		decricao unique: true
    }
}
