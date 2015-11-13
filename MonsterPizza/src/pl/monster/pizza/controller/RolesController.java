package pl.monster.pizza.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.service.RoleService;

@WebServlet("/roles")
public class RolesController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.getRequestDispatcher("roles_console.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String roleName = request.getParameter("inputRoleName");
		String roleDescription = request.getParameter("inputRoleDescription");

		RoleService roleService = new RoleService();
		roleService.addRole(roleName, roleDescription);

		response.sendRedirect("admin_console.jsp");
	}

}
