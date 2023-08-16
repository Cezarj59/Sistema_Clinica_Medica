<%@page import="dao.EspecialidadeDAO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@page import="model.especialidade.Especialidade"%>
<%@page import="java.util.List"%>
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
<title>Cadastro de Exames</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
/* Estilos para o background em forma de coluna */
.background-column {
	background-image: linear-gradient(#284984, #3C6DB0, #21498C);
	height: 100vh;
	z-index: -1;
	opacity: 0.8;
	backdrop-filter: blur(5px);
	z-index: -1;
}

/* Estilos para o formulário com efeito de vidro */
.custom-form {
	background-color: rgba(255, 255, 255, 0.2);
	padding: 20px;
	margin: 20px auto;
	border-radius: 10px;
	color: #fff;
}
</style>
</head>

<body>
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
	<div class="container background-column">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form class="custom-form" name="form-cadastrar-exame" id="form-cadastrar-exame" method="POST" action="cadastrarExame">
					<fieldset>
						<!-- Form Name -->
						<legend class="text-center">Cadastro de Exames</legend>



						<!-- Select Basic -->
						<div class="row mb-3">
							<label for="selectDiaSemana" class="col-sm-3 col-form-label text-end">Dia
								da Semana</label>
							<div class="col-sm-9">
								<select class="form-select" id="selectDiaSemana" name="selectDiaSemana">
									<option disabled selected value="">Selecione</option>
									<option value="1">Segunda-Feira</option>
									<option value="2">Terça-Feira</option>
									<option value="3">Quarta-Feira</option>
									<option value="4">Quinta-Feira</option>
									<option value="5">Sexta-Feira</option>
								</select>
							</div>
						</div>

						<div class="row mb-3">
							<label for="inputNome" class="col-sm-3 col-form-label text-end">Nome</label>
							<div class="col-sm-9">
								<input type="text" class="form-control" id="inputNome" name="inputNome"
									placeholder="" required=""> <span
									class="form-text text-light">Tipo</span>
							</div>
						</div>


						<div class="row mb-3">
							<label for="selectEspecialidade"
								class="col-sm-3 col-form-label text-end">Especialidade</label>
							<div class="col-sm-9">
								<select name="selectEspecialidade" id="selectEspecialidade"
									class="form-select">
									<option disabled selected value="">Selecione</option>
									<c:forEach items="${especialidades}" var="esp">

										<option value="${esp.getId()}">${esp.getNome()}</option>
									</c:forEach>
								</select>
							</div>
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-success">Selecionar</button>
						</div>
					</fieldset>
				</form>
			</div>
		</div>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>