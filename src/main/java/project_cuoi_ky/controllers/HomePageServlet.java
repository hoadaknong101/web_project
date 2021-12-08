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

@WebServlet(urlPatterns = {"/"})
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomePageServlet() {
		super();
	}
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		ArrayList<Catagory> listCategory = new ArrayList<Catagory>();
		listCategory = CategoryDAO.listCategories();
		request.setAttribute("listCategory", listCategory);
		
		
		ArrayList<Product> featuredProducts = new ArrayList<Product>();
		featuredProducts = ProductDAO.featuredProducts();
		request.setAttribute("featuredProducts", featuredProducts);
		
		
		request.getRequestDispatcher("templates/index.jsp").forward(request, response);
		
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
