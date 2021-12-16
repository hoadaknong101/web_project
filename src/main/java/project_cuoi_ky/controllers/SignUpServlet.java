package project_cuoi_ky.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Customer;
import project_cuoi_ky.dao.CustomerDAO;

@WebServlet("/signup")
public class SignUpServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public SignUpServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		String errorMessage = "";
		request.setAttribute("errorMessage", errorMessage);
		request.getRequestDispatcher("templates/sign_up.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String name = (String) request.getParameter("name");
		String email = (String) request.getParameter("email");
		String phoneNumber = (String) request.getParameter("phone");
		String password = (String) request.getParameter("password");
		String passwordConfirm = (String) request.getParameter("passwordConfirm");

		Customer customer = new Customer(0, name, email, phoneNumber, password);
		int check = CustomerDAO.checkUserExist(customer);
		String errorMessage = "";
		if (password.equals(passwordConfirm) == false) {
			errorMessage = "Sai mật khẩu xác thực";
			request.setAttribute("errorMessage", errorMessage);
			request.getRequestDispatcher("templates/sign_up.jsp").forward(request, response);
		} else {
			if (check == -1) {
				errorMessage = "Email đã được sử dụng";
				request.setAttribute("errorMessage", errorMessage);
				request.getRequestDispatcher("templates/sign_up.jsp").forward(request, response);
			} else {
				if (check == 0) {
					errorMessage = "Số ĐT đã được sử dụng";
					request.setAttribute("errorMessage", errorMessage);
					request.getRequestDispatcher("templates/sign_up.jsp").forward(request, response);
				} else {
					CustomerDAO.insertCustomer(customer);
					System.out.println("Người dừng đăng ký thành công");
					System.out.println(customer.toString());
					response.sendRedirect(request.getContextPath() + "/signin");
				}
			}
		}

	}
}
