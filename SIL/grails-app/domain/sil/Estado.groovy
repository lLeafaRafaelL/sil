package sil

class Estado {
	String nome
	String uf
	
    static constraints = {
		nome unique:true, blank:false, nullable: false, size:1..255
		uf blank: false, nullable: false, size:1..3
    }
}
