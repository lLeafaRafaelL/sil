<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="sbadmin2">
		<g:set var="entityName" value="${message(code: 'estado.label', default: 'Estado')}" />
		<title><g:message code="default.create.label" args="[entityName]" /></title>
	</head>
	<body>
		<!-- <a href="#create-estado" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
			</ul>
		</div> -->
		<div id="create-estado" class="content scaffold-create" role="main">
			<!-- <h1><g:message code="default.create.label" args="[entityName]" /></h1> -->
			<div class="panel panel-primary">
				<div class="panel-heading">${entityName}</div>
				<g:if test="${flash.message}">
					<div class="alert alert-info alert-dismissable" role="status" style="margin:10px; width: 98%">
						<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
						${flash.message}
					</div>
				</g:if>
				<div>
					<g:hasErrors bean="${estadoInstance}">
						<div class="alert alert-danger alert-dismissable" role="status" style="margin:10px; width: 98%">
							<button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
							<g:eachError bean="${estadoInstance}" var="error">
							<span class="glyphicon glyphicon-exclamation-sign"> ${error}</span>
							</g:eachError>
						</div>
					<!-- <ul class="errors" role="alert">
						<g:eachError bean="${estadoInstance}" var="error">
						<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message error="${error}"/></li>
						</g:eachError>
					</ul> -->
					</g:hasErrors>
					<g:form url="[resource:estadoInstance, action:'save']" method="POST" >
						<fieldset class="form" style="margin:10px">
							<g:render template="form"/>
						</fieldset>
						<fieldset class="buttons">
							<div id="acoes" class="panel-footer">
								<table width=100%>
									<tr>
										<td/>
										<td align="right">
											<button type="submit" class="btn btn-primary" >${message(code: 'default.button.create.label', default: 'Salvar')}</button>
											<a class="btn btn-primary" href="${createLink(controller:entityName, action:'index')}">${message(code: 'default.button.cancel.label', default: 'Cancelar')}</a>
											<!--<g:submitButton name="create" class="save" value="${message(code: 'default.button.create.label', default: 'Create')}" /> -->
										</td>
									</tr>
								</table>
							</div>
						</fieldset>
					</g:form>
				</div>
			</div>
		</div>
	</body>
</html>
