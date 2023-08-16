package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


import model.exame.Exame;
import model.medico.Medico;
import model.pessoa.Paciente;

//@formatter:off
@WebServlet(urlPatterns = { "/admConsultarTodosPacientes", 
							"/admConsultarPacientesGenero",
							"/admConsultarPacientesAniversariantes",
							"/admConsultarExames",
							"/admConsultarMedicos", 
							"/admConsultarMedicosEspecialidade"
})
public class AdmConsultarServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
  
    public AdmConsultarServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String action = request.getServletPath();
		switch (action) {
		case "/admConsultarTodosPacientes" -> fnc_admConsultarTodosPacientes(request, response);
		case "/admConsultarPacientesGenero" -> fnc_admConsultarPacientesGenero(request, response);
		case "/admConsultarPacientesAniversariantes" -> fnc_admConsultarPacientesAniversariantes(request, response);
		case "/admConsultarExames" -> fnc_admConsultarExames(request, response);
		case "/admConsultarMedicos" -> fnc_admConsultarMedicos(request, response);
		case "/admConsultarMedicosEspecialidade" -> fnc_admConsultarMedicosEspecialidade(request, response);
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	
	//@formatter:on
	protected void fnc_admConsultarTodosPacientes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Paciente> pacientes = dao.PacienteDAO.listarTodos();
		request.setAttribute("pacientes", pacientes);

		// Encaminha a requisição para a página JSP onde os pacientes serão exibidos
		request.getRequestDispatcher("adm-consultar-paciente-todos.jsp").forward(request, response);

	}

	protected void fnc_admConsultarPacientesGenero(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Paciente> pacientes = dao.PacienteDAO.buscarPacientesPorGenero(request.getParameter("generoSelect"));
		request.setAttribute("pacientes", pacientes);

		// Encaminha a requisição para a página JSP onde os pacientes serão exibidos
		request.getRequestDispatcher("adm-consultar-paciente-genero.jsp").forward(request, response);

	}

	protected void fnc_admConsultarPacientesAniversariantes(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String aniversario = "";
		List<Paciente> pacientes = null;

		if (request.getParameter("aniverSelect") != null)
			aniversario = request.getParameter("aniverSelect");

		if (aniversario.equals("dia")) {
			pacientes = dao.PacienteDAO.buscarAniversariantesDoDia();
		} else if (aniversario.equals("semana")) {
			pacientes = dao.PacienteDAO.buscarAniversariantesDaSemana();
		} else if (aniversario.equals("mes")) {
			pacientes = dao.PacienteDAO.buscarAniversariantesDoMes();
		} else {
			response.sendRedirect("adm-consultar-paciente-aniversariantes.jsp");
		}

		if (pacientes != null) {
			request.setAttribute("pacientes", pacientes);
			request.getRequestDispatcher("adm-consultar-paciente-aniversariantes.jsp").forward(request, response);
		} else {
			response.sendRedirect("adm-consultar-paciente-aniversariantes.jsp");
		}

	}

	protected void fnc_admConsultarExames(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		List<Exame> exames = dao.ExameDAO.listarTodos();

		request.setAttribute("exames", exames);
		request.getRequestDispatcher("adm-consultar-exame.jsp").forward(request, response);
	}

	protected void fnc_admConsultarMedicos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Medico> medicos = dao.MedicoDAO.listarTodos();

		request.setAttribute("medicos", medicos);
		request.getRequestDispatcher("adm-consultar-medicos-todos.jsp").forward(request, response);
	}
	
	
	
	protected void fnc_admConsultarMedicosEspecialidade(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Medico> medicos = dao.MedicoDAO.buscarMedicosPorEspecialidade(Long.parseLong(request.getParameter("selectEspecialidade")));

		request.setAttribute("medicos", medicos);
		request.getRequestDispatcher("adm-consultar-medicos-especialidade.jsp").forward(request, response);
	}

		
}
