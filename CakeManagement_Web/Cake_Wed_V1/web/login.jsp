<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <title>Cake Shop Login 👤</title>
    <meta charset="UTF-8">
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
            padding: 20px;
            background-image: linear-gradient(to bottom right, #fff5f5, #ffeef1);
        }

        .login-container {
            background-color: white;
            border-radius: 20px;
            box-shadow: 0 8px 25px rgba(255, 182, 193, 0.2);
            padding: 35px;
            width: 100%;
            max-width: 420px;
            border: 1px solid rgba(255, 182, 193, 0.3);
        }

        .login-header {
            text-align: center;
            margin-bottom: 30px;
        }

        .login-header h1 {
            color: #e68a9f;
            font-size: 28px;
            margin-bottom: 10px;
            font-weight: 600;
        }

        .login-header p {
            color: #b18597;
            font-size: 15px;
        }

        .login-form .form-group {
            margin-bottom: 22px;
            position: relative;
        }

        .login-form label {
            display: block;
            margin-bottom: 8px;
            color: #b18597;
            font-weight: 500;
            font-size: 15px;
        }

        .login-form input[type="text"],
        .login-form input[type="password"] {
            width: 100%;
            padding: 14px 18px;
            border: 1px solid #ffd6de;
            border-radius: 12px;
            font-size: 15px;
            transition: all 0.3s;
            background-color: #fffbfc;
        }

        .login-form input[type="text"]:focus,
        .login-form input[type="password"]:focus {
            border-color: #e68a9f;
            outline: none;
            box-shadow: 0 0 0 3px rgba(230, 138, 159, 0.1);
        }

        .button-group {
            display: flex;
            gap: 12px;
            margin-top: 25px;
        }

        .login-form input[type="submit"] {
            background-color: #e68a9f;
            color: white;
            border: none;
            border-radius: 12px;
            padding: 14px 20px;
            font-size: 16px;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s;
            font-weight: 500;
        }

        .login-form input[type="submit"]:hover {
            background-color: #d97a8f;
            transform: translateY(-2px);
            box-shadow: 0 4px 8px rgba(230, 138, 159, 0.2);
        }

        .login-form input[type="reset"] {
            background-color: #fff5f7;
            color: #b18597;
            border: 1px solid #ffd6de;
            border-radius: 12px;
            padding: 14px 20px;
            font-size: 16px;
            cursor: pointer;
            flex: 1;
            transition: all 0.3s;
            font-weight: 500;
        }

        .login-form input[type="reset"]:hover {
            background-color: #ffeef1;
            transform: translateY(-2px);
        }

        .links {
            display: flex;
            justify-content: space-between;
            margin-top: 25px;
            font-size: 14px;
        }

        .links a {
            color: #e68a9f;
            text-decoration: none;
            transition: all 0.3s;
            position: relative;
            padding: 2px 0;
        }

        .links a:hover {
            color: #d97a8f;
        }

        .links a::after {
            content: '';
            position: absolute;
            width: 0;
            height: 1px;
            bottom: 0;
            left: 0;
            background-color: #e68a9f;
            transition: width 0.3s;
        }

        .links a:hover::after {
            width: 100%;
        }

        /* Improved error message styling */
        .error-message {
            color: #e74c3c;
            margin-top: 15px;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            background-color: #ffeaea;
            border-radius: 10px;
            border-left: 3px solid #e74c3c;
            display: none;
        }

        /* Only display error message when it has content */
        .success-message {
            color: #27ae60;
            margin-top: 15px;
            padding: 10px;
            text-align: center;
            font-size: 14px;
            background-color: #e8f8f0;
            border-radius: 10px;
            border-left: 3px solid #27ae60;
            display: none;
        }

        .success-message:not(:empty) {
            display: block;
            animation: fadeIn 0.3s ease-in-out;
        }

        /* Only display error message when it has content */
        .success-message:not(:empty) {
            display: block;
            animation: fadeIn 0.3s ease-in-out;
        }        

        @keyframes fadeIn {
            from { opacity: 0; transform: translateY(-5px); }
            to { opacity: 1; transform: translateY(0); }
        }

        /* Cake icon decoration */
        .login-header::before {
            content: "🧁";
            font-size: 32px;
            display: block;
            margin-bottom: 15px;
        }

        /* Google login button styling */
        .google-login {
            display: block;
            background-color: #fff;
            color: #757575;
            border: 1px solid #ffd6de;
            border-radius: 12px;
            padding: 12px 20px;
            margin-top: 15px;
            text-align: center;
            text-decoration: none;
            font-size: 15px;
            font-weight: 500;
            transition: all 0.3s;
        }

        .google-login:hover {
            background-color: #fafafa;
            box-shadow: 0 2px 8px rgba(0,0,0,0.05);
        }

        .google-login::before {
            content: "🔑";
            margin-right: 8px;
        }

        /* reCAPTCHA container */
        .g-recaptcha {
            display: flex;
            justify-content: center;
            margin: 20px 0;
        }

        /* reCAPTCHA error message */
        #error {
            color: #e74c3c;
            font-size: 13px;
            margin-top: 5px;
            font-weight: 500;
            background-color: #ffeaea;
            padding: 5px 10px;
            border-radius: 8px;
            display: none;
        }

        #error:not(:empty) {
            display: block;
            animation: fadeIn 0.3s ease-in-out;
        }

        /* Input validation styling */
        .login-form input:invalid:focus {
            border-color: #e74c3c;
            box-shadow: 0 0 0 3px rgba(231, 76, 60, 0.1);
        }

        /* Form field validation message */
        .form-group .validation-message {
            color: #e74c3c;
            font-size: 12px;
            margin-top: 5px;
            display: none;
        }

        .form-group input:invalid:focus + .validation-message {
            display: block;
        }
    </style>
