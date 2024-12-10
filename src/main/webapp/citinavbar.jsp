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
    <title>Connect4Change - Citizen</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #E3F2FD;
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #335C81;
            padding: 15px 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar .title {
            display: flex;
            align-items: center;
        }

        .navbar .title img {
            height: 40px;
            margin-right: 10px;
        }

        .navbar .title h3 {
            color: white;
            font-size: 1.5em;
            margin: 0;
        }

        .navbar-center {
            display: flex;
            align-items: center;
        }

        .navbar-center a {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            text-transform: uppercase;
            font-weight: bold;
            font-size: 16px;
            display: flex;
            align-items: center;
            transition: background-color 0.3s;
        }

        .navbar-center a i {
            margin-right: 8px;
        }

        .navbar-center a:hover {
            background-color: #5679A6;
            border-radius: 4px;
        }

        .dropdown {
            position: relative;
        }

        .profile-icon {
            color: white;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 16px;
            cursor: pointer;
            display: flex;
            align-items: center;
        }

        .profile-icon i {
            margin-right: 8px;
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #335C81;
            min-width: 200px;
            z-index: 1;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .dropdown-content a {
            color: white;
            padding: 12px 16px;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 16px;
            text-transform: uppercase;
        }

        .dropdown-content a i {
            margin-right: 8px;
        }

        .dropdown-content a:hover {
            background-color: #5679A6;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
            }

            .navbar-center {
                flex-direction: column;
                align-items: center;
            }

            .navbar-center a, .profile-icon {
                padding: 10px;
                font-size: 14px;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="title">
            <img src="https://files.oaiusercontent.com/file-SY5L532sqjGy0criE0dmz0oT?se=2024-11-14T16%3A41%3A52Z&sp=r&sv=2024-08-04&sr=b&rscc=max-age%3D604800%2C%20immutable%2C%20private&rscd=attachment%3B%20filename%3D14a02497-4f79-4e3b-bb8f-12486bb7a8db.webp&sig=PTR9Wje/zU8tGc3HV986AUZTH5N9vSL1Ien2yyIOEGU%3D" alt="Logo">
            <h3>Connect4Change</h3>
        </div>

        <div class="navbar-center">
            <a href="citihome"><i class="fas fa-home"></i>Home</a>
            <a href="citiissue"><i class="fas fa-exclamation-circle"></i>Report Issue</a>
            <a href="viewallissues"><i class="fas fa-list"></i>View All Issues</a>
        </div>

        <div class="dropdown">
            <div class="profile-icon">
                <i class="fas fa-user"></i> <%=citi.getName() %>
            </div>
            <div class="dropdown-content">
                <a href="citifeedback"><i class="fas fa-comment-dots"></i>Feedback</a>
                <a href="citilogout"><i class="fas fa-sign-out-alt"></i>Logout</a>
                <a href="citiprofile"><i class="fas fa-user-circle"></i>Profile</a>
                <a href="updateciti"><i class="fas fa-edit"></i>Update Profile</a>
                <a href="viewevents"><i class="fas fa-calendar-alt"></i>View Events</a>
                 <a href="changePassword"><i class="fas fa-edit"></i>Change Password</a>
            </div>
        </div>
    </div>
</body>
</html>
