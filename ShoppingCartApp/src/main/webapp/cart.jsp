<%@page import="com.shoppingcartapp.connection.DbCon" %>
<%@page import="com.shoppingcartapp.model.*" %>
<%@page import="java.util.*" %>
<%@page import="com.shoppingcartapp.dao.*" %>
<%@page import="java.text.DecimalFormat" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%

DecimalFormat dcf = new DecimalFormat("#.##");
request.setAttribute("dcf", dcf);


User auth = (User) request.getSession().getAttribute("auth");
if (auth !=null) {
	response.sendRedirect("index.jsp");
}

ArrayList<Cart> cart_list = (ArrayList<Cart>) session.getAttribute("cart-list");
List<Cart> cartProduct = null;
if(cart_list != null) {
	ProductDao pDao = new ProductDao(DbCon.getConnection());
	cartProduct = pDao.getCartProducts(cart_list);
	double total = pDao.getTotalCartPrice(cart_list);
	request.setAttribute("cart_list", cart_list);
	request.setAttribute("total", total);
}

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<title>Shopping Cart Application</title>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">

<style type="text/css">
.table tbody td {
	vertical-align: middle;
}

.btn-incre, .btn-decre {
	box-shadow: none;
	font-size: 25px;
}
</style>



</head>
<body>
<div class="container">
<%@include file="include/navbar.jsp" %>
<div class="container my-3">

	<div class="d-flex py-3">
		<h3>Total Price: $${(total>0)?dcf.format(total):0}</h3>
		<a class="mx-3 btn btn-primary" href="cart-check-out">Check Out</a>
	</div>
		<table class="table table-light">
		<thead>
			<tr>
			<th scope="col">Name</th>
			<th scope="col">Category</th>
			<th scope="col">Price</th>
			<th scope="col">Buy Now</th>
			<th scope="col">Cancel</th>
			
			</tr>
		</thead>
		
		<tbody>
		<%
		if(cart_list != null) {
			for(Cart c : cartProduct) { %>
				<tr>
				<td><%= c.getName() %></td>
				<td><%= c.getCategory() %></td>
				<td><%= c.getPrice() %></td>
				<td>
				<form action="order-now" method="post" class="form-inline">
					<input type="hidden" name="id" value="<%= c.getId() %>" class="form-input">
					<div class="form-group d-flex justify-content-between w-50">
						<a class="btn btn-sm btn-decre" href="quantity-inc-dec?action=dec&id=<%= c.getId() %>"><i class="fas fa-minus-square"></i></a>
						<input type="text" name="quantity" class="form-control w-50" value="<%= c.getQuantity() %>" readonly>
						<a class="btn btn-sm btn-incre" href="quantity-inc-dec?action=inc&id=<%= c.getId() %>"><i class="fas fa-plus-square"></i></a>
					
					</div>
					<button type="submit" class="btn btn-primary btn-sm">Buy</button>
				</form>
					</td>
					<td><a class="btn btn-sm btn-danger" href="remove-from-cart?id=<%=c.getId()%>">Remove</a></td>
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