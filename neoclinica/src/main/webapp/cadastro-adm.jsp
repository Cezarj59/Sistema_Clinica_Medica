<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="admin" value="${sessionScope.admLogado}" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Administrador</title>
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
				<ul class="navbar-nav">
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
				<form class="custom-form" name="form-cadastro-adm" method="POST"
					action="cadastrarAdministrador">
					<fieldset>
						<!-- Form Name -->
						<legend class="text-center">Cadastro de Administrador</legend>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputNome" class="col-sm-2 col-form-label text-end">Nome</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputNome"
									name="inputNome" placeholder="" required=""> <span
									class="form-text text-light">Nome completo</span>
							</div>
						</div>

						<!-- Text input with date type -->
						<div class="row mb-3">
							<label for="inputNascimento"
								class="col-sm-2 col-form-label text-end">Nascimento</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="inputNascimento"
									name="inputNascimento" required="" min="1950-12-31"
									max="2023-12-31">
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputCpf" class="col-sm-2 col-form-label text-end">CPF</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputCpf"
									name="inputCpf" placeholder="" required=""> <span
									class="form-text text-light">Somente números</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputTelefone"
								class="col-sm-2 col-form-label text-end">Telefone</label>
							<div class="col-sm-10">
								<input type="tel" maxlength="11" class="form-control"
									id="inputTelefone" name="inputTelefone" placeholder=""
									required=""> <span class="form-text text-light">Somente
									números com DDD</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputEmail" class="col-sm-2 col-form-label text-end">Email</label>
							<div class="col-sm-10">
								<input type="email" class="form-control" id="inputEmail"
									name="inputEmail" placeholder="" required=""> <span
									class="form-text text-light">user@provedor.com</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputUserName"
								class="col-sm-2 col-form-label text-end">Username</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputUserName"
									name="inputUserName" placeholder="" required=""> <span
									class="form-text text-light">Nome de usuario</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputSenha" class="col-sm-2 col-form-label text-end">Senha</label>
							<div class="col-sm-10">
								<input type="password" class="form-control" id="inputSenha"
									name="inputSenha" placeholder=""> <span
									class="form-text text-light">password</span>
							</div>
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-success">Enviar</button>
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
</html>