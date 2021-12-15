package project_cuoi_ky.controllers;
import java.nio.charset.StandardCharsets;

import java.io.IOException;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import project_cuoi_ky.beans.Order;
import project_cuoi_ky.beans.OrderDetail;
import project_cuoi_ky.dao.OrderDetailsDAO;
import project_cuoi_ky.dbcontext.Config;

@WebServlet("/checkout")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private String id;

	public CheckOutServlet() {
		super();
	}

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;UTF-8");
		request.setCharacterEncoding("UTF-8");
		StandardCharsets.UTF_8.name();
		id = (String) request.getParameter("oid");
		ArrayList<OrderDetail> tmp = OrderDetailsDAO.listByID(id);
		HttpSession sesion = request.getSession();
		Order o = (Order) sesion.getAttribute("order");
		if (o.getId() == null || tmp.size() ==0) {
			response.sendRedirect(request.getContextPath() + "/error");
		} else {
			request.getRequestDispatcher("templates/check_out.jsp").forward(request, response);
		}

	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;UTF-8");
		request.setCharacterEncoding("UTF-8");
		StandardCharsets.UTF_8.name();
		String oid = id;
		ArrayList<OrderDetail> tmp = OrderDetailsDAO.listByID(oid);
		if (tmp.size() == 0) {
			response.sendRedirect(request.getContextPath() + "/error");
		} else {
			String name = request.getParameter("name");
			String email = request.getParameter("email");
			String address = request.getParameter("address");
			String phone = request.getParameter("phone");
			System.out.println("ID order = " + oid);

			System.out.println("Số sản phẩm = " + tmp.size());
			String subject = "ĐƠN HÀNG - VPP";
			String body = "Đơn hàng của quý khách gồm:\n";
			int stt = 1;
			for (OrderDetail x : tmp) {
				body += stt + "." + x.getName() + "     Số lượng:" + x.getQuantity() + "     Đơn Giá: " + x.getPrice()+" VNĐ"
						+ "     Thành tiền: " + (x.getPrice() * x.getQuantity()) + " VNĐ\n";
				stt++;
			}
			body += "Thông tin giao hàng:\n" + 
					"Họ tên người nhận: " + name + "\n" + 
					"Email: " + email + "\n"+ 
					"Địa chỉ: " + address + "\n" + 
					"Số điện thoại: " + phone;

			sendFromGMail(Config.USER_NAME, Config.PASSWORD_GMAIL, email, subject, body);
			System.out.println("Sent mail succesfully!");
			OrderDetailsDAO.deleteOrderDetails(oid);
			System.out.println("Removed product successfully!");
			response.sendRedirect(request.getContextPath() + "/home");
		}

	}

	public static void sendFromGMail(String from, String pass, String to, String subject, String body) {
		System.out.println("Starting...");
		Properties props = new Properties();
		String host = "smtp.gmail.com";
		props.put("mail.smtp.starttls.enable", "true");
		props.put("mail.smtp.host", host);
		props.put("mail.smtp.port", "587");
		props.put("mail.smtp.auth", "true");

		Session session = Session.getInstance(props, new Authenticator() {
			@Override
			protected PasswordAuthentication getPasswordAuthentication() {
				return new PasswordAuthentication(Config.USER_NAME, Config.PASSWORD_GMAIL);
			}
		});

		Message message = prepareMessage(session, to, subject, body);

		try {
			Transport.send(message);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	public static Message prepareMessage(Session session, String to, String subject, String body) {
		Message message = new MimeMessage(session);
		try {
			message.setFrom(new InternetAddress(Config.USER_NAME));
			message.setRecipient(Message.RecipientType.TO, new InternetAddress(to));
			message.setSubject(subject);
			message.setText(body);
			return message;
		} catch (AddressException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		}
		return null;
	}
}
