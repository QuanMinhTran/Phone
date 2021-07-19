<%-- 
    Document   : listcomputer
    Created on : Mar 12, 2021, 10:31:11 AM
    Author     : Admin
--%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>List Computer</title>
    </head>
    <body>
        <h1>Computer Management</h1>
        <c:if test ="${requestScope.listComputers!=null}">
            <c:if test = "${not empty requestScope.listComputers}" var = "testEmpty">
                <table border = "1">
                    <thead>
                        <tr>
                            <th>ID</th>
                            <th>CPU</th>
                            <th>VGA</th>
                            <th>HardDisk</th>
                            <th>RAM</th>
                            <th>Monitor</th>
                            <th>Room</th>
                            <th></th>
                        </tr>
                    </thead>
                    <tbody>
                        <c:forEach items="${requestScope.listComputers}" var="dto">
                        <form action="loadByID" method="POST">
                            <tr>
                                <td> 
                                    ${dto.id}
                                </td>
                                <td>${dto.cpu}</td>
                                <td>${dto.vga}</td>
                                <td>${dto.hardDisk}</td>
                                <td>${dto.ram}</td>
                                <td>${dto.monitor}</td>
                                <td>${dto.room.name}</td>
                                <td>
                                    <c:url value="delete" var="deleteLink">
                                        <c:param name="id" value="${dto.id}"/>
                                    </c:url>    
                                    <a href="${deleteLink}">Delete</a>
                                </td>
                            </tr>
                        </form>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
        <c:if test="${!testEmpty}">
            <h2>No Computer here</h2>
        </c:if>
    </c:if>
    <c:url value="loadRoom" var="loadRoomLink"/>
    <a href="${loadRoomLink}">Create new computer</a>
</body>
</html>
