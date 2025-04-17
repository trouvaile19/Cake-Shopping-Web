<%-- 
    Document   : user
    Created on : Feb 15, 2025, 4:51:48 PM
    Author     : hoadoan
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./avatar.png"> 

    <title>User Profile - Cake Shop🎂</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #fff5f5;
            min-height: 100vh;
            padding: 20px;
            background-image: linear-gradient(to bottom right, #fff5f5, #ffeef1);
            display: flex;
            justify-content: center;
            align-items: center;
        }
        
        .profile-container {
            background-color: white;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(255, 182, 193, 0.2);
            width: 100%;
            max-width: 480px;
            border: 1px solid rgba(255, 182, 193, 0.3);
            overflow: hidden;
        }
        
        .profile-header {
            background-color: #ffd6de;
            padding: 25px;
            text-align: center;
            position: relative;
        }
        
        .profile-header h1 {
            color: #d97a8f;
            font-size: 24px;
            margin-bottom: 5px;
        }
        
        .profile-header p {
            color: #b18597;
            font-size: 14px;
        }
        
        .profile-avatar {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            background-color: white;
            margin: 0 auto 15px;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 40px;
            border: 4px solid white;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.1);
        }
        
        .profile-content {
            padding: 25px;
        }
        
        .profile-info {
            margin-bottom: 25px;
        }
        
        .info-item {
            display: flex;
            margin-bottom: 15px;
            align-items: center;
        }
        
        .info-label {
            width: 100px;
            font-weight: 600;
            color: #b18597;
            font-size: 14px;
        }
        
        .info-value {
            flex: 1;
            color: #333;
            font-size: 15px;
            background-color: #fff5f7;
            padding: 8px 12px;
            border-radius: 8px;
            border: 1px solid #ffd6de;
        }
        
        .profile-actions {
            display: flex;
            gap: 10px;
        }
        
        .action-button {
            flex: 1;
            text-align: center;
            padding: 12px;
            border-radius: 10px;
            text-decoration: none;
            font-weight: 500;
            font-size: 15px;
            transition: all 0.3s;
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
        
        .decoration {
            position: absolute;
            font-size: 20px;
        }
        
        .decoration-1 {
            top: 15px;
            left: 15px;
        }
        
        .decoration-2 {
            bottom: 15px;
            right: 15px;
        }
        
        .welcome-message {
            text-align: center;
            margin-bottom: 20px;
            color: #e68a9f;
            font-weight: 500;
        }
    </style>
</head>
<body>
    <c:if test="${not empty sessionScope.LOGIN_USER}">
        <div class="profile-container">
            <div class="profile-header">
                <span class="decoration decoration-1">🧁</span>
                <span class="decoration decoration-2">🍰</span>
                
                <div class="profile-avatar">
                    👤
                </div>
                <h1>My Profile</h1>
                <p>Welcome to Sweet Cake Shop</p>
            </div>
            
            <div class="profile-content">
                <div class="welcome-message">
                    Hello, <c:out value="${sessionScope.LOGIN_USER.fullName}" />!
                </div>
                
                <div class="profile-info">
                    <div class="info-item">
                        <div class="info-label">User ID</div>
                        <div class="info-value"><c:out value="${sessionScope.LOGIN_USER.userID}" /></div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">Full Name</div>
                        <div class="info-value"><c:out value="${sessionScope.LOGIN_USER.fullName}" /></div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">Phone</div>
                        <div class="info-value"><c:out value="${sessionScope.LOGIN_USER.phone}" /></div>
                    </div>
                    <div class="info-item">
                        <div class="info-label">Email</div>
                        <div class="info-value"><c:out value="${sessionScope.LOGIN_USER.email}" /></div>
                    </div>
                    
                    <div class="info-item">
                        <div class="info-label">Role</div>
                        <div class="info-value"><c:out value="${sessionScope.LOGIN_USER.roleID}" /></div>
                    </div>
                </div>
                
                <div class="profile-actions">
                    <a href="MainController?action=Shopping" class="action-button primary-button">Shop Now</a>
                    <a href="MainController?action=Logout" class="action-button secondary-button">Logout</a>
                </div>
            </div>
        </div>
    </c:if>
</body>
</html>