package com.shoppingcartapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.shoppingcartapp.connection.DbCon;
import com.shoppingcartapp.dao.OrderDao;
import com.shoppingcartapp.model.Cart;
import com.shoppingcartapp.model.Order;
import com.shoppingcartapp.model.User;

import java.util.*;

@WebServlet("/cart-check-out")
public class CheckOutServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	    try (PrintWriter out = response.getWriter()) {
	        // Set buffer size
	        response.setBufferSize(10 * 1024);

	        SimpleDateFormat formatter = new SimpleDateFormat("yyyy-MM-dd");
	        Date date = new Date();

	        ArrayList<Cart> cart_list = (ArrayList<Cart>) request.getSession().getAttribute("cart-list");

	        User auth = (User) request.getSession().getAttribute("auth");

	        if (cart_list != null && auth != null) {
	            for (Cart c : cart_list) {
	                Order order = new Order();
	                order.setId(c.getId());
	                order.setUid(auth.getId());
	                order.setQuantity(c.getQuantity());
	                order.setDate(formatter.format(date));

	                OrderDao oDao = new OrderDao(DbCon.getConnection());
	                boolean result = oDao.insertOrder(order);
	                if (!result) break;
	            }
	            cart_list.clear();
	            
	            if (!response.isCommitted()) {
	                response.sendRedirect("orders.jsp");
	            }

	        } else {
	            if (auth == null) {
	                
	                if (!response.isCommitted()) {
	                    response.sendRedirect("login.jsp");
	                }
	            }
	           
	            if (!response.isCommitted()) {
	                response.sendRedirect("cart.jsp");
	            }
	        }

	    } catch (ClassNotFoundException | SQLException e) {
	        e.printStackTrace();
	    }
	}



	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		doGet(request, response);
	}

}
