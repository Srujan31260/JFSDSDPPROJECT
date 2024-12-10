
<%@page import="com.klef.jfsd.sdp.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Citizen citiz = (Citizen) session.getAttribute("citi");
if(citiz==null)
{
	response.sendRedirect("citisessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Issue Submission Form</title>
    <style>
        
        .main-container {
            display: flex;
            max-width: 1200px;
            margin: 50px auto;
            border-radius: 20px;
            box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
            background: #ffffff;
        }

        .image-section {
            flex: 1;
            background: url('https://vervemedia.co.in/images/blog/mobile.jpg') no-repeat center center;
            background-size: cover;
            position: relative;
        }

        .image-overlay {
            position: absolute;
            inset: 0;
            background: rgba(0, 0, 0, 0.4);
            display: flex;
            justify-content: center;
            align-items: center;
        }

        .image-overlay h2 {
            color: #ffffff;
            font-size: 2.5rem;
            font-weight: bold;
            text-shadow: 2px 2px 4px rgba(0, 0, 0, 0.8);
            text-align: center;
        }

        .form-section {
            flex: 1.5;
            padding: 40px;
            background: #f9f9f9;
        }

        h2 {
            text-align: center;
            font-size: 2.2rem;
            color: #007bff;
            margin-bottom: 30px;
        }

        .form-group {
            margin-bottom: 20px;
        }

        .form-group label {
            font-size: 1.2rem;
            font-weight: bold;
            color: #333;
            display: flex;
            align-items: center;
            margin-bottom: 10px;
           
        }

        .form-group label i {
            margin-right: 10px;
            font-size: 1.5rem;
            color: #007bff;
        }

        .form-group input,
        .form-group textarea {
            width: 100%;
            padding: 12px;
            font-size: 1.1rem;
            border: 2px solid #ccc;
            border-radius: 8px;
            background: #ffffff;
            transition: all 0.3s ease;
        }

        .form-group input:focus,
        .form-group textarea:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        }

        .form-group textarea {
            resize: none;
            height: 100px;
        }

        
        .form-actions {
            display: flex;
            justify-content: space-between;
            margin-top: 20px;
        }

        .form-actions input {
            padding: 10px 20px;
            font-size: 1.1rem;
            font-weight: bold;
            color: #fff;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .form-actions input[type="submit"] {
            background: #007bff;
        }

        .form-actions input[type="submit"]:hover {
            background: #0056b3;
        }

        .form-actions input[type="reset"] {
            background: #dc3545;
        }

        .form-actions input[type="reset"]:hover {
            background: #c82333;
        }

        
        .back-link {
            display: block;
            margin-top: 20px;
            font-size: 1.1rem;
            font-weight: bold;
            color: #007bff;
            text-decoration: none;
            text-align: center;
        }

        .back-link:hover {
            color: #0056b3;
        }
    </style>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
</head>
<body>

<%@ include file="citinavbar.jsp" %>
    <div class="main-container">
       
        <div class="image-section">
            <div class="image-overlay">
                <h2>Welcome Back <%=citiz.getName() %></h2>
            </div>
        </div>
        
        <div class="form-section">
            <h2>Submit an Issue</h2>
            <form method="post" action="submitissue">
               
                <div class="form-group">
                    <label for="adno"><i class="fas fa-id-card"></i> Aadhaar No:</label>
                    <input type="number" id="adno" name="adno" value="<%=citiz.getAadhaarno() %>" required>
                </div>

                <div class="form-group">
                    <label for="name"><i class="fas fa-user"></i> Name:</label>
                    <input type="text" id="name" name="name" value="<%=citiz.getName() %>" required>
                </div>

                <div class="form-group">
                    <label for="constituency"><i class="fas fa-map-marker-alt"></i> Constituency:</label>
                    <input type="text" id="constituency" name="constituency" value="<%=citiz.getConstituency() %>" required>
                </div>

                <div class="form-group">
                    <label for="address"><i class="fas fa-home"></i> Address:</label>
                    <input type="text" id="address" name="address" value="<%=citiz.getAddress() %>" required>
                </div>

                <div class="form-group">
                    <label for="problem"><i class="fas fa-exclamation-circle"></i> Problem:</label>
                    <textarea id="problem" name="problem" required></textarea>
                </div>

                <div class="form-actions">
                    <input type="submit" value="Submit Issue">
                    <input type="reset" value="Reset Issue">
                </div>

                <a href="citihome" class="back-link"><i class="fas fa-arrow-left"></i> Back</a>
            </form>
        </div>
    </div>
</body>
</html>
