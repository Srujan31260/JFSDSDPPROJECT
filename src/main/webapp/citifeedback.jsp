<%@page import="com.klef.jfsd.sdp.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Citizen citi = (Citizen) session.getAttribute("citi");
if(citi==null)
{
    response.sendRedirect("citisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Issue Submission Form</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- FontAwesome Icons -->
    <style>
        
        :root {
            --primary-color: #1E90FF; 
            --secondary-color: #FF6347; 
            --input-border-color: #ddd;
            --focus-color: #FFD700; 
            --text-color: #333;
            --button-color: #FF1493; 
            --background-color: #F0F8FF; 
        }

        
        h4 {
            font-family: 'Arial', sans-serif;
            text-align: center;
            font-size: 2rem;
            color: #335C81;
            padding: 20px 0;
            text-transform: uppercase;
            letter-spacing: 2px;
            margin-bottom: 30px;
        }

        form {
            background-color: #fff;
            border-radius: 20px;
            box-shadow: 0px 10px 30px rgba(0, 0, 0, 0.1);
            padding: 40px;
            width: 60%;
            margin: 0 auto;
            animation: slideUp 0.8s ease-out;
        }

        @keyframes slideUp {
            from {
                opacity: 0;
                transform: translateY(30px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

       
        input[type="text"],
        select,
        textarea {
            width: 100%;
            padding: 12px;
            margin-bottom: 18px;
            border: 2px solid var(--input-border-color);
            border-radius: 10px;
            font-size: 1.1rem;
            color: var(--text-color);
            box-sizing: border-box;
            transition: all 0.3s ease;
        }

        input[type="text"]:focus,
        select:focus,
        textarea:focus {
            border-color: var(--focus-color);
            box-shadow: 0 0 10px var(--focus-color);
        }

        textarea {
            resize: vertical;
            min-height: 120px;
        }

        label {
            font-size: 1.1rem;
            font-weight: bold;
            color: var(--text-color);
            margin-bottom: 8px;
            display: flex;
            align-items: center;
        }

        label i {
            margin-right: 10px;
            color: var(--primary-color);
        }

      
        .button-container {
            display: flex;
            justify-content: space-between;
            gap: 15px;
        }

        input[type="submit"],
        input[type="reset"] {
            width: 48%;
            padding: 15px;
            background-color: var(--button-color);
            border: none;
            color: #fff;
            font-size: 1.2rem;
            font-weight: bold;
            border-radius: 10px;
            cursor: pointer;
            transition: transform 0.3s ease, background-color 0.4s ease;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: var(--secondary-color);
            transform: scale(1.05);
        }

        input[type="submit"]:active,
        input[type="reset"]:active {
            transform: scale(1);
        }

        .button-container input[type="submit"]:before {
            content: "\f058"; 
            font-family: 'FontAwesome';
            margin-right: 10px;
        }

        .button-container input[type="reset"]:before {
            content: "\f00d"; 
            font-family: 'FontAwesome';
            margin-right: 10px;
        }

       
        table {
            width: 100%;
            margin-bottom: 20px;
        }

        td {
            padding: 10px;
        }

        a {
            text-align: center;
            display: block;
            margin-top: 20px;
            text-decoration: none;
            color: var(--primary-color);
            font-size: 1.3rem;
            font-weight: bold;
            text-transform: uppercase;
            letter-spacing: 2px;
            transition: color 0.3s ease;
        }

        a:hover {
            color: var(--secondary-color);
        }

        .form-title {
            color: var(--primary-color);
            font-size: 1.6rem;
        }
    </style>
</head>
<body style="background-color: var(--background-color);">

    <h4>Feedback Form</h4>
    <form method="post" action="submitfdback">
        <table>
            <tr>
                <td><label for="name"><i class="fas fa-user"></i>Name:</label></td>
                <td><input type="text" id="name" name="name" value="<%=citi.getName() %>" required></td>
            </tr>
            <tr>
                <td><label for="constituency"><i class="fas fa-user"></i>Name:</label></td>
                <td><input type="text" id="constituency" name="constituency" value="<%=citi.getConstituency() %>" required></td>
                
            </tr>
            <tr>
                <td><label for="problem"><i class="fas fa-comment-dots"></i>Describe Problem:</label></td>
                <td><textarea name="problem" rows="4" required></textarea></td>
            </tr>
            <tr>
                <td><label for="action"><i class="fas fa-check-circle"></i>Action Status:</label></td>
                <td>
                    <select name="action" required>
                        <option value="">--Select Action Status--</option>
                        <option value="Satisfied">Satisfied</option>
                        <option value="Unsatisfied">Unsatisfied</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="rating"><i class="fas fa-star"></i>Provide Rating:</label></td>
                <td>
                    <select name="rating" required>
                        <option value="">--Select Rating--</option>
                        <option value="1">1 - Poor</option>
                        <option value="2">2 - Fair</option>
                        <option value="3">3 - Good</option>
                        <option value="4">4 - Very Good</option>
                        <option value="5">5 - Excellent</option>
                    </select>
                </td>
            </tr>
            <tr>
                <td><label for="comment"><i class="fas fa-pencil-alt"></i>Additional Comment:</label></td>
                <td><textarea name="comment" rows="4"></textarea></td>
            </tr>
            <tr class="button-container">
                <td><input type="submit" name="Submit" value="Submit"></td>
                <td><input type="reset" name="Clear" value="Clear"></td>
            </tr>
        </table>
    </form>
    <a href="citihome"><i class="fas fa-arrow-left"></i> Back</a>
</body>
</html>
