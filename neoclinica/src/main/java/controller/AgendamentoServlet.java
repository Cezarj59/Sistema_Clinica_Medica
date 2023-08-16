package controller;

import java.io.IOException;
import java.net.URLEncoder;
import java.time.LocalDate;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import dao.AgendamentoDAO;
import dao.ExameDAO;
import dao.MedicoDAO;
import dao.MedicosExamesDAO;
import dao.PacienteDAO;
import model.agendamento.Agendamento;
import model.exame.Exame;
import model.medico.Medico;
import model.medicosExames.MedicosExames;
import model.pessoa.Paciente;

@WebServlet(urlPatterns = { "/agendamentoInicioServlet", "/agendamentoFimServlet" })
public class AgendamentoServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public AgendamentoServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getServletPath();// pegando rota do servlet

		switch (action) {
		case "/agendamentoInicioServlet" -> fcn_agendamentoInicio(request, response);
		case "/agendamentoFimServlet" -> fcn_agendamentoFim(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		doGet(request, response);
	}

	protected void fcn_agendamentoInicio(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");
		Medico medico = MedicoDAO.buscarPorId(Long.parseLong(request.getParameter("selectMedico")));
		Exame exame = ExameDAO.buscarPorId(Long.parseLong(request.getParameter("selectExame")));

		MedicosExames medicosExames = new MedicosExames(medico, exame);


		if (dao.MedicosExamesDAO.salvar(medicosExames)) {
			// Obtém a sessão atual
			HttpSession session = request.getSession();
			// Define o objeto medicosExames na sessão
			session.setAttribute("medicosExames", medicosExames);
			response.sendRedirect("agendamento-fim.jsp");

		} else {
			response.sendRedirect("erro404.jsp");
		}

	}

	protected void fcn_agendamentoFim(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

    HttpSession session = request.getSession();
    MedicosExames medicosExames = (MedicosExames) session.getAttribute("medicosExames");

    DateTimeFormatter formatter = DateTimeFormatter.ofPattern("HH:mm");
    LocalTime hora = LocalTime.parse(request.getParameter("selectHorario"), formatter);
    LocalDate data = LocalDate.parse(request.getParameter("inputData"));

    Paciente paciente = PacienteDAO.buscarPorId(Long.parseLong(request.getParameter("selectPaciente")));

    List<Agendamento> pacienteAgendado = AgendamentoDAO.listarAgendamentosPorPaciente(paciente);
    
    for (Agendamento agendamentoExistente : pacienteAgendado) {
        // Verifique se o agendamento existente tem a mesma data e o mesmo exame
        if (agendamentoExistente.getData().equals(data) &&
            agendamentoExistente.getMedicosExames().getExame().getId().equals(medicosExames.getExame().getId())) {
            // Conflito de agendamento detectado, trate o erro aqui
            response.sendRedirect("agendamento-fim.jsp");
            
            // Como há um conflito, exclua os detalhes do exame da sessão
            dao.MedicosExamesDAO.excluir(medicosExames);
            
            // Retorne imediatamente para evitar criar um novo agendamento com conflito
            return; // Isso encerrará o loop e a função
        }
    }

    // Se não houver conflito de agendamento, crie um novo agendamento
    Agendamento agendamento = new Agendamento(data, hora, paciente, medicosExames);

    if (dao.AgendamentoDAO.salvar(agendamento)) {
        // A operação de salvar foi bem-sucedida, remova os detalhes do exame da sessão
        session.removeAttribute("medicosExames");
        
        // Redirecione para a página de índice do usuário
        response.sendRedirect("sucesso.jsp?desc=agendar+consulta&redirectURL=" + URLEncoder.encode("usuario-index.jsp", "UTF-8"));		
    } else {
        // A operação de salvar falhou, você pode querer lidar com isso de forma mais robusta
        response.sendRedirect("erro404.html");
    }

}


}
