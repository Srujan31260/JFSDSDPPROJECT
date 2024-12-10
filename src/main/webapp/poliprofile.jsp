<%@page import="com.klef.jfsd.sdp.model.Politician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<%
Politician poli  = (Politician) session.getAttribute("politician");
if(poli == null)
{
    response.sendRedirect("polisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Profile Page</title>
    <style>
        .myprofile {
            background-color: #ffffff;
            border-radius: 15px;
            max-width: 800px;
            width: 100%;
            margin: 20px;
            padding: 30px;
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
            display: flex;
            flex-direction: row;
            gap: 20px;
            margin-left:270px;
            margin-top:50px;
            position: relative;
        }

        .profile-image {
            flex: 1;
            display: flex;
            flex-direction: column;
            align-items: center;
            border-right: 1px solid #ddd;
            padding-right: 20px;
        }

        .profile-image img {
            width: 150px;
            height: 150px;
            border-radius: 50%;
            object-fit: cover;
            margin-bottom: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        .profile-info {
            flex: 2;
            padding-left: 20px;
        }

        .profile-info h2 {
            margin: 0;
            color: #333333;
            font-size: 24px;
            font-weight: bold;
            margin-left:-85px;
        }

        .profile-info h4 {
            color: #007bff;
            font-weight: normal;
            margin: 5px 0 15px;
            text-transform:uppercase;
             margin-right:130px;
        }

        .profile-info div {
            margin: 10px 0;
            font-size: 16px;
            color: #555555;
            display: flex;
        }

        .profile-info div b {
            width: 150px;
            color: #333333;
            font-weight: bold;
        }

        .profile-info div span {
            color: #007bff;
        }

        .edit.button {
            display: inline-block;
            background-color: #e0e0e0;
            color: #333;
            padding: 8px 20px;
            font-size: 14px;
            text-decoration: none;
            border-radius: 20px;
            text-align: center;
            cursor: pointer;
            transition: background-color 0.3s ease;
            border: none;
            position: absolute; 
            top: 20px; 
            right: 20px; 
        }

        .edit.button:hover {
            background-color: #bdbdbd; 
        }
    </style>
</head>
<body>
    <%@ include file="polinavbar.jsp" %>

    <div class="myprofile">
        <div class="profile-image">
            <img src="https://static.vecteezy.com/system/resources/thumbnails/049/327/528/small/user-icon-profile-and-people-silhouette-collection-icon-set-includes-user-person-group-and-team-icons-in-a-simple-linear-and-solid-style-with-transparent-background-vector.jpg" alt="Profile Icon">
        </div>
        <div class="profile-info">
            <a href="updatepoli" class="edit button">Edit Profile</a><br/><br/>
            <h2><%= poli.getName() %></h2>
            <h4><%= poli.getPresentposition() %></h4>

            <h2>Details</h2><br>
            <div><b>User ID</b><span><%= poli.getId() %></span></div>
            <div><b>Name</b><span><%= poli.getName() %></span></div>
            <div><b>Email</b><span><%= poli.getEmail() %></span></div>
            <div><b>Phone</b><span><%= poli.getContact() %></span></div>
            <div><b>Profession</b><span><%= poli.getPresentposition() %></span></div>
            <div><b>Constituency</b><span><%= poli.getConstituency() %></span></div>
            <div><b>Date of Birth</b><span><%= poli.getDateofbirth() %></span></div>
            <div><b>Education</b><span><%= poli.getEducation() %></span></div>
            <div><b>Party</b><span><%= poli.getParty() %></span></div>
            <div><b>Previous Position</b><span><%= poli.getPreviousposition() %></span></div>
            <div><b>State</b><span><%= poli.getState() %></span></div>
        </div>
    </div>
</body>
</html>
