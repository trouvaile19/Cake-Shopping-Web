<%-- 
    Document   : payment.jsp
    Created on : 20-03-2025, 21:47:45
    Author     : ADMIN
--%>

<%@page import="shopping.Product"%>
<%@page import="shopping.Cart"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="icon" type="image/x-icon" href="./avatar.png"> 
        <title>Payment 🎂</title>
        <style>
            body {
                font-family: Arial, sans-serif;
                background-color: #fff5f5;
                margin: 0;
                padding: 20px;
                color: #333;
            }
            
            h1 {
                color: #ff6b8b;
                text-align: center;
                margin-bottom: 20px;
            }
            
            table {
                width: 100%;
                border-collapse: collapse;
                margin: 20px 0;
                background-color: white;
                box-shadow: 0 2px 5px rgba(0,0,0,0.1);
                border-radius: 5px;
                overflow: hidden;
            }
            
            th {
                background-color: #ffebee;
                color: #333;
                padding: 12px;
                text-align: left;
                font-weight: bold;
            }
            
            td {
                padding: 10px;
                border-bottom: 1px solid #f0f0f0;
            }
            
            tr:last-child td {
                border-bottom: none;
            }
            
            tr:hover {
                background-color: #fff9f9;
            }
            
            .total {
                font-size: 24px;
                color: #ff6b8b;
                text-align: right;
                margin: 20px 0;
            }
            
            .action-buttons {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin: 20px 0;
            }
            
            form {
                margin: 0;
            }
            
            input[type="submit"] {
                background-color: #ff6b8b;
                color: white;
                border: none;
                padding: 12px 25px;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                font-size: 16px;
                transition: all 0.3s;
                box-shadow: 0 2px 4px rgba(255, 107, 139, 0.3);
            }
            
            input[type="submit"]:hover {
                background-color: #ff5277;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(255, 107, 139, 0.4);
            }
            
            input[type="submit"]:active {
                transform: translateY(0);
                box-shadow: 0 2px 4px rgba(255, 107, 139, 0.3);
            }
            
            a.home-button {
                display: inline-block;
                background-color: white;
                color: #ff6b8b;
                text-decoration: none;
                padding: 12px 25px;
                border-radius: 4px;
                border: 2px solid #ff6b8b;
                font-weight: bold;
                font-size: 16px;
                transition: all 0.3s;
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
                text-align: center;
            }
            
            a.home-button:hover {
                background-color: #fff5f5;
                transform: translateY(-2px);
                box-shadow: 0 4px 8px rgba(0, 0, 0, 0.15);
            }
            
            a.home-button:active {
                transform: translateY(0);
                box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
            }
            
            .message {
                margin-top: 20px;
                padding: 10px;
                background-color: #e8f5e9;
                color: #2e7d32;
                border-radius: 4px;
                text-align: center;
            }
            
            .container {
                max-width: 800px;
                margin: 0 auto;
                background-color: white;
                padding: 20px;
                border-radius: 8px;
                box-shadow: 0 4px 10px rgba(0,0,0,0.1);
            }
        </style>
    </head>
    <body>
        <a href="user.jsp" class="home-button">Home</a>

        <div class="container">
            <h1>Your Bill Here</h1>
            <c:set var="total" value="0" />
            <c:set var="cart" value="${sessionScope.CART}" />
            
            <c:if test="${not empty cart}">
                <table border="1">
                    <thead>
                        <tr>
                            <th>NO</th>
                            <th>ProductID</th>
                            <th>Cake's Name</th>
                            <th>Price</th>
                            <th>Quantity</th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:set var="count" value="1" />
                        <c:forEach var="item" items="${cart.getCart().values()}">
                            <c:set var="total" value="${total + (item.quantity * item.price)}" />
                            <tr>
                                <td>${count}</td>
                                <td>${item.productID}</td>
                                <td>${item.name}</td>
                                <td>${item.price}</td>
                                <td>${item.quantity}</td>
                            </tr>
                            <c:set var="count" value="${count + 1}" />
                        </c:forEach>
                    </tbody>
                </table>
                
                <h1 class="total">Total: <fmt:formatNumber value="${total}" pattern="0.00" />$</h1>
                
                <c:set var="TOTAL" value="${total}" scope="session" />
                
                <div class="action-buttons">
                    <a href="user.jsp" class="home-button">Home</a>
                    <form action="MainController">
                        <input type="submit" name="action" value="Pay"/>
                    </form>
                </div>
            </c:if>
            
            <c:set var="mess" value="${requestScope.MESS}" />
            <c:if test="${not empty mess}">
                <div class="message">${mess}</div>
            </c:if>
            <c:if test="${empty mess}">
                <div class="message" style="display: none;"></div>
            </c:if>
        </div>
    </body>
</html>