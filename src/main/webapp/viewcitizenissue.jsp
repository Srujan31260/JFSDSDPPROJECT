<%@page import="com.klef.jfsd.sdp.model.Politician"%>
<%@ page import="com.klef.jfsd.sdp.model.Citizen"%>
<%@ page import="com.klef.jfsd.sdp.model.Issue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Politician poli = (Politician) session.getAttribute("politician");
if(poli == null) {
    response.sendRedirect("polisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View Issue Details</title>
    
    <!-- Font Awesome for icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
    	/* Page Title */
h2 {
    font-size: 36px;
    color: #2980b9;
    font-weight: 700;
    text-align: center;
    margin-top: 60px;
    text-transform: uppercase;
    letter-spacing: 3px;
    margin-bottom: 40px;
}

/* Container for Card and Image */
.container {
    display: flex;
    justify-content: center;
    align-items: flex-start;
    max-width: 1200px;
    margin: 0 auto;
    padding: 20px;
    background-color: #ffffff;
    border-radius: 12px;
    box-shadow: 0 12px 35px rgba(0, 0, 0, 0.1);
    gap: 30px;
    transition: all 0.3s ease;
}

.container:hover {
    transform: scale(1.02);
}

/* Image Container */
.image-container {
    flex-basis: 40%;
    position: relative;
    border-radius: 12px;
    overflow: hidden;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.15);
}

.image-container img {
    width: 100%;
    height: auto;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.image-container img:hover {
    transform: scale(1.1);
    box-shadow: 0 0 15px rgba(0, 0, 0, 0.25);
}

/* Card-like Table */
.card-container {
    flex-basis: 60%;
    padding: 25px;
    background-color: #f9fafb;
    border-radius: 12px;
    box-shadow: 0 6px 20px rgba(0, 0, 0, 0.1);
}

table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 20px;
}

th {
    background-color: #2980b9;
    color: white;
    padding: 15px 20px;
    text-align: left;
    font-size: 18px;
    font-weight: bold;
    border-radius: 8px 8px 0 0;
}

td {
    padding: 15px 20px;
    text-align: left;
    font-size: 16px;
    color: #34495e;
    border-bottom: 1px solid #ddd;
    transition: background-color 0.3s ease;
}

td:hover {
  
    cursor: pointer;
}

/* Link Styling */
a {
    color: #2980b9;
    text-decoration: none;
    font-weight: bold;
    padding: 8px 15px;
    border-radius: 5px;
    transition: background-color 0.3s ease, color 0.3s ease;
}

/* Removed hover effect for "View" link */
a:hover {
    background-color: transparent;
    color: #2980b9;
}

/* Button Styling */
.button {
    background-color: #2980b9;
    color: white;
    border: none;
    padding: 12px 24px;
    cursor: pointer;
    border-radius: 5px;
    font-size: 16px;
    transition: background-color 0.3s ease, transform 0.2s ease;
    text-decoration: none;
    display: inline-block;
    margin-top: 30px;
    text-align: center;
}

.button:hover {
   
    transform: translateY(-3px);
}

/* Icon Styling for Links */
i {
    margin-right: 8px;
}

/* Responsive Design */
@media (max-width: 768px) {
    h2 {
        font-size: 28px;
    }

    .container {
        flex-direction: column;  
        align-items: center;
    }

    .image-container {
        margin-bottom: 20px;
        width: 100%;
        height: auto;
    }

    .card-container {
        width: 100%;
        margin: 0 auto;
    }

    table, th, td {
        padding: 10px;
    }

    .button {
        font-size: 14px;
        padding: 10px 18px;
    }
}
    	
    </style>
</head>
<body>
   
    <%@ include file="polinavbar.jsp" %>
    <h2>View Submitted Issue</h2>
    
    <div class="container">
        <!-- Left Side Image -->
        <div class="image-container">
            <img src="https://cdn-icons-png.flaticon.com/512/7871/7871664.png" alt="Issue Image">
        </div>

        <!-- Card and Table -->
        <div class="card-container">
            <table>
                <tr>
                    <th>Id</th>
                    <th>AadharNo</th>
                    <th>Name</th>
                    <th>Constituency</th>
                    <th>Address</th>
                    <th>Problem</th>
                    <th>Result</th>
                </tr>
                <c:forEach items="${issulist}" var="issu">
                    <tr>
                        <td><c:out value="${issu.rid}"/></td>
                        <td><c:out value="${issu.adno}"/></td>
                        <td><c:out value="${issu.name}"/></td>
                        <td><c:out value="${issu.constituency}"/></td>
                        <td><c:out value="${issu.address}"/></td>
                        <td><c:out value="${issu.problem}"/></td>
                        <td><a href="updateissue?id=${issu.rid}"><i class="fas fa-eye"></i>View</a></td>
                    </tr>
                </c:forEach>
            </table>
        </div>
    </div>

    <a href="polihome" class="button"><i class="fas fa-arrow-left"></i>Back</a>
</body>
</html>
