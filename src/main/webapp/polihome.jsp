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
<title>Dashboard</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" integrity="sha512-Fo3rlrZj/kNVg1V4swLY41lcT2PnkMucmJ6buSTsKQd9/p1BUpOQkhhqrj4I1q6uCZlF6WPo/VwYFkEUVH+yBQ==" crossorigin="anonymous" referrerpolicy="no-referrer" />
<style>
    /* General styles */
    
  	h2 {
        text-align: center;
        margin: 40px auto;
        font-size: 2rem; /* Larger font size for prominence */
        color: #007BFF; /* Primary color to match card gradients */
        font-weight: bold;
        text-transform: uppercase;
        letter-spacing: 1.5px;
        background: linear-gradient(90deg, #0056b3, #007BFF);
        -webkit-background-clip: text;
        -webkit-text-fill-color: transparent;
        padding: 20px;
        border: 2px solid #007BFF; /* Border for visual emphasis */
        border-radius: 10px;
        box-shadow: 0 5px 15px rgba(0, 123, 255, 0.2);
        width: fit-content;
        margin: 40px auto; /* Centered on the page */
        animation: fadeIn 1.2s ease-in-out; /* Smooth animation */
    }

    /* Fade-in animation */
    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: translateY(-10px);
        }
        to {
            opacity: 1;
            transform: translateY(0);
        }
    }
    .container {
        display: grid;
        grid-template-columns: repeat(auto-fit, minmax(300px, 1fr)); /* Larger minimum width for cards */
        gap: 40px; /* Increased gap between cards */
        margin: 0 auto;
        padding: 40px; /* Added padding for the entire container */
        max-width: 1400px; /* Increased max width for larger screens */
    }

    /* Card styles */
    .card {
        background: linear-gradient(135deg, #007BFF, #0056b3);
        border-radius: 12px;
        box-shadow: 0 8px 12px rgba(0, 0, 0, 0.1);
        padding: 30px;
        text-align: center;
        color: white;
        transition: transform 0.3s ease, box-shadow 0.3s ease;
        position: relative;
        overflow: hidden;
    }

    .card:hover {
        transform: translateY(-10px);
        box-shadow: 0 12px 20px rgba(0, 0, 0, 0.15);
    }

    /* Icon styles */
    .card i {
        font-size: 3.5rem; /* Slightly larger icons */
        margin-bottom: 15px;
        color: rgba(255, 255, 255, 0.8);
    }

    /* Text in cards */
    .card p {
        font-size: 1.4rem; /* Larger text for better readability */
        margin-bottom: 10px;
        color: rgba(255, 255, 255, 0.9);
    }

    .card c\:out {
        font-size: 2.2rem; /* Larger value font size */
        font-weight: bold;
    }

    /* Links in cards */
    .card a {
        display: inline-block;
        text-decoration: none;
        background: white;
        color: #0056b3;
        padding: 12px 25px;
        border-radius: 5px;
        font-weight: bold;
        margin-top: 15px;
        font-size: 1rem;
        transition: background-color 0.3s ease, color 0.3s ease;
    }

    .card a:hover {
        background: #004080;
        color: white;
    }
</style>
</head>
<body>
<%@include file="polinavbar.jsp" %>
 <h2>Welcome back <%= poli.getName() %>!</h2>
<div class="container">
    <!-- Total Issues Card -->
    <div class="card">
        <i class="fas fa-exclamation-circle"></i>
        <p>Total Issues</p>
        <c:out value="${count}"></c:out><br>
        <a href="viewcitizenissuebycons">View</a>
    </div>
    <!-- Total Events Card -->
    <div class="card">
        <i class="fas fa-calendar-alt"></i>
        <p>Total Events</p>
        <c:out value="${count2}"></c:out><br>
        <a href="viewallevents">View</a>
    </div>
    <!-- Total Solved Card -->
    <div class="card">
        <i class="fas fa-check-circle"></i>
        <p>Total Solved</p>
        <c:out value="${count3}"></c:out><br>
        <a href="viewallfeedbacks">View</a>
    </div>
    <!-- Total Citizens for Events Card -->
    <div class="card">
        <i class="fas fa-users"></i>
        <p>Total Citizens for Events</p>
        <c:out value="${count4}"></c:out><br>
        <a href="viewallappliedevents">View</a>
    </div>
</div>
</body>
</html>
