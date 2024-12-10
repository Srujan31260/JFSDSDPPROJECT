<%@page import="com.klef.jfsd.sdp.model.Citizen"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
Citizen cit = (Citizen) session.getAttribute("citi");
if(cit == null) {
    response.sendRedirect("citisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Citizen</title>
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
    <style>
        /* CSS STARTS HERE */

        h3, h4 {
            text-align: center;
            margin: 10px;
        }

        h3 {
            font-size: 26px;
            color: #1976D2;
            font-weight: bold;
            text-decoration: underline;
            position: relative;
        }

        h3::after {
            content: "";
            display: block;
            margin: 10px auto;
            width: 50px;
            height: 3px;
            background-color: #1976D2;
            border-radius: 5px;
        }

        h4 {
            color: #d32f2f;
            font-size: 18px;
            font-weight: 600;
        }

        .form-container {
            display: flex;
            justify-content: center;
            align-items: center;
            margin: 20px;
        }

        form {
            background: linear-gradient(145deg, #e3f2fd, #ffffff);
            border-radius: 12px;
            padding: 25px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.2);
            width: 90%;
            max-width: 600px;
            position: relative;
        }

        form::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 5px;
            background: linear-gradient(to right, #42a5f5, #1e88e5);
            border-radius: 12px 12px 0 0;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 15px;
            vertical-align: middle;
            font-size: 14px;
        }

        label {
            font-size: 14px;
            color: #444;
            font-weight: bold;
            display: flex;
            align-items: center;
        }

        label i {
            margin-right: 8px;
            color: #1565C0;
        }

        input[type="text"],
        input[type="number"],
        input[type="password"] {
            width: calc(100% - 20px);
            padding: 10px 12px;
            border: 1px solid #ccc;
            border-radius: 6px;
            font-size: 14px;
            margin-top: 5px;
            transition: all 0.3s ease-in-out;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="password"]:focus {
            border-color: #1976D2;
            box-shadow: 0 0 8px rgba(25, 118, 210, 0.3);
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 12px 20px;
            border: none;
            border-radius: 6px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            transition: all 0.3s ease-in-out;
        }

        input[type="submit"] {
            background-color: #1976D2;
            color: #FFFFFF;
        }

        input[type="submit"]:hover {
            background-color: #0d47a1;
        }

        input[type="reset"] {
            background-color: #d32f2f;
            color: #FFFFFF;
        }

        input[type="reset"]:hover {
            background-color: #b71c1c;
        }

        .button-container {
            text-align: center;
        }

        input[readonly] {
            background-color: #f1f1f1;
            cursor: not-allowed;
        }

        .radio-group {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .radio-group input[type="radio"] {
            display: none;
        }

        .radio-group label {
            font-size: 14px;
            padding: 8px 15px;
            border: 1px solid #ccc;
            border-radius: 8px;
            cursor: pointer;
            transition: all 0.3s ease;
        }

        .radio-group input[type="radio"]:checked + label {
            background-color: #1976D2;
            color: #ffffff;
            border-color: #1976D2;
            font-weight: bold;
        }

        form img {
            display: block;
            width: 80px;
            margin: 0 auto 20px;
            border-radius: 50%;
            border: 3px solid #1976D2;
        }
        /* CSS ENDS HERE */
    </style>
</head>
<body>
<%@include file="citinavbar.jsp" %>
<h4 align="center">
    <c:out value="${message}"></c:out>
</h4>

<h3>Update Citizen Profile</h3>
<div class="form-container">
    <form method="post" action="updatecitiprofile">
     
        <table>
            <tr>
                <td><label for="cAadhaarno"><i class="fas fa-id-card"></i> Aadhaar Number</label></td>
                <td><input type="number" id="cAadhaarno" name="cAadhaarno" readonly value="<%= cit.getAadhaarno() %>" required/></td>
            </tr>
            <tr>
                <td><label for="cname"><i class="fas fa-user"></i> Enter Name</label></td>
                <td><input type="text" id="cname" name="cname" value="<%= cit.getName() %>" required/></td>
            </tr>
            <tr>
                <td><label>Select Gender</label></td>
                <td class="radio-group">
                    <input type="radio" id="male" name="cgender" value="MALE" <%= cit.getGender().equals("MALE") ? "checked" : "" %> />
                    <label for="male">Male</label>
                    <input type="radio" id="female" name="cgender" value="FEMALE" <%= cit.getGender().equals("FEMALE") ? "checked" : "" %> />
                    <label for="female">Female</label>
                    <input type="radio" id="others" name="cgender" value="OTHERS" <%= cit.getGender().equals("OTHERS") ? "checked" : "" %> />
                    <label for="others">Others</label>
                </td>
            </tr>
            <tr>
                <td><label for="caddress"><i class="fas fa-map-marker-alt"></i> Address</label></td>
                <td><input type="text" id="caddress" name="caddress" value="<%= cit.getAddress() %>" required/></td>
            </tr>
            <tr>
                <td><label for="cconstituency"><i class="fas fa-city"></i> Constituency</label></td>
                <td><input type="text" id="cconstituency" name="cconstituency" value="<%= cit.getConstituency() %>" required/></td>
            </tr>
            <tr>
                <td><label for="cpwd"><i class="fas fa-lock"></i> Password</label></td>
                <td><input type="password" id="cpwd" name="cpwd" value="<%= cit.getPassword() %>" required/></td>
            </tr>
            <tr>
                <td><label for="cphno"><i class="fas fa-phone"></i> Phone Number</label></td>
                <td><input type="number" id="cphno" name="cphno" value="<%= cit.getPhno() %>" required/></td>
            </tr>
            <tr>
                <td colspan="2" class="button-container">
                    <input type="submit" value="Update"/>
                    <input type="reset" value="Clear"/>
                </td>
            </tr>
        </table>
    </form>
</div>
</body>
</html>
