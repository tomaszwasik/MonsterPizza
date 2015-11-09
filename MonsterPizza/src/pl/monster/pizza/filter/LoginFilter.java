package pl.monster.pizza.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServletRequest;

import pl.monster.pizza.model.User;
import pl.monster.pizza.service.UserService;

public class LoginFilter implements Filter {

	@Override
	public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
			throws IOException, ServletException {
		HttpServletRequest httpReq = (HttpServletRequest) request;
		if (httpReq.getUserPrincipal() != null && httpReq.getSession().getAttribute("user") == null) {
			saveUserInSession(httpReq);
		}
		chain.doFilter(request, response);
	}

	private void saveUserInSession(HttpServletRequest request) {
		UserService userService = new UserService();
		String username = request.getUserPrincipal().getName();
		User userByUsername = userService.getUserByUsername(username);
		request.getSession(true).setAttribute("user", userByUsername);
	}

	@Override
	public void init(FilterConfig filterConfig) throws ServletException {
	}

	@Override
	public void destroy() {
	}

}
