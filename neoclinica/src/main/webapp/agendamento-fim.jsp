<%@page import="model.medicosExames.MedicosExames"%>
<%@page import="dao.ExameDAO"%>
<%@page import="model.exame.Exame"%>
<%@page import="java.time.LocalDate"%>
<%@page import="util.DataUtils"%>
<%@page import="model.usuarios.Usuario"%>
<%@page import="dao.PacienteDAO"%>
<%@page import="model.pessoa.Paciente"%>
<%@page import="java.util.List"%>
<%@page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<c:set var="usuario" value="${sessionScope.usuarioLogado}" />
<c:set var="medicosExames" value="${sessionScope.medicosExames}" />
<c:choose>
	<c:when test="${usuario == null}">
		<c:redirect url="login.html" />
	</c:when>
</c:choose>
<%
// Pegando o ID do usuario da sessão 
Long usuarioId = ((Usuario) pageContext.getAttribute("usuario")).getId();

// Chamando o método buscarPacientesPorIdUsuario() do PacienteDAO e passando o id do usuário
List<Paciente> pacientes = PacienteDAO.buscarPacientesPorIdUsuario(usuarioId);

// Passando o resultado para a página JSP
request.setAttribute("pacientes", pacientes);

//Pegando o  medicosExames o da sessão 
MedicosExames medicosExames = (MedicosExames) pageContext.getAttribute("medicosExames");
%>

<c:set var="availableDates"
	value="<%=DataUtils.getDatasDisponiveisExames(medicosExames.getExame().getDiaSemana())%>" />



<!DOCTYPE html>
<html lang="pt-br">
<head>
<meta charset="UTF-8">
<title>Agendamento</title>
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
				<form class="custom-form" action="agendamentoFimServlet"
					method="post">
					<fieldset>
						<!-- Form Name -->
						<legend class="text-center">Agendamento</legend>

						<div class="row mb-3">
							<label for="inputData" class="col-sm-2 col-form-label text-end">Data</label>
							<div class="col-sm-10">
								<select class="form-select" id="inputData" name="inputData"
									required>
									<option value="" selected disabled>Escolha uma data</option>
									<c:forEach var="date" items="${availableDates}">
										<c:set var="dateString" value="${date}" />
										<fmt:parseDate var="parsedDate" value="${dateString}"
											pattern="yyyy-MM-dd" />
										<c:set var="formattedDate">
											<fmt:formatDate value="${parsedDate}" pattern="dd/MM/yyyy" />
										</c:set>
										<option value="${dateString}">${formattedDate}</option>
									</c:forEach>
								</select>
							</div>
						</div>


						<!-- Select para exibir os horários de 8:00 até 17:00 com intervalos de 30 minutos -->
						<div class="row mb-3">
							<label for="selectHorario"
								class="col-sm-2 col-form-label text-end">Horário</label>
							<div class="col-sm-10">
								<select id="selectHorario" name="selectHorario"
									class="form-select" required>
									<option value="" disabled selected>Selecione o horário</option>
									<!-- Manhã -->
									<optgroup label="Manhã">
										<c:forEach var="hora" begin="8" end="11" step="1">
											<c:forEach var="minuto" begin="0" end="45" step="15">
												<c:if
													test="${!(hora == 12 && minuto == 0) && !(hora == 12 && minuto == 30)}">
													<c:set var="formattedMinuto"
														value="${minuto == 0 ? '00' : minuto}" />
													<c:set var="formattedHora"
														value="${String.format('%02d', hora)}" />
													<option value="${formattedHora}:${formattedMinuto}">${formattedHora}:${formattedMinuto}</option>
												</c:if>
											</c:forEach>
										</c:forEach>
									</optgroup>


									<!-- Tarde -->
									<optgroup label="Tarde">
										<c:forEach var="hora" begin="13" end="16" step="1">
											<c:forEach var="minuto" begin="0" end="45" step="15">
												<option value="${hora}:${minuto == 0 ? '00' : minuto}">${hora}:${minuto == 0 ? '00' : minuto}</option>
											</c:forEach>
										</c:forEach>
									</optgroup>
								</select>


							</div>
						</div>

						<div class="row mb-3">
							<label for="selectPaciente"
								class="col-sm-3 col-form-label text-end">Paciente</label>
							<div class="col-sm-9">
								<select name="selectPaciente" id="selectPaciente"
									class="form-select">
									<option disabled selected value="">Selecione</option>
									<c:choose>
										<c:when test="${not empty pacientes}">
											<c:forEach items="${pacientes}" var="paciente">
												<option value="${paciente.getId()}">${paciente.getNome()}</option>
											</c:forEach>
										</c:when>
										<c:otherwise>
											<option disabled value="">Ainda não há pacientes
												cadastrados nesse perfil</option>
										</c:otherwise>
									</c:choose>
								</select>
							</div>
						</div>

						<div class="d-grid">
							<button type="submit" class="btn btn-success">Agendar</button>
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