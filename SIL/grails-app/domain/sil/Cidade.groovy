package sil

class Cidade {
	String nome
	Estado estado
	
    static constraints = {
		nome unique: true, validator: { val, obj -> val.size() >= 2 }
    }
}
