package project_cuoi_ky.controllers;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import project_cuoi_ky.beans.OrderDetail;
import project_cuoi_ky.dao.OrderDetailsDAO;

@WebServlet("/decreasequantity")
public class DecreaseQuantityServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

    public DecreaseQuantityServlet() {
        super();
    }

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		int id = Integer.parseInt((String) request.getParameter("id"));
		OrderDetail o = OrderDetailsDAO.getOrderDetailByID(id);
		o.setQuantity(o.getQuantity() - 1);
		OrderDetailsDAO.updateOrderDetails(o);
		response.sendRedirect(request.getContextPath() + "/shoppingcart");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		doGet(request, response);
	}

}
