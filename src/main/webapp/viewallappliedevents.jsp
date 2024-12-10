<%@page import="com.klef.jfsd.sdp.model.Politician"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
Politician poli = (Politician) session.getAttribute("politician");
if (poli == null) {
    response.sendRedirect("polisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>View Applied Events</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
    <style>
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f9f9fb;
            margin: 0;
            padding: 0;
            color: #333;
        }

        h4 {
            font-size: 25px;
            text-align: center;
            color: #2c3e50;
            margin: 30px 0;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        h4 u {
            text-decoration-color: #3498db;
            text-decoration-thickness: 2px;
        }

        .container {
            display: flex;
            flex-wrap: wrap;
            justify-content: center;
            align-items: flex-start;
            gap: 20px;
            width: 90%;
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
            background: #ffffff;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        }

        .image-container {
            flex: 1;
            max-width: 300px;
            text-align: center;
        }

        .image-container img {
            width: 100%;
            height: auto;
            border-radius: 12px;
            box-shadow: 0 6px 15px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            flex: 2;
            max-width: 900px;
            overflow-x: auto;
            margin-top:45px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            border-radius: 5px;
            overflow: hidden;
            background-color: white;
        }

        th, td {
            padding: 15px;
            text-align: left;
            border-bottom: 1px solid #e5e5e5;
            font-size: 16px;
        }

        th {
            background-color: #2c3e50;
            color: #fff;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: rgba(52, 152, 219, 0.1);
            cursor: pointer;
        }

        .message {
            text-align: center;
            color: #e74c3c;
            margin: 10px 0;
            font-size: 18px;
        }

        @media (max-width: 768px) {
          
            th, td {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <%@include file="polinavbar.jsp" %>

    <h4><u>View Applied Events</u></h4>

    <div class="container">
        <!-- Image Section -->
        <div class="image-container">
            <img src="https://img.freepik.com/premium-vector/social-events-icon-vector-image-can-be-used-elderly-care_120816-124190.jpg" 
                 alt="Events Illustration">
        </div>

        <!-- Table Section -->
        <div class="table-container">
            <div class="message">
                <c:out value="${message}"></c:out>
            </div>
            <table>
                <tr>
                    <th><i class="fas fa-id-card"></i> ID</th>
                    <th><i class="fas fa-fingerprint"></i> Aadhaar Number</th>
                    <th><i class="fas fa-user"></i> Name</th>
                    <th><i class="fas fa-map-marker-alt"></i> Constituency</th>
                    <th><i class="fas fa-calendar-alt"></i> Event ID</th>
                    <th><i class="fas fa-clipboard"></i> Event Title</th>
                    <th><i class="fas fa-clock"></i> Applied Time</th>
                </tr>
                <c:forEach items="${eventlist}" var="appliedEvent">
                    <tr>
                        <td><c:out value="${appliedEvent.id}"/></td>
                        <td><c:out value="${appliedEvent.aadhaarno}"/></td>
                        <td><c:out value="${appliedEvent.name}"/></td>
                        <td><c:out value="${appliedEvent.constituency}"/></td>
                        <td><c:out value="${appliedEvent.eid}"/></td>
                        <td><c:out value="${appliedEvent.title}"/></td>
                        <td><c:out value="${appliedEvent.appliedtime}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>
</body>
</html>
