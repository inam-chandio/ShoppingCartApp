package com.shoppingcartapp.servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import java.sql.SQLException;
import java.io.PrintWriter;

import com.shoppingcartapp.model.*;
import com.shoppingcartapp.dao.*;
import com.shoppingcartapp.connection.DbCon;

/**
 * Servlet implementation class LoginServlet
 */
@WebServlet("/user-login")
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.sendRedirect("login.jsp");
	}

	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		response.setContentType("text/html;charset=UTF-8");
		try (PrintWriter out = response.getWriter()) {
			String email = request.getParameter("login-email");
			String password = request.getParameter("login-password");
		try {
			UserDao udao = new UserDao(DbCon.getConnection());
			User user = udao.userLogin(email, password);
			
			if(user !=null) {
//				out.print("user login");
				request.getSession().setAttribute("auth", user);
				response.sendRedirect("index.jsp");
			} else {
				out.print("user login failed");
			}
//				System.out.print("user logged in");	 
		}catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
		
		}
	}
}
