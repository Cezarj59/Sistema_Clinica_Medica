<%@page import="dao.UsuarioDAO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<c:set var="usuario" value="${sessionScope.usuarioLogado}" />
<c:choose>
	<c:when test="${usuario == null}">
		<c:redirect url="login.html" />
	</c:when>
</c:choose>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Paciente</title>
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
							<li><a class="dropdown-item" href="consultarExames">Exames
									Disponiveis</a></li>
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
	<div class="container background-column">
		<div class="row justify-content-center">
			<div class="col-md-6">
				<form class="custom-form" id="form-cadastra-paciente"
					name="form-cadastra-paciente" action="cadastrarPaciente"
					method="POST">
					<fieldset>
						<!-- Form Name -->
						<legend class="text-center">Paciente</legend>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputNome" class="col-sm-2 col-form-label text-end">Nome</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputNome"
									name="inputNome" placeholder="" required=""> <span
									class="form-text">Nome completo</span>
							</div>
						</div>

						<!-- Text input with date type -->
						<div class="row mb-3">
							<label for="inputNascimento"
								class="col-sm-2 col-form-label text-end">Nascimento</label>
							<div class="col-sm-10">
								<input type="date" class="form-control" id="inputNascimento"
									name="inputNascimento" required="">
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputCpf" class="col-sm-2 col-form-label text-end">CPF</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputCpf"
									name="inputCpf" placeholder="" required=""> <span
									class="form-text">Somente números</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputTelefone"
								class="col-sm-2 col-form-label text-end">Telefone</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputTelefone"
									name="inputTelefone" placeholder="" required=""> <span
									class="form-text">Somente números com DDD</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputEmail" class="col-sm-2 col-form-label text-end">Email</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputEmail"
									name="inputEmail" placeholder="" required=""> <span
									class="form-text">user@provedor.com</span>
							</div>
						</div>

						<!-- Select Basic -->
						<div class="row mb-3">
							<label for="selectGenero"
								class="col-sm-2 col-form-label text-end">Gênero</label>
							<div class="col-sm-10">
								<select class="form-select" id="selectGenero"
									name="selectGenero">
									<option disabled selected value="">Selecione</option>
									<option value="Feminino">Feminino</option>
									<option value="Masculino">Masculino</option>
									<option value="Outro">Outro</option>
								</select>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputPeso" class="col-sm-2 col-form-label text-end">Peso</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputPeso"
									name="inputPeso" placeholder=""> <span
									class="form-text">ex: 70</span>
							</div>
						</div>

						<!-- Text input-->
						<div class="row mb-3">
							<label for="inputAltura" class="col-sm-2 col-form-label text-end">Altura</label>
							<div class="col-sm-10">
								<input type="text" class="form-control" id="inputAltura"
									name="inputAltura" placeholder=""> <span
									class="form-text">ex: 1.74</span>
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