<%-- 
    Document   : topuser.jsp
    Created on : 25-03-2025, 17:02:37
    Author     : ADMIN
--%>

<%@page import="model.UserDTO"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
        <%
            UserDTO userTop1 = (UserDTO) request.getAttribute("TOP1_USER");
        %>
        UserID: <%= userTop1.getUserID() %><br/>
        RoleID: <%= userTop1.getRoleID() %>
    </body>
</html>
