package project_cuoi_ky.controllers;

import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Catagory;
import project_cuoi_ky.dao.CategoryDAO;

@WebServlet("/home")
public class HomePageServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	public HomePageServlet() {
		super();
	}
 
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		ArrayList<Catagory> listCategory = new ArrayList<Catagory>();
		try {
			listCategory = CategoryDAO.listCategories();
		} catch (SQLException e) {
			e.printStackTrace();
		}
		
		request.setAttribute("listCategory", listCategory);
		request.getRequestDispatcher("WEB-INF/views/index.jsp").forward(request, response);
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		doGet(request, response);
	}

}
