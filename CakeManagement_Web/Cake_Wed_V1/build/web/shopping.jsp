<%-- 
    Document   : Shopping
    Created on : 07-03-2025, 16:06:52
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./avatar.png"> 
    <title>Cake Shopping 🎂</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #fff5f5;
            padding: 20px;
            background-image: linear-gradient(to bottom right, #fff5f5, #ffeef1);
            min-height: 100vh;
        }
        
        .container {
            max-width: 1200px;
            margin: 0 auto;
        }
        
        .header {
            text-align: center;
            margin-bottom: 30px;
            padding: 20px;
            background-color: white;
            border-radius: 15px;
            box-shadow: 0 4px 15px rgba(255, 182, 193, 0.2);
            border: 1px solid rgba(255, 182, 193, 0.3);
        }
        
        .header h1 {
            color: #e68a9f;
            font-size: 28px;
            margin-bottom: 10px;
            position: relative;
            display: inline-block;
        }
        
        .header h1::before, .header h1::after {
            content: "🧁";
            font-size: 24px;
            margin: 0 15px;
            vertical-align: middle;
        }
        
        .quick-order {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(255, 182, 193, 0.2);
            border: 1px solid rgba(255, 182, 193, 0.3);
        }
        
        .quick-order h2 {
            color: #d97a8f;
            font-size: 20px;
            margin-bottom: 15px;
        }
        
        .quick-order-form {
            display: flex;
            flex-wrap: wrap;
            gap: 15px;
            align-items: center;
        }
        
        .form-group {
            flex: 1;
            min-width: 200px;
        }
        
        .form-group label {
            display: block;
            margin-bottom: 8px;
            color: #b18597;
            font-weight: 500;
            font-size: 14px;
        }
        
        select, input[type="number"] {
            width: 100%;
            padding: 12px 15px;
            border: 1px solid #ffd6de;
            border-radius: 10px;
            font-size: 14px;
            background-color: #fffbfc;
        }
        
        select:focus, input[type="number"]:focus {
            border-color: #e68a9f;
            outline: none;
            box-shadow: 0 0 0 3px rgba(230, 138, 159, 0.1);
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 10px;
        }
        
        .button {
            padding: 12px 20px;
            border: none;
            border-radius: 10px;
            font-size: 15px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        
        .primary-button {
            background-color: #e68a9f;
            color: white;
        }
        
        .primary-button:hover {
            background-color: #d97a8f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(230, 138, 159, 0.2);
        }
        
        .secondary-button {
            background-color: #fff5f7;
            color: #b18597;
            border: 1px solid #ffd6de;
        }
        
        .secondary-button:hover {
            background-color: #ffeef1;
            transform: translateY(-2px);
        }
        
        .product-grid {
            display: grid;
            grid-template-columns: repeat(auto-fill, minmax(280px, 1fr));
            gap: 25px;
            margin-top: 30px;
        }
        
        .product-card {
            background-color: white;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 15px rgba(255, 182, 193, 0.2);
            border: 1px solid rgba(255, 182, 193, 0.3);
            transition: transform 0.3s;
            display: flex;
            flex-direction: column;
        }
        
        .product-card:hover {
            transform: translateY(-5px);
        }
        
        /* Enlarged product image */
        .product-image {
            height: 250px; /* Increased height */
            width: 100%;
            background-color: #ffd6de;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 80px;
            overflow: hidden;
            flex-grow: 1;
        }
        
        .product-image img {
            width: 100%;
            height: 100%;
            object-fit: cover;
        }
        
        /* More compact product info */
        .product-info {
            padding: 15px;
            background-color: rgba(255, 255, 255, 0.95);
        }
        
        .product-name {
            color: #d97a8f;
            font-size: 16px;
            margin-bottom: 5px;
            font-weight: 600;
            white-space: nowrap;
            overflow: hidden;
            text-overflow: ellipsis;
        }
        
        .product-price {
            color: #e68a9f;
            font-size: 18px;
            font-weight: 700;
            margin-bottom: 10px;
        }
        
        /* Horizontal layout for quantity and button */
        .product-form {
            margin-top: 10px;
        }
        
        .product-form-row {
            display: flex;
            align-items: center;
            gap: 10px;
        }
        
        .quantity-input {
            flex: 0 0 80px;
        }
        
        .quantity-input input[type="number"] {
            padding: 8px 10px;
            font-size: 14px;
            height: 38px;
        }
        
        .add-button {
            flex: 1;
        }
        
        .add-button input[type="submit"] {
            padding: 8px 15px;
            height: 38px;
            width: 100%;
        }
        
        .message {
            background-color: #e8f5e9;
            color: #388e3c;
            padding: 10px 15px;
            border-radius: 8px;
            margin: 15px 0;
            text-align: center;
            font-weight: 500;
        }
        
        .error-message {
            background-color: #ffebee;
            color: #d32f2f;
            padding: 10px 15px;
            border-radius: 8px;
            margin: 15px 0;
            text-align: center;
            font-weight: 500;
        }
        
        /* Enhanced navigation section */
        .navigation-section {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-top: 40px;
            box-shadow: 0 4px 15px rgba(255, 182, 193, 0.2);
            border: 1px solid rgba(255, 182, 193, 0.3);
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        
        .nav-button {
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 14px 24px;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            min-width: 180px;
        }
        
        .nav-button-icon {
            margin-right: 10px;
            font-size: 20px;
        }
        
        .profile-button {
            background-color: #e68a9f;
            color: white;
        }
        
        .profile-button:hover {
            background-color: #d97a8f;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(230, 138, 159, 0.3);
        }
        
        .logout-button {
            background-color: #fff5f7;
            color: #d97a8f;
            border: 2px solid #ffd6de;
        }
        
        .logout-button:hover {
            background-color: #ffeef1;
            color: #c96a7f;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(230, 138, 159, 0.2);
        }
        
        @media (max-width: 768px) {
            .product-grid {
                grid-template-columns: repeat(auto-fill, minmax(220px, 1fr));
            }
            
            .quick-order-form {
                flex-direction: column;
                align-items: stretch;
            }
            
            .form-group {
                width: 100%;
            }
            
            .navigation-section {
                flex-direction: column;
                gap: 15px;
            }
            
            .nav-button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <c:set var="user" value="" />
            <c:if test="${not empty sessionScope.LOGIN_USER}">
                <c:set var="user" value="${sessionScope.LOGIN_USER.fullName}" />
            </c:if>
            <h1>Welcome ${user} to our Bakery Family!</h1>
        </div>
        
        <div class="quick-order">
            <h2>Quick Order</h2>
            <form action="MainController" method="POST" class="quick-order-form">
                <div class="form-group">
                    <label for="product">Select your cake:</label>
                    <select name="product" id="product">
                        <option value="P001-Chocolate Cake-16.52">Chocolate Cake - 16.52$</option>
                        <option value="P002-Strawberry Cake-15.22">Strawberry Cake - 15.22$</option>
                        <option value="P003-Cheese Cake-17.83">Cheese Cake - 17.83$</option>
                        <option value="P004-Tiramisu-18.70">Tiramisu - 18.70$</option>
                        <option value="P005-Red Velvet Cake-17.39">Red Velvet Cake - 17.39$</option>
                        <option value="P006-Matcha Green Tea Cake-16.96">Matcha Green Tea Cake - 16.96$</option>
                        <option value="P007-Carrot Cake-16.09">Carrot Cake - 16.09$</option>
                        <option value="P008-Lemon Drizzle Cake-15.65">Lemon Drizzle Cake - 15.65$</option>
                        <option value="P009-Black Forest Cake-18.26">Black Forest Cake - 18.26$</option>
                        <option value="P010-Mango Mousse Cake-17.61">Mango Mousse Cake - 17.61$</option>
                    </select>
                </div>
                
                <div class="form-group">
                    <label for="quantity">Quantity:</label>
                    <input type="number" id="quantity" name="quantity" value="1" min="1" step="1">
                </div>
                
                <div class="button-group">
                    <input type="submit" name="action" value="Add" class="button primary-button">
                    <input type="submit" name="action" value="View" class="button secondary-button">
                </div>
            </form>
        </div>
        
        <c:if test="${not empty requestScope.MESSAGE}">
            <div class="message">${requestScope.MESSAGE}</div>
        </c:if>
        
        <c:if test="${not empty sessionScope.LIST_PRODUCT}">
            <div class="product-grid">
                <c:forEach var="cake" items="${sessionScope.LIST_PRODUCT}">
                    <div class="product-card">
                        <div class="product-image">
                            <c:choose>
                                <c:when test="${not empty cake.imageURL}">
                                    <img src="${cake.imageURL}" alt="${cake.name}">
                                </c:when>
                                <c:otherwise>
                                    🎂
                                </c:otherwise>
                            </c:choose>
                        </div>
                        <div class="product-info">
                            <h2 class="product-name">${cake.name}</h2>
                            <div class="product-price">$${cake.price}</div>
                            
                            <form action="MainController" method="POST" class="product-form">
                                <select name="product" style="display: none;">
                                    <option value="${cake.productID}-${cake.name}-${cake.price}" selected>
                                        ${cake.productID}-${cake.name}-${cake.price}
                                    </option>
                                </select>
                                
                                <!-- Horizontal layout for quantity and button -->
                                <div class="product-form-row">
                                    <div class="quantity-input">
                                        <input type="number" name="quantity" value="1" min="1" step="1">
                                    </div>
                                    <div class="add-button">
                                        <input type="submit" name="action" value="Add" class="button primary-button">
                                    </div>
                                </div>
                            </form>
                        </div>
                    </div>
                </c:forEach>
            </div>
        </c:if>
        
        <c:if test="${not empty requestScope.MESS}">
            <div class="message">${requestScope.MESS}</div>
        </c:if>
        
        <!-- Enhanced navigation section -->
        <div class="navigation-section">
            <c:if test="${not empty sessionScope.LOGIN_USER}">
                <a href="user.jsp" class="nav-button profile-button">
                    <span class="nav-button-icon">👤</span>
                    Login
                </a>
            </c:if>
            <c:if test="${empty sessionScope.LOGIN_USER}">
                <a href="login.jsp" class="nav-button profile-button">
                    <span class="nav-button-icon">👤</span>
                    Back to Profile
                </a>
            </c:if>
            <a href="MainController?action=Logout" class="nav-button logout-button">
                <span class="nav-button-icon">🚪</span>
                Logout
            </a>
        </div>
    </div>
</body>
</html>