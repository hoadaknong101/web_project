package project_cuoi_ky.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Catagory;
import project_cuoi_ky.dao.CategoryDAO;

/**
 * Servlet implementation class EditCategoryServlet
 */
@WebServlet("/editcategory")
public class EditCategoryServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
    int id;   
    /**
     * @see HttpServlet#HttpServlet()
     */
    public EditCategoryServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		id = Integer.parseInt(request.getParameter("cid"));
		
		Catagory category = CategoryDAO.findCatagory(id);
		request.setAttribute("c", category);
		
		request.getRequestDispatcher("templates/edit_category.jsp").forward(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		request.setCharacterEncoding("UTF-8");
		String name = request.getParameter("name");
		
		Catagory catagory = new Catagory(id,name);
		CategoryDAO.updateCategory(catagory);
		
		response.sendRedirect(request.getContextPath() + "/managecategory");
	}

}
