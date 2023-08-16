<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Cadastro de Usuario</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-EVSTQN3/azprG1Anm3QDgpJLIm9Nao0Yz1ztcQTwFspd3yD65VohhpuuCOmLASjC"
	crossorigin="anonymous">

<style>
/* Estilos para o background em forma de coluna */
.background-column {
	
	backdrop-filter: blur(5px);
	z-index: -1;
}

/* Estilos para o formulário com efeito de vidro */
.custom-form {
	background-color: rgba(255, 255, 255, 0.2);
	padding: 20px;
	border-radius: 10px;
	color: #fff;
}

/* Ocupar tela inteira */
.full-height {
  min-height: 80.5vh;
  display: flex;
  flex-direction: column;
  justify-content: center;
  align-items: center;
}

/* Footer */
.footer {
  background-color: #343a40;
  color: white;
  padding: 20px 0;
  text-align: center;
}
</style>
</head>


<body class="background-column">
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
						aria-current="page" href="index.html">Home</a></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse" id="navbarNavDropdown">
				<ul class="navbar-nav ms-auto">
					<li class="nav-item"><a class="nav-link" href="cadastro-usuario.jsp">Cadastrar</a></li>
					<li class="nav-item"><a class="nav-link" href="login.html">Login</a></li>
				</ul>
			</div>
		</div>
	</nav>
	<div class="full-height">
		<div class="container">
			<div class="row justify-content-center">
				<div class="col-md-6">
					<form class="custom-form bg-dark text-light p-4 rounded" name="form-cadastro-usuario" method="POST"
						action="cadastrarUsuario">
						<fieldset>
							<!-- Form Name -->
							<legend class="text-center">Cadastre-se</legend>

							<!-- Text input-->
							<div class="mb-3">
								<label for="inputUserName" class="form-label">Username</label>
								<input type="text" class="form-control" id="inputUserName"
									name="inputUserName" placeholder="" required="">
								<div class="form-text text-light">Nome de usuário</div>
							</div>

							<!-- Text input-->
							<div class="mb-3">
								<label for="inputEmail" class="form-label">Email</label>
								<input type="email" class="form-control" id="inputEmail"
									name="inputEmail" placeholder="" required="">
								<div class="form-text text-light">user@provedor.com</div>
							</div>

							<!-- Text input-->
							<div class="mb-3">
								<label for="inputSenha" class="form-label">Senha</label>
								<input type="password" class="form-control" id="inputSenha"
									name="inputSenha" placeholder="">
								<div class="form-text text-light">password</div>
							</div>

							<div class="d-grid">
								<button type="submit" class="btn btn-success">Cadastrar</button>
							</div>
						</fieldset>
					</form>
				</div>
			</div>
		</div>
	</div>

	<footer class="footer bg-dark text-light text-center py-4">
		<div class="container">
			<p>&copy; 2023 Neo Clínica. Todos os direitos reservados.</p>
			<p>
				Desenvolvido por <a href="#">Seu Nome</a>
			</p>
		</div>
	</footer>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-MrcW6ZMFYlzcLA8Nl+NtUVF0sA7MsXsP1UyJoMp4YLEuNSfAP+JcXn/tWtIaxVXM"
		crossorigin="anonymous"></script>
</body>