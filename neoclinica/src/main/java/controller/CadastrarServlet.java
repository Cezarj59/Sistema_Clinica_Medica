package controller;

import java.io.IOException;
import java.math.BigDecimal;
import java.net.URLEncoder;
import java.time.LocalDate;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.EspecialidadeDAO;
import dao.UsuarioDAO;
import model.especialidade.Especialidade;
import model.exame.Exame;
import model.medico.Medico;
import model.pessoa.Administrador;
import model.pessoa.Paciente;
import model.usuarios.Usuario;

//@formatter:off
@WebServlet(urlPatterns = { 
		"/cadastrarAdministrador", 
		"/cadastrarUsuario",
		"/cadastrarPaciente",
		"/cadastrarEspecialidade",
		"/cadastrarMedico", 
		"/cadastrarExame" 
})

//@formatter:on
public class CadastrarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public CadastrarServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getServletPath();// pegando rota do servlet

		switch (action) {
		case "/cadastrarAdministrador" -> fcn_cadastrarAdministrador(request, response);
		case "/cadastrarUsuario" -> fcn_cadastrarUsuario(request, response);
		case "/cadastrarPaciente" -> fcn_cadastrarPaciente(request, response);
		case "/cadastrarEspecialidade" -> fcn_cadastrarEspecialidade(request, response);
		case "/cadastrarMedico" -> fcn_cadastrarMedico(request, response);
		case "/cadastrarExame" -> fcn_cadastrarExame(request, response);

		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void fcn_cadastrarAdministrador(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String dataString = request.getParameter("inputNascimento");

		LocalDate dataNascimento = util.DataUtils.validarData(dataString);

		//@formatter:off
		Administrador adm = new Administrador(request.getParameter("inputNome"),
											  dataNascimento,
											  request.getParameter("inputCpf"),
											  request.getParameter("inputTelefone"),
											  request.getParameter("inputEmail"),
											  request.getParameter("inputUserName"),
											  request.getParameter("inputSenha"));

		if (dao.AdministradorDAO.salvar(adm))
			response.sendRedirect("cadastro-adm.jsp");
		else
			response.sendRedirect("erro404.html");

	}

	protected void fcn_cadastrarUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		request.setCharacterEncoding("UTF-8");
		Usuario usuario = new Usuario( request.getParameter("inputUserName"),
									   request.getParameter("inputEmail"),
									   request.getParameter("inputSenha"));
		
		
		if (dao.UsuarioDAO.salvar(usuario))
			response.sendRedirect("cadastro-usuario.jsp");
		else
			response.sendRedirect("erro404.html");
		
	}
	
	//@formatter:off
	protected void fcn_cadastrarPaciente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		String referencia = request.getHeader("usuario-index.jsp");
		
		HttpSession session = request.getSession(false);
		if (session != null) {
			// Se a sessão existe, obtém o usuário logado a partir do atributo da sessão
			Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

		
			String nome = request.getParameter("inputNome");
			LocalDate data = LocalDate.parse(request.getParameter("inputNascimento"));
			String cpf = request.getParameter("inputCpf");
			String telefone = request.getParameter("inputTelefone");
			String email = request.getParameter("inputEmail");
			Usuario usuario = UsuarioDAO.buscarPorId(usuarioLogado.getId());
			String genero = request.getParameter("selectGenero");
			BigDecimal peso = new BigDecimal(request.getParameter("inputPeso"));
			BigDecimal altura = new BigDecimal(request.getParameter("inputAltura"));

			Paciente paciente = new Paciente(nome, data, cpf, telefone, email, usuario, genero, peso, altura);

			if (dao.PacienteDAO.salvar(paciente))
				response.sendRedirect("sucesso.jsp?desc=cadastrar+paciente&redirectURL=" + URLEncoder.encode("usuario-index.jsp", "UTF-8"));
				
			else
				response.sendRedirect("erro404.html");
		} else {
			// Caso a sessão não exista, redireciona para a página de login
			response.sendRedirect("login.jsp");
		}
	}

	protected void fcn_cadastrarEspecialidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Especialidade esp = new Especialidade(request.getParameter("inputNome"));

		if (dao.EspecialidadeDAO.salvar(esp))
			response.sendRedirect("cadastro-especialidade.jsp");
		else
			response.sendRedirect("erro404.html");
	}

	//@formatter:off
	protected void fcn_cadastrarMedico(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		new dao.EspecialidadeDAO();
		Especialidade especialidade = EspecialidadeDAO.buscarPorId(Long.parseLong(request.getParameter("selectEspecialidade")));

		Medico med = new Medico(request.getParameter("inputNome"), request.getParameter("inputCrm"), especialidade);

		if (dao.MedicoDAO.salvar(med))
			response.sendRedirect("cadastro-medico.jsp");
		else
			response.sendRedirect("erro404.html");

	}

	protected void fcn_cadastrarExame(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		new dao.EspecialidadeDAO();
		Especialidade especialidade = EspecialidadeDAO.buscarPorId(Long.parseLong(request.getParameter("selectEspecialidade")));
		int diaSemana = Integer.parseInt(request.getParameter("selectDiaSemana"));
		
		Exame exm = new Exame(diaSemana, request.getParameter("inputNome"), especialidade);

		if (dao.ExameDAO.salvar(exm))
			response.sendRedirect("cadastro-exame.jsp");
		else
			response.sendRedirect("erro404.html");
	}

}
