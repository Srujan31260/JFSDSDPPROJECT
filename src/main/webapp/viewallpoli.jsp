<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%-- <%
Admin ad = (Admin) session.getAttribute("admin");
if(ad ==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%> --%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>View All Politicians</title>
    <style>
h2 {
    font-size: 26px;
    color: #34495e;
    text-align: center;
    margin-bottom: 20px;
}

table {
    width: 95%;
    max-width: 1200px;
    border-collapse: separate;
    border-spacing: 0 10px;
    border-radius: 12px;
    overflow: hidden;
    background-color: white;
    box-shadow: 0px 10px 20px rgba(0, 0, 0, 0.15);
    margin-left:130px;
}

table th {
    background-color: #34495e;
    color: #ffffff;
    font-weight: bold;
    padding: 14px 18px;
    text-align: left;
    font-size: 16px;
    border-top: 2px solid #ecf0f1;
    border-bottom: 2px solid #ecf0f1;
    margin-top:100px;
}

table tr {
    background-color: white;
    transition: all 0.3s ease;
}

table td {
    padding: 14px 18px;
    font-size: 14px;
    color: #34495e;
    border-bottom: 1px solid #ecf0f1;
}

table tr:nth-child(odd) td {
    background-color: #f9fafb;
}

table tr:hover {
    background-color: #f0f8ff;
    transform: scale(1.01);
    box-shadow: 0 0 10px rgba(0, 150, 136, 0.2);
}

table th:first-child, table td:first-child {
    border-top-left-radius: 8px;
    border-bottom-left-radius: 8px;
}

table th:last-child, table td:last-child {
    border-top-right-radius: 8px;
    border-bottom-right-radius: 8px;
}

@media screen and (max-width: 768px) {
    table, tr, td, th {
        display: block;
        width: 100%;
    }
    tr {
        margin-bottom: 20px;
        box-shadow: 0 2px 8px rgba(0, 0, 0, 0.1);
        border-radius: 10px;
        overflow: hidden;
    }
    td, th {
        text-align: left;
        padding: 12px 15px;
    }
}
        
    </style>
</head>
<body>
    <%@include file="adminnavbar.jsp" %>
  
    <h2><u>View All Politicians</u></h2>
    <table>
        <tr>
            <th>ID</th>
            <th>Name</th>
            <th>Gender</th>
            <th>Email</th>
            <th>Constituency</th>
            <th>Contact</th>
            <th>Date of Birth</th>
            <th>Education</th>
            <th>Party</th>
            <th>Previous Position</th>
            <th>Present Position</th>
            <th>State</th>
           
        </tr>
        <c:forEach items="${polilist}" var="poli">
            <tr>
                <td><c:out value="${poli.id}"/></td>
                <td><c:out value="${poli.name}"/></td>
                <td><c:out value="${poli.gender}"/></td>
                <td><c:out value="${poli.email}"/></td>
                <td><c:out value="${poli.constituency}"/></td>
                <td><c:out value="${poli.contact}"/></td>
                <td><c:out value="${poli.dateofbirth}"/></td>
                <td><c:out value="${poli.education}"/></td>
                <td><c:out value="${poli.party}"/></td>
                <td><c:out value="${poli.previousposition}"/></td>
                <td><c:out value="${poli.presentposition}"/></td>
                <td><c:out value="${poli.state}"/></td>
                
            </tr>
        </c:forEach>
    </table>
</body>
</html>
