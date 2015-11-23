<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Migración Plantillas Alcatel</title>

<spring:url value="/resources/core/css/hello.css" var="coreCss" />
<spring:url value="/resources/core/css/bootstrap.min.css"
	var="bootstrapCss" />
<link href="${bootstrapCss}" rel="stylesheet" />
<link href="${coreCss}" rel="stylesheet" />
</head>

<nav class="navbar navbar-inverse navbar-fixed-top">
	<div class="container">
		<div class="navbar-header" align="center">
			<a class="navbar-brand">Migración de Plantillas Alcatel</a>
		</div>
	</div>
</nav>

<div class="jumbotron">
	<div class="container">

		<h1>Seleccion</h1>
		<p>${selectedOption}</p>

		<h1>${title}</h1>
		<p>
			<c:if test="${not empty msg}">
			Hello ${msg}
		</c:if>

			<c:if test="${empty msg}">
			Welcome Welcome!
		</c:if>
		</p>
		<p>
			<a class="btn btn-primary btn-lg" href="#" role="button">Buscar
				Equipos </a>
		</p>
	</div>
</div>

<div class="container">

	<form action="TemplateAlcatelMainteiner/hello/${element}"
		method="get">
		<div class="row">
			<div class="col-md-4">
				<div class="dropdown">
					<button class="btn btn-default dropdown-toggle" 
						id="dropdownMenu1" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="true">
						Seleccionar Equipo <span class="caret"></span>
					</button>
					<ul class="dropdown-menu" aria-labelledby="dropdownMenu1"
						id="device">
						
						<c:forEach items="${dropdown}" var="element">
							<li><a>${element}</a></li>
						</c:forEach>
					</ul>
				</div>
			</div>
		</div>
		<input type="submit" name="submit" value="Seleccionar">
	</form>

	<hr>
	<footer>
		<p>© Gtd-Ingenieria 2015</p>
	</footer>
</div>

<spring:url value="/resources/core/js/hello.js" var="coreJs" />
<spring:url value="/resources/core/js/bootstrap.min.js"
	var="bootstrapJs" />

<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.3/jquery.min.js"></script>
</body>
<script src="${coreJs}"></script>
<script src="${bootstrapJs}"></script>
</html>