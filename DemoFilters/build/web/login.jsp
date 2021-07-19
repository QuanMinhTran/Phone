<%-- 
    Document   : login
    Created on : Mar 12, 2021, 10:25:48 AM
    Author     : Admin
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Login</title>
    </head>
    <body>
        <h1>Login for staff member</h1>
        <font color = "red"> ${requestScope.ERRORNOTLOGIN}</font>
        <font color = "red"> ${requestScope.ERROR}</font>
        <form action="login" method="POST">
            <table>
                <tr>
                    <td>Username</td>
                    <td>: <input type="text" name="txtUsername" value="${param.txtUsername}"/></td>
                </tr>
                <tr>
                    <td>Password</td>
                    <td>: <input type="password" name="txtPassword"/></td>
                </tr>
                <tr>
                    <td colspan="2"><input type="submit" value="login"/></td>
                </tr>
            </table>
        </form>
    </body>
</html>
