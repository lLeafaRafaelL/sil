package sil

class Estado {
	String nome
	String uf
	
    static constraints = {
		nome unique:true
    }
}
