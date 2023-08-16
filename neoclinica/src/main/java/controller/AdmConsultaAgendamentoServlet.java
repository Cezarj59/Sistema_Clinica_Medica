package controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import model.agendamento.Agendamento;

//@formatter:off
@WebServlet(urlPatterns = {  
		"/admConsultarAgendamentosAbertos",
		"/admConsultarAgendamentosRealizados",
		"/admConsultarAgendamentosDia",
		"/admConsultarAgendamentosSemana",
		"/admConsultarAgendamentosPorPaciente"
})
public class AdmConsultaAgendamentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
   
    public AdmConsultaAgendamentoServlet() {
        super();
      
    }

	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String action = request.getServletPath();
		switch (action) {
		case "/admConsultarAgendamentosAbertos" -> fnc_admConsultarAgendamentosAbertos(request, response);
		case "/admConsultarAgendamentosRealizados" -> fnc_admConsultarAgendamentosRealizados(request, response);
		case "/admConsultarAgendamentosDia" -> fnc_admConsultarAgendamentosDia(request, response);
		case "/admConsultarAgendamentosSemana" -> fnc_admConsultarAgendamentosSemana(request, response);
		case "/admConsultarAgendamentosPorPaciente" -> fnc_admConsultarAgendamentosPorPaciente(request, response);
		}	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}
	//@formatter:on
	protected void fnc_admConsultarAgendamentosAbertos(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Agendamento> agendamentos = dao.AgendamentoDAO.listarAgendamentosEmAberto();

		request.setAttribute("agendamentos", agendamentos);
		request.getRequestDispatcher("adm-consultar-agendamento-todos-aberto.jsp").forward(request, response);
	}

	protected void fnc_admConsultarAgendamentosRealizados(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Agendamento> agendamentos = dao.AgendamentoDAO.listarAgendamentosRealizados();

		request.setAttribute("agendamentos", agendamentos);
		request.getRequestDispatcher("adm-consultar-agendamento-todos-realizados.jsp").forward(request, response);
	}

	protected void fnc_admConsultarAgendamentosDia(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		int diaSemana = Integer.parseInt(request.getParameter("diaSemanaSelect"));
		List<Agendamento> agendamentos = dao.AgendamentoDAO.listarAgendamentosPorDiaExame(diaSemana);

		request.setAttribute("agendamentos", agendamentos);
		request.getRequestDispatcher("adm-consultar-agendamento-dia.jsp").forward(request, response);

	}

	protected void fnc_admConsultarAgendamentosSemana(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		List<Agendamento> agendamentos = dao.AgendamentoDAO.listarAgendamentosDaSemanaAtual();

		request.setAttribute("agendamentos", agendamentos);
		request.getRequestDispatcher("adm-consultar-agendamento-semana.jsp").forward(request, response);

	}

	protected void fnc_admConsultarAgendamentosPorPaciente(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String tipoPesquisa = request.getParameter("tipoPesquisa");
		List<Agendamento> agendamentos = null;
		

		if ("porPaciente".equals(tipoPesquisa)) {
			 agendamentos = dao.AgendamentoDAO.listarAgendamentosPorPaciente(request.getParameter("nomeCpfInput"));
		} else if ("porPacienteAberto".equals(tipoPesquisa)) {
			agendamentos = dao.AgendamentoDAO.listarAgendamentosPorPacienteEmAberto(request.getParameter("nomeCpfInput"));
		} else if ("porPacienteRealizados".equals(tipoPesquisa)) {
			agendamentos = dao.AgendamentoDAO.listarAgendamentosPorPacienteRealizados(request.getParameter("nomeCpfInput"));
		}
		
		request.setAttribute("agendamentos", agendamentos);
		request.getRequestDispatcher("adm-consultar-agendamento-paciente.jsp").forward(request, response);
	}

	
}
