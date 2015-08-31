package sil



import static org.springframework.http.HttpStatus.*
import grails.transaction.Transactional

@Transactional(readOnly = true)
class NovaClasseController {

    static allowedMethods = [save: "POST", update: "PUT", delete: "DELETE"]

    def index(Integer max) {
        params.max = Math.min(max ?: 10, 100)
        respond NovaClasse.list(params), model:[novaClasseInstanceCount: NovaClasse.count()]
    }

    def show(NovaClasse novaClasseInstance) {
        respond novaClasseInstance
    }

    def create() {
        respond new NovaClasse(params)
    }

    @Transactional
    def save(NovaClasse novaClasseInstance) {
        if (novaClasseInstance == null) {
            notFound()
            return
        }

        if (novaClasseInstance.hasErrors()) {
            respond novaClasseInstance.errors, view:'create'
            return
        }

        novaClasseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.created.message', args: [message(code: 'novaClasse.label', default: 'NovaClasse'), novaClasseInstance.id])
                redirect novaClasseInstance
            }
            '*' { respond novaClasseInstance, [status: CREATED] }
        }
    }

    def edit(NovaClasse novaClasseInstance) {
        respond novaClasseInstance
    }

    @Transactional
    def update(NovaClasse novaClasseInstance) {
        if (novaClasseInstance == null) {
            notFound()
            return
        }

        if (novaClasseInstance.hasErrors()) {
            respond novaClasseInstance.errors, view:'edit'
            return
        }

        novaClasseInstance.save flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.updated.message', args: [message(code: 'NovaClasse.label', default: 'NovaClasse'), novaClasseInstance.id])
                redirect novaClasseInstance
            }
            '*'{ respond novaClasseInstance, [status: OK] }
        }
    }

    @Transactional
    def delete(NovaClasse novaClasseInstance) {

        if (novaClasseInstance == null) {
            notFound()
            return
        }

        novaClasseInstance.delete flush:true

        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.deleted.message', args: [message(code: 'NovaClasse.label', default: 'NovaClasse'), novaClasseInstance.id])
                redirect action:"index", method:"GET"
            }
            '*'{ render status: NO_CONTENT }
        }
    }

    protected void notFound() {
        request.withFormat {
            form multipartForm {
                flash.message = message(code: 'default.not.found.message', args: [message(code: 'novaClasse.label', default: 'NovaClasse'), params.id])
                redirect action: "index", method: "GET"
            }
            '*'{ render status: NOT_FOUND }
        }
    }
}
