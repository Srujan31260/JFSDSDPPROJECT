<%@ page import="com.klef.jfsd.sdp.model.Citizen"%>
<%@ page import="com.klef.jfsd.sdp.model.Issue"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>


<%
Citizen citize = (Citizen) session.getAttribute("citi");
if (citize == null) {
    response.sendRedirect("citisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>View All Issues</title>
    <style>
        /* General Styles */
      
        h2 {
            text-align: center;
            font-size: 2rem;
            color: blue;
            margin: 30px 0;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.1);
        }

        /* Main Container */
        .container {
            display: flex;
            justify-content: space-between;
            align-items: flex-start;
            margin: 30px;
            margin-top:35px;
        }

        .image-container {
            flex: 1;
            padding: 42px;
            margin-left:40px;
            max-width: 300px;
            display: flex;
            justify-content: center;
        }

        .image-container img {
            max-width: 100%;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
        }

        .table-container {
            flex: 2;
            padding: 20px;
            max-width: 1000px;
        }

        /* Table Styles */
        .issues-table {
            width: 100%;
            border-collapse: collapse;
            box-shadow: 0 15px 30px rgba(0, 0, 0, 0.1);
            border-radius: 12px;
        }

        .issues-table thead {
            background: linear-gradient(90deg, #6200ea, #7b1fa2);
            color: white;
            text-transform: uppercase;
            font-size: 1.1rem;
            
        }

        .issues-table th,
        .issues-table td {
            padding: 15px;
            text-align: center;
            transition: all 0.3s ease-in-out;
        }

        .issues-table th {
            font-weight: bold;
            letter-spacing: 1px;
            background:blue;
        }

        .issues-table tr:nth-child(even) {
            background-color: #f4f4f9;
        }

        .issues-table tr:nth-child(odd) {
            background-color: #ffffff;
        }

        .issues-table tr:hover {
            background-color: #f1e6ff;
            transform: scale(1.02);
        }

        .issues-table td {
            font-size: 1rem;
        }

        .issues-table td:hover {
            background-color: #f1e6ff;
            cursor: pointer;
        }

        /* Back Link */
        .back-link {
            display: block;
            width: fit-content;
            margin: 20px auto;
            padding: 12px 25px;
            font-size: 1.2rem;
            color: #ffffff;
            background: blue;
            text-align: center;
            text-decoration: none;
            border-radius: 8px;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        .back-link:hover {
           
            transform: scale(1.05);
        }

        /* Responsive Styles */
        @media screen and (max-width: 768px) {
            .issues-table {
                font-size: 0.9rem;
                width: 100%;
                margin: 20px;
            }

            .issues-table th,
            .issues-table td {
                padding: 10px;
            }
        }

        @media screen and (max-width: 480px) {
            h2 {
                font-size: 1.8rem;
            }

            .container {
                flex-direction: column;
                align-items: center;
            }

            .image-container {
                margin-bottom: 20px;
            }
        }
    </style>
    <!-- Font Awesome Icons -->
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
</head>
<body>
<%@ include file="citinavbar.jsp" %>
<%=citize.getName() %>
    <h2>View Submitted Issues</h2>

    <div class="container">
        <!-- Image Section -->
        <div class="image-container">
            <img src="https://cdn-icons-png.freepik.com/256/17116/17116581.png?ga=GA1.1.1396752292.1730723171&semt=ais_hybrid" alt="Issue Icon">
        </div>

        <!-- Table Section -->
        <div class="table-container">
            <table class="issues-table">
                <thead>
                    <tr>
                        <th><i class="fas fa-id-card"></i> Id</th>
                        <th><i class="fas fa-credit-card"></i> Aadhaar Number</th>
                        <th><i class="fas fa-user"></i> Name</th>
                        <th><i class="fas fa-map-marker-alt"></i> Constituency</th>
                        <th><i class="fas fa-home"></i> Address</th>
                        <th><i class="fas fa-exclamation-circle"></i> Problem</th>
                        <th><i class="fas fa-check-circle"></i> Solution</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach items="${issulist}" var="issu">
                        <tr>
                            <td><c:out value="${issu.rid}"/></td>
                            <td><c:out value="${issu.adno}"/></td>
                            <td><c:out value="${issu.name}"/></td>
                            <td><c:out value="${issu.constituency}"/></td>
                            <td><c:out value="${issu.address}"/></td>
                            <td><c:out value="${issu.problem}"/></td>
                            <td><c:out value="${issu.solution}"/></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
            <a href="citihome" class="back-link"><i class="fas fa-arrow-left"></i> Back</a>
        </div>
    </div>

</body>
</html>
