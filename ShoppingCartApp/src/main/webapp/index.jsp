<%@page import="com.shoppingcartapp.connection.DbCon" %>
<%@page import="com.shoppingcartapp.model.*" %>
<%@page import="com.shoppingcartapp.dao.ProductDao" %>
<%@page import="java.util.*" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%

ProductDao pd = new ProductDao(DbCon.getConnection());
List<Product> products = pd.getAllProducts();

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
		<div class="card-header my-3">All Products</div>
			<div class="row">
			<%
			if(!products.isEmpty()) {
				for(Product p:products) { %>
					<div class="col-md-3 my-3">
					<div class="card w-100" style="width: 18rem;">
					  <img src="product-images/<%= p.getImage() %>" class="card-img-top" alt="...">
					  <div class="card-body">
					    <h5 class="card-title"><%= p.getName() %></h5>
					    <h6 class="price">Price: $<%= p.getPrice() %></h6>
					    <h6 class="category">Category: <%= p.getCategory() %></h6>
					    <div class="mt-3 d-flex justify-content-between">
					    	<a href="add-to-cart?id=<%=p.getId() %>" class="btn btn-dark">Add to Cart</a>
					    	<a href="order-now?quantity=1&id=<%=p.getId() %>" class="btn btn-primary">Buy Now</a>
					    </div>
					  </div>
					</div>
				</div>
					
				<%}
			}
			%>
				
			</div>
	</div>
</div>


<%@include file="include/footer.jsp" %>
</body>
</html>