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
    <title>View All Events</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        

        h4 {
            font-size: 24px;
            color: #2c3e50;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        .container {
            width: 100%;
            max-width: 1400px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            margin: 20px auto;
            padding: 20px;
            display: flex;
            flex-direction: row;
            gap: 20px;
            overflow: hidden;
        }

        .table-container {
            flex: 2;
            overflow-x: auto;
            align-items:center;
            margin-top:70px;
            border-radius:3px;
            
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 0 auto;
            
        }

        th, td {
            text-align: left;
            padding: 12px 15px;
            border-bottom: 1px solid #ddd;
            font-size: 16px;
        }

        th {
            background-color: #3498db;
            color: white;
            font-weight: bold;
            text-transform: uppercase;
        }

        tr:nth-child(even) {
            background-color: #f9f9f9;
        }

        tr:hover {
            background-color: #e1f5fe;
            cursor: pointer;
        }

        td i {
            margin-right: 8px;
            color: #3498db;
        }

        .image-container {
            flex: 1;
            display: flex;
            justify-content: center;
            align-items: center;
            border-left: 1px solid #ddd;
            padding: 20px;
        }

        .image-container img {
            max-width: 100%;
            max-height: 300px;
            border-radius: 12px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .image-container {
                border-left: none;
                border-top: 1px solid #ddd;
            }

            .image-container img {
                max-height: 200px;
            }
        }
    </style>
</head>
<body>
    <%@include file="polinavbar.jsp" %>

    <h4><u>View All Events</u></h4>

    <div class="container">
        <!-- Table Section -->
        <div class="table-container">
            <table>
                <tr>
                    <th><i class="fas fa-id-card"></i> ID</th>
                    <th><i class="fas fa-heading"></i> Title</th>
                    <th><i class="fas fa-info-circle"></i> Description</th>
                    <th><i class="fas fa-map-marker-alt"></i> Constituency</th>
                    <th><i class="fas fa-map-pin"></i> Location</th>
                    <th><i class="fas fa-calendar-alt"></i> Date</th>
                </tr>
                <c:forEach items="${eventlist}" var="event">
                    <tr>
                        <td><i class="fas fa-id-badge"></i> <c:out value="${event.eid}"/></td>
                        <td><i class="fas fa-font"></i> <c:out value="${event.title}"/></td>
                        <td><i class="fas fa-info-circle"></i> <c:out value="${event.description}"/></td>
                        <td><i class="fas fa-globe"></i> <c:out value="${event.constituency}"/></td>
                        <td><i class="fas fa-location-arrow"></i> <c:out value="${event.location}"/></td>
                        <td><i class="fas fa-calendar-day"></i> <c:out value="${event.date}"/></td>
                    </tr>
                </c:forEach>
            </table>
        </div>

        <!-- Image Section -->
        <div class="image-container">
            <img src="https://cdn-icons-png.flaticon.com/512/3209/3209885.png" alt="Event">
        </div>
    </div>
</body>
</html>
