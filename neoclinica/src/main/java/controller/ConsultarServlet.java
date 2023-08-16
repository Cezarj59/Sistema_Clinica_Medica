package controller;

import java.io.IOException;
import java.time.LocalDate;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.pessoa.Paciente;
import model.usuarios.Usuario;
import model.exame.Exame;
import model.medico.Medico;
import model.agendamento.Agendamento;

@WebServlet(urlPatterns = { "/consultarPacientes", "/consultarExames", "/consultarMedicos", "/consultarAgendamentos" })
public class ConsultarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ConsultarServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String action = request.getServletPath();

		switch (action) {
		case "/consultarPacientes" -> consultarPacientes(request, response);
		case "/consultarExames" -> consultarExames(request, response);
		case "/consultarMedicos" -> consultarMedicos(request, response);
		case "/consultarAgendamentos" -> consultarAgendamentos(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

	protected void consultarPacientes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// Obtém a sessão existente, se não existir, session será null
		HttpSession session = request.getSession(false);
		if (session != null) {
			// Se a sessão existe, obtém o usuário logado a partir do atributo da sessão
			Usuario usuarioLogado = (Usuario) session.getAttribute("usuarioLogado");

			// Obtém o ID do usuário logado
			Long usuarioId = (Long) usuarioLogado.getId();

			// Realiza a consulta de pacientes associados ao ID do usuário
			List<Paciente> pacientes = dao.PacienteDAO.buscarPacientesPorIdUsuario(usuarioId);

			// Define o atributo 'pacientes' no objeto 'request' para ser acessado na página
			// JSP
			request.setAttribute("pacientes", pacientes);

			// Encaminha a requisição para a página JSP onde os pacientes serão exibidos
			request.getRequestDispatcher("consultar-paciente.jsp").forward(request, response);
		} else {
			// Caso a sessão não exista, redireciona para a página de login
			response.sendRedirect("login.jsp");
		}
	}

	protected void consultarExames(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Exame> exames = dao.ExameDAO.listarTodos();

		request.setAttribute("exames", exames);
		request.getRequestDispatcher("consultar-exame.jsp").forward(request, response);
	}

	protected void consultarMedicos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		List<Medico> medicos = dao.MedicoDAO.listarTodos();

		request.setAttribute("medicos", medicos);
		request.getRequestDispatcher("consultar-medico.jsp").forward(request, response);
	}

	protected void consultarAgendamentos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		
		// LocalDate data = LocalDate.parse(request.getParameter("data"));
		List<Agendamento> agendamentos = dao.AgendamentoDAO.listarTodos();

		request.setAttribute("agendamentos", agendamentos);
		request.getRequestDispatcher("consultar-agendamento.jsp").forward(request, response);
	}
}
