<%-- 
    Document   : createUser
    Created on : Mar 1, 2025, 4:45:15 PM
    Author     : hoadoan
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <title>Sign Up Page 👤</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" type="image/x-icon" href="./avatar.png"> 
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
        }
        
        body {
            background-color: #fff5f5;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            padding: 15px;
            background-image: linear-gradient(to bottom right, #fff5f5, #ffeef1);
        }
        
        .signup-container {
            background-color: white;
            border-radius: 18px;
            box-shadow: 0 8px 25px rgba(255, 182, 193, 0.2);
            padding: 25px;
            width: 100%;
            max-width: 580px;
            border: 1px solid rgba(255, 182, 193, 0.3);
        }
        
        .signup-header {
            text-align: center;
            margin-bottom: 15px;
            display: flex;
            align-items: center;
            justify-content: center;
        }
        
        .signup-header-icon {
            font-size: 28px;
            margin-right: 10px;
        }
        
        .signup-header-text h1 {
            color: #e68a9f;
            font-size: 24px;
            margin-bottom: 5px;
            font-weight: 600;
        }
        
        .signup-header-text p {
            color: #b18597;
            font-size: 14px;
        }
        
        .form-row {
            display: flex;
            gap: 15px;
            margin-bottom: 12px;
        }
        
        .form-group {
            margin-bottom: 12px;
            flex: 1;
        }
        
        label {
            display: block;
            margin-bottom: 4px;
            color: #b18597;
            font-weight: 500;
            font-size: 14px;
        }
        
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 10px 15px;
            border: 1px solid #ffd6de;
            border-radius: 10px;
            font-size: 14px;
            transition: all 0.3s;
            background-color: #fffbfc;
        }
        
        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #e68a9f;
            outline: none;
            box-shadow: 0 0 0 3px rgba(230, 138, 159, 0.1);
        }
        
        .button-group {
            display: flex;
            gap: 10px;
            margin-top: 15px;
        }
        
        input[type="submit"] {
            background-color: #e68a9f;
            color: white;
            border: none;
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 15px;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        input[type="submit"]:hover {
            background-color: #d97a8f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(230, 138, 159, 0.2);
        }
        
        input[type="reset"] {
            background-color: #fff5f7;
            color: #b18597;
            border: 1px solid #ffd6de;
            border-radius: 10px;
            padding: 10px 15px;
            font-size: 15px;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s;
            font-weight: 500;
        }
        
        input[type="reset"]:hover {
            background-color: #ffeef1;
            transform: translateY(-2px);
        }
        
        .error-text {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 3px;
            display: block;
        }
        
        .error-message {
            color: #e74c3c;
            margin-top: 10px;
            text-align: center;
            font-size: 13px;
            padding: 8px;
            background-color: rgba(231, 76, 60, 0.1);
            border-radius: 8px;
            margin-bottom: 8px;
        }
        
        .footer-links {
            display: flex;
            justify-content: center;
            margin-top: 12px;
            font-size: 13px;
        }
        
        .footer-links a {
            color: #e68a9f;
            text-decoration: none;
            transition: all 0.3s;
            padding: 0 8px;
        }
        
        .footer-links a:hover {
            color: #d97a8f;
            text-decoration: underline;
        }
    </style>
</head>
<body>
    <c:set var="newUser" value="${requestScope.NEW_USER}" />
    <c:set var="newUserID" value="" />
    <c:set var="newFullname" value="" />
    <c:set var="newEmail" value="" />
    <c:set var="newPhone" value="" />

    <c:if test="${newUser != null}">
        <c:set var="newUserID" value="${newUser.userID != null ? newUser.userID : ''}" />
        <c:set var="newFullname" value="${newUser.fullName != null ? newUser.fullName : ''}" />
        <c:set var="newEmail" value="${newUser.email != null ? newUser.email : ''}" />
        <c:set var="newPhone" value="${newUser.phone != null ? newUser.phone : ''}" />
    </c:if>
   
    <c:if test="${empty requestScope.USER_ERROR}">
        <jsp:useBean id="USER_ERROR" class="model.UserError" scope="request" />
    </c:if>
    
    <div class="signup-container">
        <div class="signup-header">
            <div class="signup-header-icon">🍰</div>
            <div class="signup-header-text">
                <h1>Create Account</h1>
                <p>Join our sweet cake shop community</p>
            </div>
            <div style="padding-left: 15px" class="signup-header-icon">🍰</div>
        </div>
        
        <form action="MainController" method="POST">
            <div class="form-row">
                <div class="form-group">
                    <label for="userID">User ID</label>
                    <input type="text" id="userID" name="userID" value="${newUserID}" required minlength="2" maxlength="15" placeholder="2-15 characters"/>
                    <span class="error-text"><c:out value="${requestScope.USER_ERROR.roleIDDError}"/></span>
                </div>
                
                <div class="form-group">
                    <label for="fullName">Full Name</label>
                    <input type="text" id="fullName" name="fullName" value="${newFullname}" required="" minlength="5" maxlength="20" placeholder="5-20 characters"/>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="phone">Phone</label>
                    <input type="text" id="phone" name="phone" value="${newPhone}" required="" minlength="10" maxlength="13" placeholder="Phone number"/>
                    <span class="error-text"><c:out value="${requestScope.USER_ERROR.phoneError}" /></span>
                </div>
                
                <div class="form-group">
                    <label for="roleID">Role ID</label>
                    <input type="text" id="roleID" name="roleID" value="US" readonly=""/>
                </div>
            </div>
            
            <div class="form-row">
                <div class="form-group">
                    <label for="password">Password</label>
                    <input type="password" id="password" name="password" required="" placeholder="Create a password"/>
                </div>
                
                <div class="form-group">
                    <label for="confirm">Confirm Password</label>
                    <input type="password" id="confirm" name="confirm" required="" placeholder="Confirm password"/>
                    <span class="error-text"><c:out value="${requestScope.USER_ERROR.confirm}" /></span>
                </div>
            </div>
            <div class="form-group">
                <label for="email">E-mail</label>
                <input type="text" id="email" name="email" value="${newEmail}" required="" placeholder="Create a email"/>
                <span class="error-text"><c:out value="${requestScope.USER_ERROR.emailError}" /></span>
            </div>
            <div class="button-group">
                <input type="submit" name="action" value="Create"/> 
                <input type="reset" value="Reset"/>
            </div>
            <span class="error-text"><c:out value="${requestScope.USER_ERROR.error}" /></span>       
        </form>
                <a href="https://accounts.google.com/o/oauth2/auth?scope=profile&redirect_uri=http://localhost:8084/LoginGoogle/LoginGoogleController&response_type=code&client_id=444427940557-bj6ig43ogimm1tgogfeie138lolv9viq.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
        
        <div class="footer-links">
            <a href="login.jsp">Back to Login</a> | 
            <a href="MainController?action=Shopping">Browse Cakes</a>
        </div>
    </div>
</body>
</html>