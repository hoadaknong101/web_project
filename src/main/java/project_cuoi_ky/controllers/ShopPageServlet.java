package project_cuoi_ky.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Catagory;
import project_cuoi_ky.beans.Product;
import project_cuoi_ky.dao.CategoryDAO;
import project_cuoi_ky.dao.ProductDAO;

@WebServlet("/shop")
public class ShopPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public ShopPageServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		ArrayList<Catagory> listCategory = new ArrayList<Catagory>();
		listCategory = CategoryDAO.listCategories();
		request.setAttribute("listCategory", listCategory);

		ArrayList<Product> listProducts = new ArrayList<Product>();
		listProducts = ProductDAO.listTop9Product();
		request.setAttribute("listProducts", listProducts);

		request.getRequestDispatcher("templates/shop.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