</head>
<body>
    <div class="login-container">
        <div class="login-header">
            <h1>Sweet Welcome</h1>
            <p>Please login to your cake shop account</p>
        </div>
        
        <form class="login-form" action="MainController" method="POST">
            <div class="form-group">
                <label for="userID">User ID</label>
                <input type="text" id="userID" name="userID" placeholder="Enter your user ID" required/>
            </div>
            
            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter your password" required/>
            </div>
            <div style="text-align: center">
                <div class="g-recaptcha" data-sitekey="6LeShPsqAAAAAASOr9OEKzEsEEsDGBopkkmTpvjh"></div>
                <div id="error" style="color: red"></div>
            </div>
            <div class="button-group">
                <input id="submit" type="submit" name="action" value="Login" />
                <input type="reset" value="Reset" />
            </div>
        </form>
             <a href="https://accounts.google.com/o/oauth2/auth?scope=email%20profile&redirect_uri=http://localhost:8084/Cake_Wed_V1/LoginGoogleController&response_type=code&client_id=444427940557-13fejonrmqda02nd0gvbjgpkdtkm9qhh.apps.googleusercontent.com&approval_prompt=force">Login With Google</a>
             
        <div class="links">
            <a href="createUser.jsp">Sign Up</a>
            <a href="MainController?action=Shopping">Browse Cakes</a>
        </div>
        
        <!-- Thong Bao -->
        <c:set var="message" value="${requestScope.ERROR}" />
        <c:if test="${empty message}">
            <c:set var="message" value="" />
        </c:if>
        <div class="error-message">${message}</div>
        <!-- -->
        <c:set var="loginMailMess" value="${requestScope.ERROR_MESS}" />
        <c:if test="${empty loginMailMess}">
            <c:set var="loginMailMess" value="" />
        </c:if>
        <div class="error-message">${loginMailMess}</div>
        <!-- -->
        <c:set var="successSignUp" value="${requestScope.SUCCESS}" />
        <c:if test="${empty successSignUp}">
            <c:set var="successSignUp" value="" />
        </c:if>
        <div class="success-message">${successSignUp}</div>
    </div>
    
        <script src="https://www.google.com/recaptcha/api.js" async defer></script>
        <script>
                window.onload = function(){
                    let isValid = false;
                    const form = document.querySelector(".login-form");
                    const error = document.querySelector("#error");
                    form.addEventListener("submit", function(event){
                        const response = grecaptcha.getResponse();
                        if(!response){
                            event.preventDefault();
                            error.innerHTML = "Please check valid captcha!";
                        }else{
                            error.innerHTML = "";
                        }
                    });                
                };
        </script>
</body>
</html>