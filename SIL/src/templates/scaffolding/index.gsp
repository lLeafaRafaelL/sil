
<% import grails.persistence.Event %>
<%=packageName%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="sbadmin2">
<g:set var="entityName"
	value="\${message(code: '${domainClass.propertyName}.label', default: '${className}')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
</head>
<body>
	<div id="list-${domainClass.propertyName}"
		class="content scaffold-list" role="main">
		<div class="panel panel-primary">
			<!-- <h1><g:message code="default.list.label" args="[entityName]" /></h1> -->
			<div class="panel-heading">
				${entityName}
			</div>
			<g:if test="\${flash.message}">
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
						<%  excludedProps = Event.allEvents.toList() << 'id' << 'version'
							allowedNames = domainClass.persistentProperties*.name << 'dateCreated' << 'lastUpdated'
							props = domainClass.properties.findAll { allowedNames.contains(it.name) && !excludedProps.contains(it.name) && it.type != null && !Collection.isAssignableFrom(it.type) && (domainClass.constrainedProperties[it.name] ? domainClass.constrainedProperties[it.name].display : true) }
							Collections.sort(props, comparator.constructors[0].newInstance([domainClass] as Object[]))
							props.eachWithIndex { p, i ->
								if (i < 6) {
									if (p.isAssociation()) { %>
							<th><g:message code="${domainClass.propertyName}.${p.name}.label" default="${p.naturalName}" /></th>
						<%      } else { %>
							<g:sortableColumn property="${p.name}" title="\${message(code: '${domainClass.propertyName}.${p.name}.label', default: '${p.naturalName}')}" />
						<%  }   }   } %>
					</tr>
				</thead>
				<tbody>
					<g:each in="\${${propertyName}List}" status="i"
						var="${propertyName}">
						<tr class="\${(i % 2) == 0 ? 'even' : 'odd'}">
							<td><a alt="Excluir"><span class="fa fa-times-circle"
									style="color: red; font-size: 16px;"></span></a></td>
							<td><g:link action="show" id="${${propertyName}.id}">
									<span class="fa fa-edit" style="font-size: 16px;"></span>
								</g:link></td>
							<%  props.eachWithIndex { p, i ->
								if (i == 0) { %>
							<td><g:link action="show" id="\${${propertyName}.id}">\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</g:link></td>
						<%      } else if (i < 6) {
									if (p.type == Boolean || p.type == boolean) { %>
							<td><g:formatBoolean boolean="\${${propertyName}.${p.name}}" /></td>
						<%          } else if (p.type == Date || p.type == java.sql.Date || p.type == java.sql.Time || p.type == Calendar) { %>
							<td><g:formatDate date="\${${propertyName}.${p.name}}" /></td>
						<%          } else { %>
							<td>\${fieldValue(bean: ${propertyName}, field: "${p.name}")}</td>
						<%  }   }   } %>
						</tr>
					</g:each>
				</tbody>
			</table>
			<div class="pagination">
				<g:paginate total="\${${propertyName}Count ?: 0}" />
			</div>
			<div id="acoes" style="width: 98%; margin: 10px;">
				<a href="${createLink(controller:entityName, action:'create')}"><button
						id="btnNovo" class="btn btn-primary">
						<g:message code="default.new.label" args="[entityName]" />
					</button></a>
			</div>
		</div>
	</div>
</body>
</html>
