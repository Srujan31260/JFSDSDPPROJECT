<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%
Admin ad = (Admin) session.getAttribute("admin");
if(ad ==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%> 

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin Dashboard</title>
<style>
	h4
	{
		color:#34495e;
		font-size:2rem;
		text-transform: uppercase;
		margin-top:250px;
		margin-right:100px;
	}
   .dashboard-container {
    margin: 20px;
    display: flex;
    flex-wrap: wrap; 
    gap: 150px;
    justify-content: flex-start;
    width: 100%;
    margin-top: 50px;
    margin-left:50px;
}


.card {
    display: flex;
    flex-direction: column; 
    align-items: center; 
    justify-content: center; 
    background-color: #fff; 
    border-radius: 20px;
    padding: 30px;
    margin-bottom: 20px;
    width: 100%; 
    box-shadow: 0 8px 20px rgba(0, 0, 0, 0.15);
    transition: transform 0.3s, box-shadow 0.3s;
    
}


.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 12px 30px rgba(0, 0, 0, 0.2);
}


.card-title {
    font-size: 22px; 
    font-weight: bold;
    color: #34495e; 
    margin: 0;
    display: flex;
    align-items: center; 
    gap: 10px;
}


.card-title i {
    font-size: 30px;
    color: #34495e; 
}


.circle {
    border: 3px solid #34495e;
    border-radius: 50%;
    width: 100px;
    height: 100px;
    display: flex;
    justify-content: center;
    align-items: center;
    font-size: 28px;
    font-weight: bold;
    color: #34495e;
    background: rgba(52, 73, 94, 0.1); 
    margin: 20px 0;
    gap:40px; 
}

.view-button {
    background-color: #34495e;
    color: #fff;
    padding: 12px 24px;
    border: none;
    border-radius: 10px;
    font-size: 16px;
    text-decoration: none;
    display: inline-block;
    margin-top: 10px;
    margin-left:55px;
    transition: background-color 0.3s;
}


.view-button:hover {
    background-color: #2c3e50; 
    cursor: pointer;
}
   
</style>
</head>

<body>
<%@include file="adminnavbar.jsp" %>

<div class="dashboard-container">
   
   <div class="left">
    <div class="card">
        <div>
            <p class="card-title"><i class="icon">👔</i> Total Politicians</p>
            <a href="viewallpoli" class="view-button">View</a>
        </div>
        <div class="circle"><c:out value="${count2}"></c:out></div>
    </div>
    
    
    <div class="card">
        <div>
            <p class="card-title"><i class="icon">👥</i> Total Citizens</p>
            <a href="viewallciti" class="view-button">View</a>
        </div>
        <div class="circle"><c:out value="${count1}"></c:out></div>
    </div>
    </div>
    <div class="right">
    <div class="card">
    <div>
        <p class="card-title"><i class="icon">📝</i> Total Issues</p>
        <!-- <a href="viewallissues" class="view-button">View</a> -->
       <!--  <a href="viewallissues">View</a> -->
    </div>
    <div class="circle"><c:out value="${count3}"></c:out></div>
</div>

<div class="card">
    <div>
        <p class="card-title"><i class="icon">✅</i> Solved Count</p>
<!--         <a href="viewallfeedbacks" class="view-button">View</a> -->
    </div>
    <div class="circle"><c:out value="${count4}"></c:out></div>
</div>
 </div>   
    
   <h4>Welcome back <%=ad.getUsername() %>!</h4>
</div>

</body>
</html>
