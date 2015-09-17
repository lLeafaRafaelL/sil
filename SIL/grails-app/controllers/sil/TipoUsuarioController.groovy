package sil



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class TipoUsuarioController {

    static allowedMethods = [save: "POST", update: "PUT"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
		
		if (params.nome){
			flash.message = message(code:'default.created.message',args:['TipoUsuario',params.nome], default:'TipoUsuario criado')
		}
		
        respond TipoUsuario.list(params), model:[tipoUsuarioInstanceCount: TipoUsuario.count()]
    }

    def show(TipoUsuario tipoUsuarioInstance) {
		redirect(action:'index', params:[nome:tipoUsuarioInstance.id])
        // respond tipoUsuarioInstance
    }

    def create() {
        respond new TipoUsuario(params)
    }

    @Transactional
    def save(TipoUsuario tipoUsuarioInstance) {
        if (tipoUsuarioInstance == null) {
            notFound()
            return
        }

        if (tipoUsuarioInstance.hasErrors()) {
            respond tipoUsuarioInstance.errors, view:'create'
            return
        }

        tipoUsuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), tipoUsuarioInstance.id])
                redirect tipoUsuarioInstance
            }
            '*' { respond tipoUsuarioInstance, [status: CREATED] }
        }
    }

    def edit(TipoUsuario tipoUsuarioInstance) {
        respond tipoUsuarioInstance
    }

    @Transactional
    def update(TipoUsuario tipoUsuarioInstance) {
        if (tipoUsuarioInstance == null) {
            notFound()
            return
        }

        if (tipoUsuarioInstance.hasErrors()) {
            respond tipoUsuarioInstance.errors, view:'edit'
            return
        }

        tipoUsuarioInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'TipoUsuario.label', default: 'TipoUsuario'), tipoUsuarioInstance.id])
                redirect tipoUsuarioInstance
            }
            '*'{ respond tipoUsuarioInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(TipoUsuario tipoUsuarioInstance) {

        if (tipoUsuarioInstance == null) {
            notFound()
            return
        }

        tipoUsuarioInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'TipoUsuario.label', default: 'TipoUsuario'), tipoUsuarioInstance.id])
                redirect action:"index", method:"GET"
            }
            // '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'tipoUsuario.label', default: 'TipoUsuario'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
