<%@ page import="sil.TipoUsuario" %>



<div class="fieldcontain ${hasErrors(bean: tipoUsuarioInstance, field: 'nivelAcesso', 'error')} required">
	<label for="nivelAcesso">
		<g:message code="tipoUsuario.nivelAcesso.label" default="Nivel Acesso" />
		<span class="required-indicator">*</span>
	</label>
	<g:field name="nivelAcesso" type="number" value="${tipoUsuarioInstance.nivelAcesso}" required=""/>

</div>

<div class="fieldcontain ${hasErrors(bean: tipoUsuarioInstance, field: 'descricao', 'error')} required">
	<label for="descricao">
		<g:message code="tipoUsuario.descricao.label" default="Descricao" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="descricao" required="" value="${tipoUsuarioInstance?.descricao}"/>

</div>

