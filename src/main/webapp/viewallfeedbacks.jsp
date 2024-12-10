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
<title>View All Feedbacks</title>

<!-- Font Awesome for Icons -->
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

<style>

    /* Header Styling */
    h3 {
        font-size: 32px;
        color: #2c3e50;
        font-weight: bold;
        text-align: center;
        margin-top: 20px;
        margin-bottom: 40px;
        text-transform: uppercase;
        letter-spacing: 2px;
    }

    h3 u {
        text-decoration-color: #3498db;
        text-decoration-thickness: 3px;
    }

    /* Card Container */
    .card {
        width: 100%;
        max-width: 1400px;
        background-color: white;
        border-radius: 12px;
        box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
        overflow: hidden;
        display: flex;
        flex-direction: row;
        margin: 20px auto;
    }

    /* Table Section */
    .table-section {
        flex: 2;
        padding: 20px;
        display: flex;
        flex-direction: column;
    }

    .feedback-table {
        width: 100%;
        border-collapse: collapse;
        background-color: #fff;
        border-radius: 12px;
        overflow: hidden;
        box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
    }

    .feedback-table th {
        background-color: #2980b9;
        color: white;
        font-size: 18px;
        text-align: left;
        padding: 15px;
        font-weight: bold;
        border: 1px solid #ddd;
        text-transform: uppercase;
    }

    .feedback-table td {
        padding: 15px;
        font-size: 16px;
        color: #34495e;
        border: 1px solid #ddd;
        text-align: left;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .feedback-table tr:nth-child(even) {
        background-color: #f7f9fc;
    }

    .feedback-table tr:hover {
        background-color: #eaf2f8;
        cursor: pointer;
        color: #1abc9c;
    }

    .feedback-table tr:last-child td {
        border-bottom: none;
    }

    .feedback-table td i {
        margin-right: 10px;
        color: #2980b9;
    }

    /* Image Section */
    .image-section {
        flex: 1;
        width: 100%;
        background-image: url('https://mirro.io/hs-fs/hubfs/Imported_Blog_Media/1-feedback-descriptive-2.jpg?width=600&height=400&name=1-feedback-descriptive-2.jpg');
        background-size: cover;
        background-position: center;
        background-repeat: no-repeat;
        border-radius: 0 12px 12px 0;
    }

    /* Responsive Design */
    @media (max-width: 768px) {
        .card {
            flex-direction: column;
        }

        .image-section {
            height: 200px;
            border-radius: 0 0 12px 12px;
        }

        .feedback-table th, .feedback-table td {
            font-size: 14px;
            padding: 10px;
        }
    }
</style>
</head>
<body>
<%@include file="polinavbar.jsp" %>

<h3><u>View All Feedback</u></h3>

<!-- Main Card -->
<div class="card">
    <!-- Table Section -->
    <div class="table-section">
        <table class="feedback-table">
            <tr>
                <th><i class="fas fa-id-badge"></i> ID</th>
                <th><i class="fas fa-user"></i> Name</th>
                 <th><i class="fas fa-user"></i> constituency</th>
                <th><i class="fas fa-exclamation-circle"></i> Problem</th>
                <th><i class="fas fa-tools"></i> Action</th>
                <th><i class="fas fa-star"></i> Rating</th>
                <th><i class="fas fa-comment-dots"></i> Comment</th>
            </tr>
            <c:forEach items="${fblist}" var="feedback">
                <tr>
                    <td><i class="fas fa-id-badge"></i> <c:out value="${feedback.fid}"/></td>
                    <td><i class="fas fa-user"></i> <c:out value="${feedback.name}"/></td>
                    <td><i class="fas fa-user"></i> <c:out value="${feedback.constituency}"/></td>
                    <td><i class="fas fa-exclamation-circle"></i> <c:out value="${feedback.problem}"/></td>
                    <td><i class="fas fa-tools"></i> <c:out value="${feedback.action}"/></td>
                    <td><i class="fas fa-star"></i> <c:out value="${feedback.rating}"/></td>
                    <td><i class="fas fa-comment-dots"></i> <c:out value="${feedback.comment}"/></td>
                </tr>
            </c:forEach>
        </table>
    </div>

    <!-- Image Section -->
    <div class="image-section"></div>
</div>

</body>
</html>
