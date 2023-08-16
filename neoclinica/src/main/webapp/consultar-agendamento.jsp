<%@page import="model.pessoa.Paciente"%>
<%@page import="java.util.List"%>
<%@page import="dao.UsuarioDAO"%>
<%@page import="model.medico.Medico"%>
<%@page import="model.medicosExames.MedicosExames"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="usuario" value="${sessionScope.usuarioLogado}" />
<c:choose>
	<c:when test="${usuario == null}">
		<c:redirect url="login.html" />
	</c:when>
</c:choose>
<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Consulta de Pacientes</title>
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
						aria-current="page" href="usuario-index.jsp">Home</a></li>
					<li class="nav-item"><a class="nav-link"
						href="agendamento-escolher-esp.jsp">Agendamento</a></li>
					<li class="nav-item"><a class="nav-link"
						href="cadastro-paciente.jsp">Cadastrar Paciente</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Visualizar </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="consultarAgendamentos">Consultas
									Agendadas</a></li>
							<li><a class="dropdown-item" href="consultarExames">Exames Disponiveis</a></li>
							<li><a class="dropdown-item" href="consultarMedicos">Médicos</a></li>
							<li><a class="dropdown-item" href="consultarPacientes">Pacientes
									Cadastrados</a></li>

						</ul></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button"
						data-bs-toggle="dropdown" aria-expanded="false"> Bem Vindo
							${usuario.username} </a>
						<ul class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink">
							<li><a class="dropdown-item" href="index.html">Sair</a></li>

						</ul></li>
				</ul>
			</div>
		</div>
	</nav>

	<main class="container mt-4 bg-light">
		<h1 class="text-center">Consultas Agendadas</h1>
		<hr>
		<section>
			<c:choose>
				<c:when test="${not empty agendamentos}">
					<div class="table-responsive">
						<table class="table table-bordered table-striped mt-4">
							<thead class="table-dark">
								<tr>
									<th scope="col">Data</th>
									<th scope="col">Paciente</th>
									<th scope="col">Hora</th>
									<th scope="col">Médico</th>
									<th scope="col">Exame</th>
									<th scope="col">Status</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach items="${agendamentos}" var="agendamento">
									<tr>
										<td>${agendamento.getDataFormatada()}</td>
										<td>${agendamento.paciente.getNome()}</td>
										<td>${agendamento.hora}</td>
										<td>${agendamento.medicosExames.medico.getNome()}</td>
										<td>${agendamento.medicosExames.exame.getNome()}</td>
										<td>${agendamento.getStatusFormatado()}</td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</c:when>
				<c:otherwise>
					<p>Não há consultas agendadas.</p>
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