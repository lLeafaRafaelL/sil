
<%@ page import="sil.Estado"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="sbadmin2">
<g:set var="entityName"
	value="${message(code: 'estado.label', default: 'Estado')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<!-- <a href="#list-estado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>-->
	<div id="list-estado" class="content scaffold-list" role="main">
		<div class="panel panel-primary">
			<div class="panel-heading">
				${entityName}
			</div>
			<!-- <h1><g:message code="default.list.label" args="[entityName]" /></h1> -->
			<g:if test="${flash.message}">
				<div class="alert alert-info alert-dismissable" role="status"
					style="margin: 10px; width: 98%">
					<button type="button" class="close" data-dismiss="alert"
						aria-hidden="true">×</button>
					${flash.message}
				</div>
				${flash.message = null} 
			</g:if>
			<table
				class="table table-striped table-bordered table-hover datatable"
				style="width: 98%; margin: 10px;">
				<thead>
					<tr role="row">
						<td />
						<td />
						<g:sortableColumn property="nome"
							title="${message(code: 'estado.nome.label', default: 'Nome')}" />

						<g:sortableColumn property="uf"
							title="${message(code: 'estado.uf.label', default: 'UF')}" />

					</tr>
				</thead>
				<tbody>
					<g:each in="${estadoInstanceList}" status="i" var="estadoInstance">
						<tr class="${(i % 2) == 0 ? 'gradeA even' : 'gradeA odd'}">
							<td>
								<g:link action="delete" id="${estadoInstance.id}">
									<input type="hidden" name="_method" value="DELETE" id="_method">
									<span class="fa fa-times-circle" style="color: red; font-size: 16px; "onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Tem certeza?')}');" />
								</g:link>
							</td>
							<td><g:link action="show" id="${estadoInstance.id}">
									<span class="fa fa-edit" style="font-size: 16px;"></span>
								</g:link></td>
							<td width=90%>
								${fieldValue(bean: estadoInstance, field: "nome")}
							</td>

							<td width=10%>
								${fieldValue(bean: estadoInstance, field: "uf")}
							</td>

						</tr>
					</g:each>
				</tbody>
			</table>
			<table width="100%"><tr><td align="center">
				<g:paginate total="${estadoInstanceCount ?: 0}" />
				</td></tr>
			</table>
			<div id="acoes" class="panel-footer">
				<a href="${createLink(controller:entityName, action:'create')}"><button
						id="btnNovo" class="btn btn-primary">
						<g:message code="default.new.label" args="[entityName]" />
					</button></a>
			</div>
		</div>
	</div>
</body>
</html>
