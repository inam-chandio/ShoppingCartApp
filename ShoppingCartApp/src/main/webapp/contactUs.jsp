<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>Contact Us - Shopping Cart Application</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.2/css/all.min.css">
   
    <style type="text/css">
        
        body {
            background-color: #f8f9fa;
        }

        .container {
            background-color: #ffffff;
            border-radius: 8px;
            margin-top: 20px;
            padding: 20px;
        }

        h2 {
            color: #007bff;
        }

        p {
            color: #6c757d;
        }

        .contact-info {
            margin-top: 20px;
        }

        .contact-info i {
            margin-right: 10px;
        }
		.contactus {
			margin: auto 0;
		}
        
    </style>
</head>
<body>
    <div class="container">
        <%@include file="include/navbar.jsp" %>

        <div class="container my-3">
            
            <h2 class="contactus" >Contact Us</h2>
            <p>Feel free to reach out to us for any inquiries or assistance.</p>
            <div class="contact-info">
                <p><i class="fas fa-phone"></i> Phone: +1234567890</p>
                <p><i class="fas fa-envelope"></i> Email: info@example.com</p>

                
                <p><i class="fab fa-facebook"></i> <a href="#">Facebook</a></p>
                <p><i class="fab fa-twitter"></i> <a href="#">Twitter</a></p>
                <p><i class="fab fa-instagram"></i> <a href="#">Instagram</a></p>
                
            </div>
        </div>
    </div>

    <%@include file="include/footer.jsp" %>
</body>
</html>
