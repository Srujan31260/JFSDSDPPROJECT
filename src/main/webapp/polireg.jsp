<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Admin admin = (Admin) session.getAttribute("admin");
if(admin ==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Politician Registration</title>
<link rel="stylesheet" href="https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap">
<style>
   
    .form-container {
        display: flex;
        max-width: 900px;
        width: 100%;
        background-color: #fff;
        border-radius: 15px;
        box-shadow: 0 8px 30px rgba(0, 0, 0, 0.2);
        overflow: hidden;
        margin: 20px;
        padding: 20px;
        gap: 20px;
        margin-left:250px;
        margin-top:55px;
    }

    .form-content {
        flex: 1;
        padding: 20px;
    }

    h2{
        text-align: center;
        color: #335C81;
        font-weight: 600;
        font-size: 1.8em;
        margin-top:40px;
        
    }

    .image-container {
        flex: 1;
        display: flex;
        align-items: center;
        justify-content: center;
        padding: 20px;
    }

    .image-container img {
        max-width: 100%;
        height: auto;
        border-radius: 10px;
        box-shadow: 0 4px 15px rgba(0, 0, 0, 0.2);
    }

    .separator {
        width: 2px;
        background-color: #335C81;
        height: auto;
        margin: 0 20px;
    }

    label {
        font-weight: 600;
        color: #555;
        display: block;
        margin-top: 10px;
    }

    input[type="text"],
    input[type="email"],
    input[type="password"],
    input[type="tel"],
    input[type="date"] {
        width: 100%;
        padding: 10px;
        border: 2px solid #ddd;
        border-radius: 8px;
        margin-top: 5px;
        transition: border-color 0.3s;
    }

    input[type="text"]:focus,
    input[type="email"]:focus,
    input[type="password"]:focus,
    input[type="tel"]:focus,
    input[type="date"]:focus {
        border-color: #335C81;
        box-shadow: 0 0 5px rgba(51, 92, 129, 0.5);
        outline: none;
    }

    .radio-group {
        display: flex;
        gap: 10px;
        align-items: center;
    }

    .button-container {
        margin-top: 20px;
        text-align: center;
    }

    button {
        padding: 12px 25px;
        border: none;
        border-radius: 8px;
        cursor: pointer;
        font-weight: bold;
        font-size: 1em;
        background-color: #335C81;
        color: white;
        transition: background-color 0.3s, transform 0.2s;
        margin: 5px;
    }

    button:hover {
        background-color: #2A4B68;
        transform: scale(1.05);
    }

    @media (max-width: 800px) {
        .form-container {
            flex-direction: column;
            padding: 15px;
        }
        
        .image-container {
            display: none;
        }
    }
</style>
</head>
<body>
<%@ include file="adminnavbar.jsp" %>
 <h2>Politician Registration</h2>
<div class="form-container">
    <div class="form-content">
       
        <form action="insertpoli" method="post">
            <label for="name">Name:</label>
            <input type="text" id="name" name="name" required maxlength="50">

            <label for="gender">Gender:</label>
            <div class="radio-group">
                <input type="radio" id="male" name="gender" value="Male" required>
                <label for="male">Male</label>
                <input type="radio" id="female" name="gender" value="Female">
                <label for="female">Female</label>
                <input type="radio" id="others" name="gender" value="Others">
                <label for="others">Others</label>
            </div>

            <label for="email">Email:</label>
            <input type="email" id="email" name="email" required maxlength="50">

            <label for="constituency">Constituency:</label>
            <input type="text" id="constituency" name="constituency" required maxlength="50">

            <label for="contact">Contact:</label>
            <input type="tel" id="contact" name="contact" required maxlength="11">

            <label for="dob">Date of Birth:</label>
            <input type="date" id="dob" name="dateofbirth" required>

            <label for="education">Education:</label>
            <input type="text" id="education" name="education" required maxlength="20">

            <label for="party">Party:</label>
            <input type="text" id="party" name="party" required maxlength="20">

            <label for="previousposition">Previous Position:</label>
            <input type="text" id="previousposition" name="previousposition" required maxlength="20">

            <label for="presentposition">Present Position:</label>
            <input type="text" id="presentposition" name="presentposition" required maxlength="20">

            <label for="state">State:</label>
            <input type="text" id="state" name="state" required maxlength="20">

            <label for="password">Password:</label>
            <input type="password" id="password" name="password" required maxlength="10">

            <div class="button-container">
                <button type="submit">Register Politician</button>
                <button type="reset">Clear</button>
            </div>
        </form>
    </div>

    <div class="separator"></div>

    <div class="image-container">
        <img src="https://img.freepik.com/premium-vector/illustration-vector-graphic-cartoon-character-online-registration_516790-1807.jpg" alt="Politician Registration">
    </div>
</div>

</body>
</html>
