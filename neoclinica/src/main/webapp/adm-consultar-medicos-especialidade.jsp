<%@page import="dao.EspecialidadeDAO"%>
<%@page import="model.especialidade.Especialidade"%>
<%@page import="model.pessoa.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="admin" value="${sessionScope.admLogado}" />
<c:choose>
	<c:when test="${admin == null}">
		<c:redirect url="login.html" />
	</c:when>
</c:choose>
<%
List<Especialidade> especialidades = EspecialidadeDAO.listarTodos();
System.out.println("Quantidade de especialidades: " + especialidades.size());

//Armazenando a lista para que o  JSTL possa acessar, pois ele roda no servidor primeiro.
request.setAttribute("especialidades", especialidades);
%>

<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Consulta De Médicos</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
</head>
<body class="bg-primary">
<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<div class="container">
			<a class="navbar-brand" href="#">Neo Clinica</a>
			<button class="navbar-toggler" type="button"
				data-bs-toggle="collapse" data-bs-target="#navbarNavDropdown"
				aria-controls="navbarNavDropdown" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="adm-index.jsp">Home</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Cadastrar </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="cadastro-adm.jsp">Administrador</a></li>
							<li><a class="dropdown-item"
								href="cadastro-especialidade.jsp">Especialidades</a></li>
							<li><a class="dropdown-item" href="cadastro-exame.jsp">Exames</a></li>
							<li><a class="dropdown-item" href="cadastro-medico.jsp">Médicos</a></li>


						</ul></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Pacientes </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item"
								href="admConsultarTodosPacientes">Todos</a></li>
							<li><a class="dropdown-item"
								href="adm-consultar-paciente-genero.jsp">Por Genero</a></li>
							<li><a class="dropdown-item"
								href="adm-consultar-paciente-aniversariantes.jsp">Aniversariantes</a></li>
						</ul></li>

					<li class="nav-item"><a class="nav-link"
						href="admConsultarExames">Exames</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Médicos </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="admConsultarMedicos">Todos
									os médicos</a></li>
							<li><a class="dropdown-item"
								href="adm-consultar-medicos-especialidade.jsp">Por
									especialidade</a></li>
						</ul></li>

					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Agendamentos
					</a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item"
								href="admConsultarAgendamentosAbertos">Todos em aberto</a></li>
							<li><a class="dropdown-item"
								href="admConsultarAgendamentosRealizados">Todos realizados</a></li>
							<li><a class="dropdown-item"
								href="adm-consultar-agendamento-dia.jsp">Por dia</a></li>
							<li><a class="dropdown-item"
								href="admConsultarAgendamentosSemana">Por semana</a></li>
							<li><a class="dropdown-item"
								href="adm-consultar-agendamento-paciente.jsp">Por paciente</a></li>
						</ul></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Bem Vindo
							${admin.username} </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="index.html">Sair</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="container mt-4 bg-light p-3">
		<h4 class="text-center">Médicos por Especialidade</h4>
		<form
			class="container d-flex justify-content-center align-items-center"
			action="admConsultarMedicosEspecialidade" method="POST"
			onsubmit="return validarFormulario();">
			<div class="row">
				<div class="col-sm-8">
					<select name="selectEspecialidade" id="selectEspecialidade"
						class="form-select">
						<option disabled selected value="">Selecione</option>
						<c:forEach items="${especialidades}" var="esp">
							<option value="${esp.getId()}">${esp.getNome()}</option>
						</c:forEach>
					</select>
				</div>
				<div class="col-sm-4">
					<button type="submit" class="btn btn-primary">Pesquisar</button>
				</div>
			</div>
		</form>
	</div>

	<script>
		function validarFormulario() {
			var selectEspecialidade = document
					.getElementById("selectEspecialidade");

			if (selectEspecialidade.value === "") {
				alert("Por favor, selecione uma especialidade antes de enviar o formulário.");
				return false;
			}

			return true;
		}
	</script>


	<main class="container mt-4 bg-light">


		<h1 class="text-center">Consulta de Médicos</h1>
		<hr>
		<section>
			<c:choose>
				<c:when test="${not empty medicos}">
					<div class="table-responsive">
						<table class="table table-bordered table-striped mt-4">
							<thead class="table-dark">
								<tr>
									<th scope="col">Nome</th>
									<th scope="col">CRM</th>
									<th scope="col">Especialidade</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${medicos}" var="medico">
									<tr>
										<td>${medico.nome}</td>
										<td>${medico.crm}</td>
										<td>${medico.especialidade.getNome()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<p class="text-center">Não há médicos cadastrados.</p>
				</c:otherwise>
			</c:choose>
		</section>
	</main>







	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>