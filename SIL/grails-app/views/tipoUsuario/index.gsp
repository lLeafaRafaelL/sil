
<%@ page import="sil.TipoUsuario" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="sbadmin2">
		<g:set var="entityName" value="${message(code: 'tipoUsuario.label', default: 'TipoUsuario')}" />
		<title><g:message code="default.list.label" args="[entityName]" /></title>
	</head>
	<body>
		<div id="list-tipoUsuario" class="content scaffold-list" role="main">
			<div class="panel panel-primary">
				<div class="panel-heading">
					${entityName}
				</div>
				<g:if test="${flash.message}">
					<div class="alert alert-info alert-dismissable" role="status"
						style="margin: 10px; width: 98%">
						<button type="button" class="close" data-dismiss="alert"
							aria-hidden="true">×</button>
						${flash.message}
					</div>
				</g:if>
				<table
					class="table table-striped table-bordered table-hover datatable"
					style="width: 98%; margin: 10px;">
					<thead>
						<tr role="row">
							<td />
							<td />
							
								<g:sortableColumn property="nivelAcesso" title="${message(code: 'tipoUsuario.nivelAcesso.label', default: 'Nivel Acesso')}" />
							
								<g:sortableColumn property="descricao" title="${message(code: 'tipoUsuario.descricao.label', default: 'Descricao')}" />
							
						</tr>
					</thead>
					<tbody>
						<g:each in="${tipoUsuarioInstanceList}" status="i"
							var="tipoUsuarioInstance">
							<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">
								
								<td>
									<g:link alt="Excluir" action="delete" id="${tipoUsuarioInstance.id}">
										<input type="hidden" name="_method" value="DELETE" id="_method">
										<span class="fa fa-times-circle" style="color: red; font-size: 16px; "onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
									</g:link>
								</td>
								<td><g:link alt="Editar" action="edit" id="${tipoUsuarioInstance.id}">
										<span class="fa fa-edit" style="font-size: 16px;"></span>
									</g:link></td>
								
								<td><g:link action="show" id="${tipoUsuarioInstance.id}">${fieldValue(bean: tipoUsuarioInstance, field: "nivelAcesso")}</g:link></td>
							
								<td>${fieldValue(bean: tipoUsuarioInstance, field: "descricao")}</td>
							
							</tr>
						</g:each>
					</tbody>
				</table>
				<table width="100%"><tr><td align="center">
					<div class="pagination">
						<g:paginate total="${tipoUsuarioInstanceCount ?: 0}" />
					</div>
					</td></tr>
				</table>
				<div id="acoes" class="panel-footer">
					<a href="${createLink(controller:entityName, action:'create')}">
						<button
							id="btnNovo" class="btn btn-primary">
							<g:message code="default.new.label" args="[entityName]" />
						</button></a>
				</div>
			</div>
		</div>
	</body>
</html>
