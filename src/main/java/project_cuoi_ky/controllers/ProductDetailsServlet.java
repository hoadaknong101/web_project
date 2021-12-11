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
 * Servlet implementation class ProductDetailsServlet
 */
@WebServlet("/chitietsanpham")
public class ProductDetailsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    private int id;
   
    public ProductDetailsServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		id = Integer.parseInt(request.getParameter("pid"));
		Product product = ProductDAO.findProductByID(id);
		
		ArrayList<Product> relatedProducts = ProductDAO.relatedProducts(product);
		
		request.setAttribute("p", product);
		request.setAttribute("relatedProducts", relatedProducts);
		
		ArrayList<Catagory> listCategory = new ArrayList<Catagory>();
		listCategory = CategoryDAO.listCategories();
		request.setAttribute("listCategory", listCategory);
		
		
		request.getRequestDispatcher("templates/product_details.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
