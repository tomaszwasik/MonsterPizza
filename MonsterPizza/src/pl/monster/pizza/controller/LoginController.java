package pl.monster.pizza.controller;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import pl.monster.pizza.model.User;
import pl.monster.pizza.service.UserService;

@WebServlet("/login")
public class LoginController extends HttpServlet {
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		request.setCharacterEncoding("UTF-8");

		String username = request.getParameter("inputUsername");
		String password = request.getParameter("inputPassword");

		UserService userService = new UserService();

		User user = userService.getUserByUsername(username);

		if (user != null && user.getUsername().equals(username) && user.getPassword().equals(password)) {
			request.getSession().setAttribute("user", user);

			if ("cook".equals(user.getRole())) {
				response.sendRedirect("cook_console.jsp");
			} else if ("manager".equals(user.getRole())) {
				response.sendRedirect("manager_console.jsp");
			} else if ("pizzerman".equals(user.getRole())) {
				response.sendRedirect("pizzermanOrder");
			}else if ("deliverer".equals(user.getRole())) {
				response.sendRedirect("deliverer");
			} else if ("admin".equals(user.getRole())) {
				response.sendRedirect("admin_console.jsp");
			}
		} else {
			request.getSession().removeAttribute("user");
			response.sendRedirect("login.jsp");
		}
	}
}
