package project_cuoi_ky.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.dao.CustomerDAO;

@WebServlet("/signin")
public class SignInServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignInServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");			
		request.getRequestDispatcher("templates/sign_in.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");			
		String email = (String)request.getParameter("email");
		String password = (String)request.getParameter("password");
		
		Customer customer = CustomerDAO.checkLogin(email, password);
		if(customer == null) {
			String errorMessage = "Sai tên tài hoặc mật khẩu!";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("templates/sign_in.jsp").forward(request, response);
		}else {
			HttpSession session = request.getSession();
			session.setAttribute("user", customer);
			response.sendRedirect("home");
		}
	}

}
