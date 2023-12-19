<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
    <title>About Us - Shopping Cart Application</title>
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

        .about-content {
            margin-top: 20px;
        }

        .aboutus-images {
            margin-top: 2px;
        }

        .aboutus-image {
            max-width: 100%;
            height: auto;
            border-radius: 8px;
            margin-bottom: 20px;
        }

        
    </style>
</head>
<body>
    <div class="container">
        <%@include file="include/navbar.jsp" %>

        <div class="container my-3">
            
            <h2 class="mb-4">About Us</h2>
            <div class="row about-content">
                <div class="col-md-6">
                    <p>Welcome to our Shopping Cart Application. We strive to provide the best shopping experience for our users. Our mission is to offer a wide range of quality products at affordable prices. With a user-friendly interface, we aim to make your online shopping journey enjoyable and convenient.</p>

                </div>
                <div class="col-md-6">
                    <div class="aboutus-images">
                        <img src="about-us-img (2).png" alt="About us Image" class="aboutus-image">
                       
                    </div>
                </div>
            </div>
        </div>
    </div>

    <%@include file="include/footer.jsp" %>
</body>
</html>
