package project_cuoi_ky.controllers;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.Product;
import project_cuoi_ky.dao.ProductDAO;

/**
 * Servlet implementation class LoadMoreServlet
 */
@WebServlet("/loadmore")
public class LoadMoreServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public LoadMoreServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		ArrayList<Product> listNext3Products = ProductDAO.listNext3Product(3);
		PrintWriter out = response.getWriter();
		for(Product p : listNext3Products) {
			out.println("<div class=\"col-lg-4 col-md-6 col-sm-6\">\r\n"
					+ "								<div class=\"product__item\">\r\n"
					+ "									<div class=\"product__item__pic set-bg\"\r\n"
					+ "										data-setbg=\""+p.getImagePath()+"\">\r\n"
					+ "										<ul class=\"product__item__pic__hover\">\r\n"
					+ "											<li><a href=\"#\"><i class=\"fa fa-heart\"></i></a></li>\r\n"
					+ "											<li><a href=\"#\"><i class=\"fa fa-retweet\"></i></a></li>\r\n"
					+ "											<li><a href=\"#\"><i class=\"fa fa-shopping-cart\"></i></a></li>\r\n"
					+ "										</ul>\r\n"
					+ "									</div>\r\n"
					+ "									<div class=\"product__item__text\">\r\n"
					+ "										<h6>\r\n"
					+ "											<a href=\"chitietsanpham?pid="+p.getId()+"\">"+p.getName()+"</a>\r\n"
					+ "										</h6>\r\n"
					+ "										<h5>"+p.getPrice()+"VNĐ</h5>\r\n"
					+ "									</div>\r\n"
					+ "								</div>\r\n"
					+ "							</div>");
		}
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
