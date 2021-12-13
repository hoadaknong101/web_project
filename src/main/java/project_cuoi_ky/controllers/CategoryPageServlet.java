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

/**
 * Servlet implementation class CategoryPageServlet
 */
@WebServlet("/category")
public class CategoryPageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CategoryPageServlet() {
        super();
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt(request.getParameter("cid"));
		request.setCharacterEncoding("UTF-8");
		ArrayList<Product> listProducts = ProductDAO.listProductByCategory(id);
		
		ArrayList<Catagory> listCategory = CategoryDAO.listCategories();
		Catagory category = CategoryDAO.findCatagory(id);
		
		request.setAttribute("listCategory", listCategory);
		request.setAttribute("listProducts", listProducts);
		request.setAttribute("category", category);
		request.getRequestDispatcher("templates/category_page.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
