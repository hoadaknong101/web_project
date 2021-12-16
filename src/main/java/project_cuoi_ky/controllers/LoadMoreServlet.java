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
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		request.setCharacterEncoding("UTF-8");
		String amountString = (String)request.getParameter("exist");
		int amount = Integer.parseInt(amountString);
		ArrayList<Product> listNext3Products = ProductDAO.listNext3Product(amount);
		PrintWriter out = response.getWriter();
		for (Product p : listNext3Products) {
			out.println(""
					+ "<div class=\"product col-lg-4 col-md-6 col-sm-6\">\n"
					+ "								<div class=\"product__item\">\n"
					+ "									<div class=\"product__item__pic set-bg\"\n"
					+ "										data-setbg=\"\">\n"
					+ "										<img src=\"" +p.getImagePath()+ "\" alt=\"\" style=\"width=100%; heigth:100%\">"
					+ "										<ul class=\"product__item__pic__hover\">\n"
					+ "											<li><a href=\"#\"><i class=\"fa fa-heart\"></i></a></li>\n"
					+ "											<li><a href=\"#\"><i class=\"fa fa-retweet\"></i></a></li>\n"
					+ "											<li><a href=\"addtocart?pid="+p.getId()+"\"><i\n"
					+ "													class=\"fa fa-shopping-cart\"></i></a></li>\n"
					+ "										</ul>\n"
					+ "									</div>\n"
					+ "									<div class=\"product__item__text\">\n"
					+ "										<h6>\n"
					+ "											<a href=\"chitietsanpham?pid="+p.getId()+"\">"+p.getName()+"</a>\n"
					+ "										</h6>\n"
					+ "										<h5>" + String.format("%,.0f", p.getPrice())+" VNĐ</h5>\n"
					+ "									</div>\n"
					+ "								</div>\n"
					+ "							</div>");
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
	}

}
