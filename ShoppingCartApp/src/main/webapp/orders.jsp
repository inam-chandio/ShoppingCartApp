<%@page import="com.shoppingcartapp.connection.DbCon" %>
<%@page import="com.shoppingcartapp.model.*" %>
<%@page import="java.text.DecimalFormat" %>
<%@page import="java.util.*" %>
<%@page import="com.shoppingcartapp.dao.ProductDao" %>
<%@page import="com.shoppingcartapp.dao.OrderDao" %>


<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);


User auth = (User) request.getSession().getAttribute("auth");
List<Order> orders = null;
if (auth !=null) {
	request.setAttribute("auth", auth);
	orders = new OrderDao(DbCon.getConnection()).userOrders(auth.getId());
}else {
	//response.sendRedirect("login.jsp");
}


ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
if(cart_list != null) {
	request.setAttribute("cart_list", cart_list);
}

%>    

    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Shopping Cart Application</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
</head>
<body>
<div class="container">
<%@include file="include/navbar.jsp" %>
<div class="container">
<div class="card-header my-3">All Orders</div>
	<table class="table table-light">
		<thead>
			<tr>
				<td scope="col">Date</td>
				<td scope="col">Name</td>
				<td scope="col">Category</td>
				<td scope="col">Quantity</td>
				<td scope="col">Price</td>
				<td scope="col">Cancel</td>
			</tr>
		</thead>
		<tbody>
		<%
		if(orders !=null) {
			for(Order o : orders) { %>
				<tr>
					<td><%=o.getDate() %></td>
					<td><%=o.getName() %></td>
					<td><%=o.getCategory() %></td>
					<td><%=o.getQuantity() %></td>
					<td><%=dcf.format(o.getPrice())%></td>
					<td><a class="btn btn-sm btn-danger" href="cancel-order?id=<%=o.getOrderId()%>">Cancel Order</a></td>
				</tr>
			<% }
		}
		%>
			
		
		</tbody>
		
	</table>

</div>



</div>

<%@include file="include/footer.jsp" %>
</body>
</html>