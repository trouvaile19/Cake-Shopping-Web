<%-- 
    Document   : viewCart
    Created on : 07-03-2025, 16:52:44
    Author     : ADMIN
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./avatar.png"> 

    <title>Your Shopping Cart 🛒</title>
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
            max-width: 1000px;
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
        
        .cart-container {
            background-color: white;
            border-radius: 15px;
            padding: 20px;
            margin-bottom: 30px;
            box-shadow: 0 4px 15px rgba(255, 182, 193, 0.2);
            border: 1px solid rgba(255, 182, 193, 0.3);
        }
        
        .cart-empty {
            text-align: center;
            padding: 40px 20px;
        }
        
        .cart-empty h2 {
            color: #b18597;
            font-size: 24px;
            margin-bottom: 20px;
        }
        
        .cart-empty p {
            color: #d97a8f;
            font-size: 18px;
            margin-bottom: 30px;
        }
        
        .cart-table {
            width: 100%;
            border-collapse: collapse;
            margin-bottom: 20px;
        }
        
        .cart-table th {
            background-color: #ffd6de;
            color: #d97a8f;
            padding: 12px 15px;
            text-align: left;
            font-weight: 600;
            font-size: 15px;
        }
        
        .cart-table td {
            padding: 15px;
            border-bottom: 1px solid #ffd6de;
            color: #555;
            font-size: 15px;
            vertical-align: middle;
        }
        
        .cart-table tr:last-child td {
            border-bottom: none;
        }
        
        .cart-table tr:hover {
            background-color: #fff5f7;
        }
        
        .cart-table .product-id {
            color: #b18597;
            font-size: 14px;
            background-color: #fff5f7;
            padding: 8px 10px;
            border-radius: 6px;
            border: 1px solid #ffd6de;
            width: 80px;
            text-align: center;
        }
        
        .cart-table .product-name {
            font-weight: 500;
            color: #d97a8f;
        }
        
        .cart-table .product-price {
            color: #e68a9f;
            font-weight: 600;
        }
        
        .cart-table .product-total {
            font-weight: 700;
            color: #d97a8f;
        }
        
        .quantity-input {
            width: 70px;
            padding: 8px 10px;
            border: 1px solid #ffd6de;
            border-radius: 8px;
            font-size: 14px;
            text-align: center;
        }
        
        .quantity-input:focus {
            border-color: #e68a9f;
            outline: none;
            box-shadow: 0 0 0 3px rgba(230, 138, 159, 0.1);
        }
        
        .button {
            padding: 8px 15px;
            border: none;
            border-radius: 8px;
            font-size: 14px;
            cursor: pointer;
            font-weight: 500;
            transition: all 0.3s;
            text-align: center;
            text-decoration: none;
            display: inline-block;
        }
        
        .edit-button {
            background-color: #e68a9f;
            color: white;
        }
        
        .edit-button:hover {
            background-color: #d97a8f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(230, 138, 159, 0.2);
        }
        
        .remove-button {
            background-color: #fff5f7;
            color: #d97a8f;
            border: 1px solid #ffd6de;
        }
        
        .remove-button:hover {
            background-color: #ffeef1;
            color: #c96a7f;
            transform: translateY(-2px);
        }
        
        .error-message {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 5px;
        }
        
        .cart-total {
            text-align: right;
            padding: 15px 0;
            border-top: 2px solid #ffd6de;
            margin-top: 20px;
        }
        
        .cart-total h2 {
            color: #d97a8f;
            font-size: 24px;
            display: inline-block;
        }
        
        .cart-total span {
            font-weight: 700;
            color: #e68a9f;
            font-size: 26px;
            margin-left: 10px;
        }
        
        .cart-actions {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 30px;
            flex-wrap: wrap;
            gap: 15px;
        }
        
        .shopping-links {
            display: flex;
            gap: 15px;
        }
        
        .link-button {
            padding: 12px 20px;
            border-radius: 10px;
            font-size: 15px;
            font-weight: 600;
            text-decoration: none;
            transition: all 0.3s;
            display: inline-flex;
            align-items: center;
        }
        
        .continue-shopping {
            background-color: #fff5f7;
            color: #d97a8f;
            border: 1px solid #ffd6de;
        }
        
        .continue-shopping:hover {
            background-color: #ffeef1;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(230, 138, 159, 0.1);
        }
        
        .clear-cart {
            background-color: #fff5f7;
            color: #b18597;
            border: 1px solid #ffd6de;
        }
        
        .clear-cart:hover {
            background-color: #ffeef1;
            color: #9a7080;
            transform: translateY(-2px);
        }
        
        .checkout-button {
            background-color: #e68a9f;
            color: white;
            padding: 14px 30px;
            border: none;
            border-radius: 10px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s;
        }
        
        .checkout-button:hover {
            background-color: #d97a8f;
            transform: translateY(-3px);
            box-shadow: 0 6px 15px rgba(230, 138, 159, 0.3);
        }
        
        .icon {
            margin-right: 8px;
            font-size: 18px;
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
        
        @media (max-width: 768px) {
            .cart-table {
                display: block;
                overflow-x: auto;
            }
            
            .cart-actions {
                flex-direction: column;
                align-items: stretch;
            }
            
            .shopping-links {
                flex-direction: column;
                width: 100%;
            }
            
            .link-button, .checkout-button {
                width: 100%;
                justify-content: center;
            }
            
            .cart-table th, .cart-table td {
                padding: 10px;
            }
            
            .cart-table .product-id {
                width: 60px;
                font-size: 12px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <div class="header">
            <h1>Your Sweet Cart</h1>
        </div>
        
        <div class="cart-container">
            <c:choose>
                <c:when test="${not empty sessionScope.CART}">
                    <table class="cart-table">
                        <thead>
                            <tr>
                                <th>No</th>
                                <th>ID</th>
                                <th>Name</th>
                                <th>Price</th>
                                <th>Quantity</th>
                                <th>Total</th>
                                <th>Edit</th>
                                <th>Remove</th>
                                <th style="text-align: center">NOTE</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:set var="count" value="1" />
                            <c:set var="total" value="0" />
                            
                            <c:forEach var="product" items="${sessionScope.CART.cart.values()}">
                                <c:set var="itemTotal" value="${product.quantity * product.price}" />
                                <c:set var="total" value="${total + itemTotal}" />
                                
                                <tr>
                                    <form action="MainController" method="POST">
                                        <td>${count}</td>
                                        <td>
                                            <input type="text" name="id" value="${product.productID}" readonly class="product-id" />
                                        </td>
                                        <td class="product-name">${product.name}</td>
                                        <td class="product-price">$${product.price}</td>
                                        <td>
                                            <input type="number" name="quantity" value="${product.quantity}" required min="1" class="quantity-input" />
                                        </td>
                                        <td class="product-total">$<fmt:formatNumber value="${itemTotal}" pattern="#,##0.00" /></td>
                                        <td>
                                            <input type="submit" name="action" value="Edit" class="button edit-button" />
                                        </td>
                                        <td>
                                            <input type="submit" name="action" value="Remove" class="button remove-button" />
                                        </td>
                                        <td>
                                            <c:if test="${not empty requestScope['MESSAGE_'.concat(product.productID)]}">
                                                <div style="text-align: center" class="error-message">${requestScope['MESSAGE_'.concat(product.productID)]}</div>
                                            </c:if>
                                        </td>
                                    </form>
                                </tr>
                                <c:set var="count" value="${count + 1}" />
                            </c:forEach>
                        </tbody>
                    </table>
                    
                    <div class="cart-total">
                        <h2>Total:</h2>
                        <span>$<fmt:formatNumber value="${total}" pattern="#,##0.00" /></span>
                    </div>
                    
                    <div class="cart-actions">
                        <div class="shopping-links">
                            <a href="shopping.jsp" class="link-button continue-shopping">
                                <span class="icon">🛒</span> Continue Shopping
                            </a>
                            <a href="MainController?action=Clearcart" class="link-button clear-cart">
                                <span class="icon">🗑️</span> Clear Cart
                            </a>
                        </div>
                        
                        <form action="MainController" method="POST">
                            <button type="submit" name="action" value="Checkout" class="checkout-button">
                                <span class="icon">✓</span> Checkout
                            </button>
                        </form>
                    </div>
                </c:when>
                <c:otherwise>
                    <div class="cart-empty">
                        <h2>Your cart is empty</h2>
                        <p>Add some delicious cakes to your cart!</p>
                        <a href="shopping.jsp" class="link-button continue-shopping">
                            <span class="icon">🛒</span> Go Shopping
                        </a>
                    </div>
                </c:otherwise>
            </c:choose>
            
            <c:if test="${not empty requestScope.MESSAGE}">
                <div class="message">${requestScope.MESSAGE}</div>
            </c:if>
        </div>
    </div>
</body>
</html>