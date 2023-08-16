<%@page import="dao.EspecialidadeDAO"%>
<%@page import="model.especialidade.Especialidade"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="usuario" value="${sessionScope.usuarioLogado}" />

<%
List<Especialidade> especialidades = EspecialidadeDAO.listarTodos();
System.out.println("Quantidade de especialidades: " + especialidades.size());

//Armazenando a lista para que o  JSTL possa acessar, pois ele roda no servidor primeiro.
request.setAttribute("especialidades", especialidades);

%>




<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Selecione Especialidade</title>
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
				<form class="custom-form" action="agendamento-inicio.jsp" method="post"
					onsubmit="return validarFormulario()">
					<fieldset>
						<!-- Form Name -->
						<legend class="text-center">Selecione a Especialidade</legend>

						<div class="row mb-3">

							<div class="col-sm-12">
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
	<script>
		function validarFormulario() {
			const selectEspecialidade = document
					.getElementById('selectEspecialidade');
			const valorSelecionado = selectEspecialidade.value;

			if (valorSelecionado === '') {
				alert('Selecione uma especialidade antes de enviar o formulário.');
				return false; // Impede o envio do formulário
			}

			return true; // Permite o envio do formulário se uma opção válida estiver selecionada
		}
	</script>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>
</html>