<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <title>Citizen Registration</title>
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Montserrat:wght@400;600&display=swap');

        body {
            font-family: 'Montserrat', sans-serif;
            background: linear-gradient(to bottom right, #e2e2e2, #ffffff);
            margin: 0;
            padding: 0;
        }

        .form-container {
            display: flex;
            max-width: 1200px;
            margin: 50px auto;
            padding: 30px;
            background-color: #ffffff;
            border-radius: 15px;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            overflow: hidden;
        }

        .form-content {
            flex: 1;
            padding: 20px;
        }

        h4 {
            text-align: center;
            color: #333;
            font-weight: 600;
            font-size: 1.5em;
            margin-bottom: 15px;
        }

        .image-container {
            flex-basis: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
        }

        .image-container img {
            max-width: 90%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
            width: 100%;
            height: 60%;
        }

        .separator {
            width: 2px; 
            background-color: #335C81; 
            height: auto; 
            margin: 0 20px; 
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        td {
            padding: 15px;
        }

        label {
            font-weight: 600;
            color: #555;
        }

        input[type="text"],
        input[type="number"],
        input[type="email"],
        input[type="password"] {
            width: 100%;
            padding: 12px;
            border: 2px solid #ccc;
            border-radius: 8px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        input[type="text"]:focus,
        input[type="number"]:focus,
        input[type="email"]:focus,
        input[type="password"]:focus {
            border-color: #007bff;
            box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
            outline: none;
        }

        input[type="radio"] {
            margin-right: 5px;
        }

        .button-container {
            margin-top: 30px;
            text-align: center;
        }

        input[type="submit"],
        input[type="reset"] {
            padding: 12px 25px;
            border: none;
            border-radius: 8px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
            font-weight: bold;
            font-size: 1em;
        }

        input[type="submit"] {
            background-color: #335C81;
            color: white;
        }

        input[type="reset"] {
            background-color: #335C81;
            color: white;
        }

        input[type="submit"]:hover,
        input[type="reset"]:hover {
            background-color: #2A4B68;
            transform: scale(1.05);
        }

        @media (max-width: 600px) {
            .form-container {
                flex-direction: column;
                padding: 20px;
            }

            .image-container {
                display: none;
            }

            h3 {
                font-size: 1.5em;
            }

            input[type="submit"],
            input[type="reset"] {
                width: 100%;
                margin-top: 10px;
            }
        }
    </style>
    <script>
        function validatePassword() {
            const password = document.getElementById("cpwd").value;
            const passwordPattern = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{8,}$/;
            
            if (!passwordPattern.test(password)) {
                alert("Password must be at least 8 characters long and include at least one uppercase letter, one lowercase letter, one number, and one special character.");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
<%@ include file="mainnavbar.jsp" %><br>
<h4><u>Citizen Registration</u></h4>
<div class="form-container">
    <div class="image-container">
        <img src="https://t3.ftcdn.net/jpg/03/39/70/90/360_F_339709048_ZITR4wrVsOXCKdjHncdtabSNWpIhiaR7.jpg" alt="Registration Image" />
    </div>
    
    <div class="separator"></div>

    <div class="form-content">
        
        <c:out value="${message}"></c:out>
        <form method="post" action="insertciti" enctype="multipart/form-data" onsubmit="return validatePassword();">
            <table>
                <tr>
                    <td><label for="cnum">Enter Aadhar</label></td>
                    <td><input type="number" id="cnum" name="cnum" required/></td>
                </tr>
                <tr>
                    <td><label for="cname">Enter Name</label></td>
                    <td><input type="text" id="cname" name="cname" required/></td>
                </tr>
                <tr>
                    <td><label>Select Gender</label></td>
                    <td>
                        <input type="radio" id="male" name="cgender" value="MALE" required/>
                        <label for="male">Male</label>
                        <input type="radio" id="female" name="cgender" value="FEMALE" required/>
                        <label for="female">Female</label>
                        <input type="radio" id="others" name="cgender" value="OTHERS" required/>
                        <label for="others">Others</label>
                    </td>
                </tr>
                <tr>
                    <td><label for="caddress">Enter Address</label></td>
                    <td><input type="text" id="caddress" name="caddress" required/></td>
                </tr>
                <tr>
                    <td><label for="cconstituency">Enter Constituency</label></td>
                    <td><input type="text" id="cconstituency" name="cconstituency" required/></td>
                </tr>
                <tr>
                    <td><label for="cemail">Enter Email ID</label></td>
                    <td><input type="email" id="cemail" name="cemail" required/></td>
                </tr>
                <tr>
                    <td><label for="cpwd">Enter Password</label></td>
                    <td><input type="password" id="cpwd" name="cpwd" required/></td>
                </tr>
                <tr>
                    <td><label for="cphno">Enter Phone No</label></td>
                    <td><input type="number" id="cphno" name="cphno" required/></td>
                </tr>
                <tr>
                    <td><label for="citiimage">Insert Image</label></td>
                    <td><input type="file" id="citiimage" name="citiimage" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register" />
                        <input type="reset" value="Clear" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
</body>
</html>
