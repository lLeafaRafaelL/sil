package sil

class Dotacao {
	String unidade
	String atividade
	String elemento
	OrgaoPublico orgaoPublico
	
	static belongsTo = OrgaoPublico
	
    static constraints = {
		unidade blank: false, nullable:false
		atividade blank:false, nullable:false
		elemento blank:false, nullable:false
    }
}
