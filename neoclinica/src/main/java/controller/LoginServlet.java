package controller;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.pessoa.Administrador;
import model.usuarios.Usuario;

@WebServlet(urlPatterns = { "/loginAdm", "/loginUsuario" })
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public LoginServlet() {
		super();

	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.getWriter().append("Served at: ").append(request.getContextPath());

		String action = request.getServletPath();// pegando rota do servlet

		switch (action) {
		case "/loginAdm" -> fcn_loginAdm(request, response);
		case "/loginUsuario" -> fcn_loginUsuario(request, response);
		}
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

	protected void fcn_loginAdm(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	
		String login = request.getParameter("inputUsernameOrEmail");
		String senha = request.getParameter("inputSenha");

		// Buscar o administrador pelo email ou username
		Administrador admin = dao.AdministradorDAO.buscarAdministradorPorEmailOuUsername(login);

		if (admin != null && senha.equals(admin.getSenha())) {
		    // Se o administrador for encontrado e a senha estiver correta, armazena o objeto Administrador na sessão HTTP
		    HttpSession session = request.getSession();
		    session.setAttribute("admLogado", admin);
		    response.sendRedirect("adm-index.jsp");
		} else {
		    // Se o administrador não for encontrado ou a senha estiver incorreta, redireciona para a página de erro404
		    response.sendRedirect("erro404.html");
		}

		
	}

	protected void fcn_loginUsuario(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		String login = request.getParameter("inputUsernameOrEmail");
		String senha = request.getParameter("inputSenha");

		Usuario user = dao.UsuarioDAO.buscarUsuarioPorEmailOuUsername(login);

		if (user != null && senha.equals(user.getSenha())) {
		    // Se o usuário for encontrado e a senha estiver correta, armazena o objeto Usuario na sessão HTTP
			HttpSession session = request.getSession(true);
		    session.setAttribute("usuarioLogado", user);
		    response.sendRedirect("usuario-index.jsp");
		} else {
		    // Se o usuário não for encontrado ou a senha estiver incorreta, redireciona para a página de cadastro-usuario
		    response.sendRedirect("cadastro-usuario.jsp");
		}

}}
