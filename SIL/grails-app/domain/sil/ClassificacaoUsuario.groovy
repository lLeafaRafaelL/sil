package sil

class ClassificacaoUsuario {
	String descricao
	TipoUsuario tipoUsuario
	
	static hasMany =[usuarios: Usuario]
	
    static constraints = {
		descricao unique: true, validator: { val, obj -> val.size() >= 3 }
    }
}
