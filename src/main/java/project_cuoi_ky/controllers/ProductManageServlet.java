package project_cuoi_ky.controllers;

import java.io.IOException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Product;
import project_cuoi_ky.dao.ProductDAO;


@WebServlet("/manageproduct")
public class ProductManageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public ProductManageServlet() {
        super();
        // TODO Auto-generated constructor stub
    }


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		ArrayList<Product> listProduct = ProductDAO.listProduct();
		
		request.setAttribute("listProduct",listProduct);
		request.getRequestDispatcher("templates/manage_product.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
