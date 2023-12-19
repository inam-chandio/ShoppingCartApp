package com.shoppingcartapp.servlet;
import com.shoppingcartapp.model.*;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.ArrayList;
/**
 * Servlet implementation class AddToCartServlet
 */

@WebServlet("/add-to-cart")
public class AddToCartServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;


	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try(PrintWriter out  = response.getWriter()) {
			ArrayList<Cart> cartList = new ArrayList<>();
			
			int id = Integer.parseInt(request.getParameter("id"));
			Cart cm = new Cart();
			cm.setId(id);
			cm.setQuantity(1);
			
			HttpSession session = request.getSession();
			ArrayList<Cart> cart_list = (ArrayList<Cart>)session.getAttribute("cart-list");
			
			if(cart_list == null) {
				cartList.add(cm);
			session.setAttribute("cart-list", cartList);
			//out.println("session created and added to the list");
			response.sendRedirect("index.jsp");
			} else {
				//out.print("cart list exist");
				cartList = cart_list;
				
				boolean exist = false;
				
				for(Cart c : cart_list) {
					if(c.getId()==id) {
						exist = true;
						out.println("<h3 style='color:crimson, text-align:center'> Item already exists in the cart.<a href='cart.jsp'> Go To Cart Page</a></h3>");
					}
				}
				
				if(!exist) {
					cartList.add(cm);
					response.sendRedirect("index.jsp");
				}
				
			}
		}
	}

}
