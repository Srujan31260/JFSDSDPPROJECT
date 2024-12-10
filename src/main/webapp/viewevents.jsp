<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%@page import="com.klef.jfsd.sdp.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%
Citizen cit = (Citizen) session.getAttribute("citi");
if (cit == null) {
    response.sendRedirect("citisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Events</title>
    
    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    
    <style>
    /* General Body Styling */
    body {
        font-family: 'Arial', sans-serif;
        background-color: #E3F2FD; /* Light blue background */
        color: #333; /* Dark grey text */
        margin: 0;
        padding: 0;
    }

    /* Container Styling */
    .container {
        width: 85%;
        margin: 30px auto;
        background-color: #ffffff; /* White container */
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    /* Header Style */
    h3 {
        text-align: center;
        font-size: 2.2em;
        font-weight: bold;
        color: #0277bd; /* Dark blue */
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
    }

    /* Table Styles */
    table {
        width: 100%;
        border-collapse: collapse;
        margin: 20px 0;
        background-color: #ffffff;
        box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
    }

    th, td {
        padding: 16px 20px;
        text-align: left;
        font-size: 1.1em;
        color: #333; /* Dark grey text */
        border-bottom: 1px solid #ddd;
    }

    th {
        background-color: #0277bd; /* Dark blue */
        color: white;
        font-weight: bold;
    }

    td {
        background-color: #fafafa;
    }

    /* Hover Effect for Table Rows */
    tr:hover {
        background-color: #81d4fa; /* Light blue hover effect */
        cursor: pointer;
    }

    /* Last Row No Border */
    tr:last-child td {
        border-bottom: none;
    }

    /* Button Styles */
    .apply-btn {
        background-color: #335C81; /* Soft orange */
        color: white;
        border: none;
        padding: 10px 15px;
        font-size: 1em;
        border-radius: 5px;
        cursor: pointer;
        transition: background-color 0.3s ease;
    }

    .apply-btn:hover {
        background-color: #fb8c00; /* Darker orange on hover */
    }

    /* Icon inside Apply Button */
    .apply-icon {
        margin-right: 8px;
    }

    /* Message Styling */
    p {
        text-align: center;
        font-size: 1.1em;
        color: #0277bd; /* Blue text for consistency */
        margin-bottom: 30px;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .container {
            width: 95%;
        }

        th, td {
            font-size: 1em;
            padding: 12px;
        }

        h3 {
            font-size: 1.8em;
        }
    }

    @media (max-width: 480px) {
        th, td {
            font-size: 0.9em;
            padding: 8px 10px;
        }

        h3 {
            font-size: 1.6em;
        }

        .apply-btn {
            font-size: 0.9em;
            padding: 8px 12px;
        }
    }
    </style>
</head>
<body>
    <%@include file="citinavbar.jsp" %>
   
    <div class="container">
        <h3>View All Events</h3>
        <p><c:out value="${message}"></c:out></p>
        <table>
            <tr>
                <th>ID</th>
                <th>Title</th>
                <th>Description</th>
                <th>Constituency</th>
                <th>Location</th>
                <th>Date</th>
                <th>Action</th>
            </tr>
            <c:forEach items="${eventlist}" var="event">
                <tr>
                    <td><c:out value="${event.eid}"/></td>
                    <td><c:out value="${event.title}"/></td>
                    <td><c:out value="${event.description}"/></td>
                    <td><c:out value="${event.constituency}"/></td>
                    <td><c:out value="${event.location}"/></td>
                    <td><c:out value="${event.date}"/></td>
                    <td>
                        <form method="post" action="applyevent">
                            <input type="hidden" name="aAadhaarno" value="<%= cit.getAadhaarno() %>"/>
                            <input type="hidden" name="aname" value="<%= cit.getName() %>"/>
                            <input type="hidden" name="aconstituency" value="<%= cit.getConstituency() %>"/>
                            <input type="hidden" name="aeid" value="${event.eid}"/>
                            <input type="hidden" name="atitle" value="${event.title}"/>
                            <button type="submit" class="apply-btn"><i class="fas fa-check apply-icon"></i>Apply</button>
                        </form>
                    </td>
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
