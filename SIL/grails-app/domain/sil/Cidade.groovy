package sil

class Cidade {
	String nome
	Estado estado
	
	static hasMany =[mandatos: Mandato]
	
    static constraints = {
		nome unique: true, blank:false, nullable:false, validator: { val, obj -> val.size() >= 2 }
    }
}
