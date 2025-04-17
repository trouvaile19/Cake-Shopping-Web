<%-- 
    Document   : admin
    Created on : Feb 15, 2025, 4:51:53 PM
    Author     : hoadoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.List"%>
<%@page import="model.UserDTO"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Administrator Page 👤</title>
    <link rel="icon" type="image/x-icon" href="./avatar.png"> 
    <style>
        /* Global Styles */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Arial', sans-serif;
        }
        
        body {
            background-color: #fff5f5;
            color: #333;
            line-height: 1.6;
            padding: 20px;
        }
        
        /* Header Styles */
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-bottom: 30px;
            padding-bottom: 15px;
            border-bottom: 1px solid #ffccd5;
        }
        
        h1 {
            color: #ff6b8b;
            margin-bottom: 20px;
        }
        
        /* Container */
        .container {
            max-width: 1200px;
            margin: 0 auto;
            background-color: white;
            padding: 25px;
            border-radius: 8px;
            box-shadow: 0 4px 10px rgba(0,0,0,0.1);
        }
        
        /* Form Styles */
        .form-group {
            margin-bottom: 20px;
        }
        
        .search-form {
            display: flex;
            margin: 20px 0;
            align-items: center;
        }
        
        .search-form label {
            margin-right: 10px;
            font-weight: bold;
        }
        
        input[type="text"] {
            padding: 10px;
            border: 1px solid #ddd;
            border-radius: 4px;
            width: 100%;
            font-size: 14px;
        }
        
        .table-input {
            padding: 8px !important;
            width: 100% !important;
        }
        
        input[type="submit"], .btn {
            background-color: #ff6b8b;
            color: white;
            border: none;
            padding: 10px 20px;
            border-radius: 4px;
            cursor: pointer;
            font-weight: bold;
            transition: all 0.3s;
            margin-left: 10px;
        }
        
        input[type="submit"]:hover, .btn:hover {
            background-color: #ff5277;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(255, 107, 139, 0.4);
        }
        
        .logout-btn {
            background-color: #ff8fa3;
        }
        
        .search-input {
            flex: 1;
            max-width: 400px;
        }
        
        /* Table Styles */
        .user-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: white;
            box-shadow: 0 2px 5px rgba(0,0,0,0.1);
            border-radius: 5px;
            overflow: hidden;
        }
        
        .user-table th {
            background-color: #ffebee;
            color: #333;
            padding: 12px;
            text-align: left;
            font-weight: bold;
        }
        
        .user-table td {
            padding: 10px;
            border-bottom: 1px solid #f0f0f0;
        }
        
        .user-table tr:last-child td {
            border-bottom: none;
        }
        
        .user-table tr:hover {
            background-color: #fff9f9;
        }
        
        /* Action Links */
        .action-link {
            display: inline-block;
            background-color: #ff6b8b;
            color: white;
            text-decoration: none;
            padding: 8px 15px;
            border-radius: 4px;
            font-weight: bold;
            transition: all 0.3s;
            text-align: center;
        }
        
        .action-link:hover {
            background-color: #ff5277;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(255, 107, 139, 0.4);
        }
        
        .delete-link {
            background-color: #ff8fa3;
        }
        
        /* Messages */
        .error-message {
            margin-top: 20px;
            padding: 10px;
            background-color: #ffebee;
            color: #c62828;
            border-radius: 4px;
            text-align: center;
            border-left: 4px solid #c62828;
            font-weight: 800;
        }
        
        .info-message {
            margin-top: 20px;
            padding: 10px;
            background-color: #e8f5e9;
            color: #2e7d32;
            border-radius: 4px;
            text-align: center;
            border-left: 4px solid #2e7d32;
        }
        
        /* Action Button */
        .action-button {
            display: inline-block;
            background-color: #ff6b8b;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            border-radius: 4px;
            font-weight: bold;
            font-size: 16px;
            transition: all 0.3s;
            box-shadow: 0 2px 4px rgba(255, 107, 139, 0.3);
            text-align: center;
            margin: 10px 0;
            border: none;
            cursor: pointer;
        }
        
        .action-button:hover {
            background-color: #ff5277;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(255, 107, 139, 0.4);
        }
        
        .action-button:active {
            transform: translateY(0);
            box-shadow: 0 2px 4px rgba(255, 107, 139, 0.3);
        }
        
        .action-bar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin: 20px 0;
        }
        
        /* Responsive */
        @media (max-width: 768px) {
            .search-form {
                flex-direction: column;
                align-items: flex-start;
            }
            
            .search-input {
                max-width: 100%;
                margin-bottom: 10px;
            }
            
            input[type="submit"] {
                margin-left: 0;
                margin-top: 10px;
                width: 100%;
            }
            
            .user-table {
                display: block;
                overflow-x: auto;
            }
            
            .action-bar {
                flex-direction: column;
            }
            
            .action-button {
                width: 100%;
                margin: 5px 0;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <c:choose>
            <c:when test="${empty sessionScope.LOGIN_USER or sessionScope.LOGIN_USER.roleID != 'AD'}">
                <c:redirect url="login.html"/>
            </c:when>
        </c:choose>

        <div class="header">
            <h1>Welcome Admin: ${sessionScope.LOGIN_USER.fullName}</h1>
            <form action="MainController" method="POST">
                <input type="submit" name="action" value="Logout" class="logout-btn"/>
            </form>
        </div>

        <div class="action-bar">
            <!-- Form tìm kiếm -->
            <form action="MainController" class="search-form">
                <label for="search">Search:</label>
                <input type="text" name="search" id="search" value="${param.search}" class="search-input" />
                <input type="submit" name="action" value="Search"/>
            </form>
            
        </div>

        <c:if test="${not empty requestScope.LIST_USER}">
            <table class="user-table">
                <thead>
                    <tr>
                        <th>No</th>
                        <th>User ID</th>
                        <th>Full Name</th>
                        <th>Phone</th>
                        <th>Gmail</th>
                        <th>Role ID</th>
                        <th>Password</th>
                        <th>Update</th>
                        <th>Delete</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="user" items="${requestScope.LIST_USER}" varStatus="counter">
                    <form action="MainController" method="POST">
                        <tr>
                            <td>${counter.count}</td>
                            <td><input type="text" name="userID" value="${user.userID}" readonly="readonly" class="table-input"/></td>
                            <td><input type="text" name="fullName" value="${user.fullName}" required="required" class="table-input"/></td>
                            <td><input type="text" name="phone" value="${user.phone}" required="required" class="table-input"/></td>
                            <td><input type="text" name="email" value="${user.email}" required="required" class="table-input" readonly=""/></td>
                            <td><input type="text" name="roleID" value="${user.roleID}" required="required" class="table-input"/></td>
                            <td>${user.password}</td>

                            <!-- Update -->
                            <td>
                                <input type="submit" name="action" value="Update"/>
                                <input type="hidden" name="search" value="${param.search}"/>
                            </td>

                            <!-- Delete -->
                            <td>
                                <a href="MainController?action=Delete&userID=${user.userID}&search=${param.search}" class="action-link delete-link">Delete</a>
                            </td>
                        </tr>
                    </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
         
        
                
                
                
        <c:set var="found" value="${FOUND}" />
        <c:if test="${not empty found}">
            <div class="info-message">
                <c:out value="${found}" />
            </div>
        </c:if>
        <c:if test="${not empty requestScope.ERROR}">
            <div class="error-message">
                ${requestScope.ERROR}
            </div>
        </c:if>

    </div>
</body>
</html>