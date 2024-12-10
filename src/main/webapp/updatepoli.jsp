<%@page import="com.klef.jfsd.sdp.model.Politician"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<%
Politician poli  = (Politician) session.getAttribute("politician");
if(poli==null)
{
    response.sendRedirect("polisessionexpiry");
    return;
}
%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Update Politician Profile</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
    <style>
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
        }

        h4 {
            font-size: 25px;
            text-align: center;
            color: #333;
            margin-top: 50px;
            text-transform: uppercase;
            letter-spacing: 1.2px;
            border-bottom: 2px solid #3498db;
            padding-bottom: 10px;
        }

        .form-container {
            display: flex;
            align-items: flex-start;
            justify-content: space-between;
            width: 80%;
            max-width: 900px;
            margin: 40px auto;
            background-color: #fff;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            border-top: 5px solid #3498db;
        }

        .image-container {
            flex: 1;
            margin-right: 30px;
        }

        .image-container img {
            width: 100%;
            max-width: 750px;
            border-radius: 8px;
            box-shadow: 0 4px 12px rgba(0, 0, 0, 0.1);
            margin-top: 310px; /* Adjusted the image top margin */
        }

        .form-content {
            flex: 2;
        }

        .form-container table {
            width: 100%;
            margin-bottom: 20px;
        }

        .form-container td {
            padding: 10px 15px;
            font-size: 16px;
            color: #555;
        }

        .form-container td input,
        .form-container td select,
        .form-container td textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 6px;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        .form-container td input:focus,
        .form-container td select:focus,
        .form-container td textarea:focus {
            outline: none;
            border-color: #3498db;
        }

        .form-container td label {
            font-weight: bold;
            color: #333;
        }

        .form-container .button-container {
            text-align: center;
            margin-top: 20px;
            display: flex;
            gap: 20px; /* Added space between buttons */
            justify-content: center;
        }

        .form-container input[type="submit"],
        .form-container input[type="reset"] {
            background-color: #3498db;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 14px;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease;
        }

        .form-container input[type="submit"]:hover,
        .form-container input[type="reset"]:hover {
            background-color: #2980b9;
        }

        .form-container input[type="reset"] {
            background-color: #e74c3c;
        }

        .form-container input[type="reset"]:hover {
            background-color: #c0392b;
        }

        .form-container .button-container a {
            display: inline-block;
            margin-top: 20px;
            text-decoration: none;
            color: #3498db;
            font-size: 16px;
            font-weight: bold;
        }

        .form-container .button-container a:hover {
            color: #2980b9;
        }

        .form-container .gender-radio {
            display: flex;
            gap: 20px;
            align-items: center;
        }

        .form-container .gender-radio input[type="radio"] {
            margin: 0 5px 0 0;
        }
    </style>
</head>
<body>
    <%@include file="polinavbar.jsp" %>
    
    <h4>Update Politician Profile</h4>

    <div class="form-container">
        <div class="image-container">
            <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRGWm7kgMH1PEsycRwkyqPcPB1b2NITpD8j2g&s" alt="Politician Image" />
        </div>
        <div class="form-content">
            <h4 align="center" style="color:red">
                <c:out value="${message}"></c:out>
            </h4>
            <form method="post" action="updatepoliprofile">
                <table>
                    <tr>
                        <td><label for="pid">Politician ID</label></td>
                        <td><input type="number" id="pid" name="pid" readonly value="<%= poli.getId() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="pname">Enter Name</label></td>
                        <td><input type="text" id="pname" name="pname" value="<%= poli.getName() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label>Select Gender</label></td>
                        <td class="gender-radio">
                            <input type="radio" id="male" name="pgender" value="Male" <%= poli.getGender().equals("Male") ? "checked" : "" %> required/>
                            <label for="male">Male</label>
                            <input type="radio" id="female" name="pgender" value="Female" <%= poli.getGender().equals("Female") ? "checked" : "" %> required/>
                            <label for="female">Female</label>
                            <input type="radio" id="others" name="pgender" value="Others" <%= poli.getGender().equals("Others") ? "checked" : "" %> required/>
                            <label for="others">Others</label>
                        </td>
                    </tr>
                    <tr>
                        <td><label for="pconstituency">Enter Constituency</label></td>
                        <td><input type="text" id="pconstituency" name="pconstituency" value="<%= poli.getConstituency() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="pcontact">Enter Contact</label></td>
                        <td><input type="text" id="pcontact" name="pcontact" value="<%= poli.getContact() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="pdob">Enter Date of Birth</label></td>
                        <td><input type="date" id="pdob" name="pdob" value="<%= poli.getDateofbirth() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="peducation">Enter Education</label></td>
                        <td><input type="text" id="peducation" name="peducation" value="<%= poli.getEducation() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="pparty">Enter Party</label></td>
                        <td><input type="text" id="pparty" name="pparty" value="<%= poli.getParty() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="ppreviousposition">Enter Previous Position</label></td>
                        <td><input type="text" id="ppreviousposition" name="ppreviousposition" value="<%= poli.getPreviousposition() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="ppresentposition">Enter Present Position</label></td>
                        <td><input type="text" id="ppresentposition" name="ppresentposition" value="<%= poli.getPresentposition() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="pstate">Enter State</label></td>
                        <td><input type="text" id="pstate" name="pstate" value="<%= poli.getState() %>" required/></td>
                    </tr>
                    <tr>
                        <td><label for="ppassword">Enter Password</label></td>
                        <td><input type="password" id="ppassword" name="ppassword" value="<%= poli.getPassword() %>" required/></td>
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
    </div>
</body>
</html>
