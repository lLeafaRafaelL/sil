import autenticacao.Usuario
import autenticacao.Permissao
import autenticacao.UsuarioPermissao

class BootStrap {

    def init = { servletContext ->
		
		Usuario usuario = Usuario.findByUsername("admin")
		
		if(usuario == null){
			usuario = new Usuario(
							username:"admin", 
							password:"admin", 
							accountExpired: false, 
							accountLocked: false, 
							passwordExpired: false).save(flush:true)
		} 
		
		Permissao permissao = Permissao.findByAuthority("ROLE_ADMIN")
		
		if(permissao == null){
			permissao = new Permissao(authority: "ROLE_ADMIN").save(flush:true)
		}
		
		if(UsuarioPermissao.findByUsuarioAndPermissao(usuario,permissao) == null){
			new UsuarioPermissao(usuario: usuario, permissao: permissao).save(flush:true)
		}
    }
    def destroy = {
    }
}
