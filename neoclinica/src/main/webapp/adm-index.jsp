<%@page import="dao.UsuarioDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<c:set var="admin" value="${sessionScope.admLogado}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>ADM ${admin.username}</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">
<link rel="stylesheet" type="text/css" href="shared/css/index.css" />

</head>
<body class="index-adm">
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
	<%-- Usando a sessão HTTP --%>
	<h1>
		<p class="text-light">Neo Clinica</p>
		<p class="text-light">Bem-vindo, ${admin.username}!</p>
	</h1>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>