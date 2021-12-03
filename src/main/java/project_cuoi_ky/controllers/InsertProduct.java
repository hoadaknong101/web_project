package project_cuoi_ky.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Product;
import project_cuoi_ky.dao.ProductDAO;

/**
 * Servlet implementation class InsertProduct
 */
@WebServlet("/insertproduct")
public class InsertProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public InsertProduct() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String name = request.getParameter("name");
		float price = Float.parseFloat(request.getParameter("price"));
		String imagePath = request.getParameter("imagePath");
		String description = request.getParameter("description");
		int quantity = Integer.parseInt(request.getParameter("quantity"));
		int categoryID = Integer.parseInt(request.getParameter("category"));

		Product product = new Product(1, name, price, imagePath, description, quantity, categoryID);
		ProductDAO.insertProduct(product);

		response.sendRedirect(request.getContextPath() +"/manageproduct");
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
