package sil

class Estado {
	String nome
	String uf
	
    static constraints = {
		nome unique:true, blank:false, nullable: false
		uf blank: false, nullable: false
    }
}
