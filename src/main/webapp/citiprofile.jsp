<%@page import="com.klef.jfsd.sdp.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
Citizen cit = (Citizen) session.getAttribute("citi");
if(cit == null)
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
    <title>My Profile</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css"> <!-- FontAwesome Icons -->
    <style>
       
        :root {
            --primary-color: #4e8bc6; 
            --secondary-color: #ff6347; 
            --background-color: #f4f7fc;
            --text-color: #333;
            --button-color: #ff8a00;
            --hover-color: #ff6347;
            --card-background-color: #ffffff;
            --border-radius: 15px;
            --box-shadow: 0 4px 20px rgba(0, 0, 0, 0.1);
        }

      
        body {
            background-color: var(--background-color);
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            color: var(--text-color);
        }

        header {
            background-color: var(--primary-color);
            color: #fff;
            text-align: center;
            padding: 20px;
            font-size: 2rem;
            font-weight: bold;
            letter-spacing: 1px;
        }

        .profile-container {
            display: flex;
            justify-content: center;
            padding: 40px;
        }

        .profile-card {
            background-color: var(--card-background-color);
            border-radius: var(--border-radius);
            box-shadow: var(--box-shadow);
            width: 350px;
            margin: 20px;
            text-align: center;
            padding: 30px;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .profile-card:hover {
            transform: translateY(-10px);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.15);
        }

        .profile-image {
            width: 120px;
            height: 120px;
            background-color: var(--primary-color);
            color: #fff;
            border-radius: 50%;
            font-size: 3rem;
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px auto;
            transition: background-color 0.3s ease;
        }

        .profile-image:hover {
            background-color: var(--secondary-color);
        }

        .profile-info {
            font-size: 1.2rem;
            line-height: 1.6;
            margin-bottom: 20px;
        }

        .profile-info b {
            color: var(--primary-color);
        }

        .social-links {
            display: flex;
            justify-content: center;
            gap: 20px;
            margin-top: 20px;
        }

        .social-links i {
            font-size: 1.8rem;
            color: var(--primary-color);
            cursor: pointer;
            transition: color 0.3s ease;
        }

        .social-links i:hover {
            color: var(--hover-color);
        }

        .back-button {
            display: inline-block;
            margin-top: 30px;
            padding: 12px 25px;
            background-color: var(--primary-color);
            color: #fff;
            font-size: 1.2rem;
            border-radius: var(--border-radius);
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .back-button:hover {
            background-color: var(--secondary-color);
        }

      
        @media screen and (max-width: 768px) {
            .profile-container {
                flex-direction: column;
                align-items: center;
            }

            .profile-card {
                width: 90%;
            }
        }
    </style>
</head>
<body>
    

    <div class="profile-container">
        <div class="profile-card">
           
            <div class="profile-image">
                <i class="fas fa-user"></i> 
            </div>

            <div class="profile-info">
                <p><b>ID:</b> <%= cit.getAadhaarno() %></p>
                <p><b>Name:</b> <%= cit.getName() %></p>
                <p><b>Gender:</b> <%= cit.getGender() %></p>
                <p><b>Address:</b> <%= cit.getAddress() %></p>
                <p><b>Constituency:</b> <%= cit.getConstituency() %></p>
                <p><b>Email:</b> <%= cit.getEmail() %></p>
                <p><b>Phone Number:</b> <%= cit.getPhno() %></p>
            </div>

            <div class="social-links">
                <a href="https://facebook.com" target="_blank"><i class="fab fa-facebook"></i></a>
                <a href="https://twitter.com" target="_blank"><i class="fab fa-twitter"></i></a>
                <a href="https://linkedin.com" target="_blank"><i class="fab fa-linkedin"></i></a>
                <a href="https://instagram.com" target="_blank"><i class="fab fa-instagram"></i></a>
            </div>

            <a href="citihome.jsp" class="back-button">Back to Dashboard</a>
        </div>
    </div>
</body>
</html>
