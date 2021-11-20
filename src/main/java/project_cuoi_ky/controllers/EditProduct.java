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
 * Servlet implementation class EditProduct
 */
@WebServlet("/editproduct")
public class EditProduct extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	int id;

	public EditProduct() {
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
		id = Integer.parseInt(request.getParameter("pid"));
		Product p = ProductDAO.findProductByID(id);
		request.setAttribute("p", p);

		request.getRequestDispatcher("WEB-INF/views/edit_product.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String name = (String) request.getParameter("name");
		float price = Float.parseFloat((String) request.getParameter("price"));
		String imagePath = (String) request.getParameter("imagePath");
		String description = (String) request.getParameter("description");
		int quantity = Integer.parseInt((String) request.getParameter("quantity"));
		int category = Integer.parseInt((String) request.getParameter("category"));

		Product product = new Product(id, name, price, imagePath, description, quantity, category);
		ProductDAO.updateProduct(product);
		response.sendRedirect(request.getContextPath() + "/manageproduct");
	}

}
