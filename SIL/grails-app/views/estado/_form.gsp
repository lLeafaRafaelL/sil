<%@ page import="sil.Estado" %>



<div class="form-inline" style="margin:10px;">
	<div class="row" style="margin:10px;">
		<label for="nome">
			<g:message code="estado.nome.label" default="Nome" />
			<span class="required-indicator">*</span> 
		</label>
		<input type="text" name="nome" style="width:75%;" value ="${estadoInstance?.nome}" class="form-control ${hasErrors(bean: estadoInstance, field: 'nome', 'has-error')}" placeholder="${message(code: estado?.nome?.label, default: 'UF')}">

		<label for="uf">
			<g:message code="estado.uf.label" default="UF" />
			<span class="required-indicator">*</span>
		</label>
		<input type="text" name="uf" style="width:8%;" value ="${estadoInstance?.uf}" class="form-control ${hasErrors(bean: estadoInstance, field: 'uf', 'has-error')}" placeholder="${message(code: estado?.uf?.label, default: 'UF')}">		
	</div>
	
</div>

