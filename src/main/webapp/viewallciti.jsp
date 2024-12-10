<%@page import="com.klef.jfsd.sdp.model.Admin"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="jakarta.tags.core" prefix="c" %>
<%-- <%
Admin ad = (Admin) session.getAttribute("admin");
if(ad ==null)
{
	response.sendRedirect("adminsessionexpiry");
	return;
}
%> --%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Spring Boot Project</title>
    <style>
       h2 {
            font-size: 30px;
            color: #444;
            margin-bottom: 20px;
            text-align: center;
        }

        input[type="text"] {
            width: 100%;
            max-width: 400px;
            padding: 12px;
            margin-bottom: 20px;
            border: 3px solid #dcdcdc;
            border-radius: 8px;
            font-size: 18px;
            background-color: #fff;
            box-sizing: border-box;
        }

      
        #myTableContainer {
            display: flex;
            flex-wrap: wrap;
            justify-content: flex-start;
            gap: 30px;
            padding-top: 20px;
        }
 
        .card {
            background-color: #ffffff;
            border-radius: 15px;
            width: 350px;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            transition: all 0.3s ease-in-out;
            transform: scale(1);
            cursor: pointer;
            border: 1px solid #e0e0e0;
        }

        .card:hover {
            transform: scale(1.05);
            box-shadow: 0 12px 25px rgba(0, 0, 0, 0.15);
        }

        .card-header {
            text-align: center;
            padding: 20px;
            background-color: #2C3E50;
            color: #fff;
            border-bottom: 1px solid #ddd;
        }

        .card-img {
            width: 100px;
            height: 100px;
            border-radius: 50%;
            object-fit: cover;
            border: 4px solid #fff;
            margin-top: -10px; 
        }

        .card-body {
            padding: 20px;
        }

        .card-body h4 {
            font-size: 22px;
            color: #2C3E50;
            margin-top: 10px;
        }

        .card-body p {
            font-size: 14px;
            color: #7F8C8D;
            margin: 6px 0;
        }

        .card-body p strong {
            color: #2C3E50;
        }

        .cards-container {
            display: flex;
            flex-wrap: wrap;
            gap: 30px;
        }

    </style>
    <script>
        function myFunction() {
            var input, filter, container, cards, name, i, txtValue;
            input = document.getElementById("myInput");
            filter = input.value.toUpperCase();
            container = document.getElementById("myTableContainer");
            cards = container.getElementsByClassName("card");

            for (i = 0; i < cards.length; i++) {
                name = cards[i].getElementsByClassName("name")[0];
                if (name) {
                    txtValue = name.textContent || name.innerText;
                    if (txtValue.toUpperCase().indexOf(filter) > -1) {
                        cards[i].style.display = "";
                    } else {
                        cards[i].style.display = "none";
                    }
                }
            }
        }
    </script>
</head>

<%@ include file="adminnavbar.jsp" %>

<h2><u>View All Citizens</u></h2>
<br>

<input type="text" id="myInput" onkeyup="myFunction()" placeholder="Search by Name">

<div id="myTableContainer">
    <div class="cards-container">
        <c:forEach items="${citizenlist}" var="citizen">
            <div class="card">
                <div class="card-header">
                    <img src="displaycitizenimage?Aadhaarno=${citizen.aadhaarno}" alt="Citizen Image" class="card-img">
                </div>
                <div class="card-body">
                    <h4 class="name"><c:out value="${citizen.name}" /></h4>
                    <p><strong>Aadhaar No:</strong> <c:out value="${citizen.aadhaarno}" /></p>
                    <p><strong>Gender:</strong> <c:out value="${citizen.gender}" /></p>
                    <p><strong>Address:</strong> <c:out value="${citizen.address}" /></p>
                    <p><strong>Phone No:</strong> <c:out value="${citizen.phno}" /></p>
                    <p><strong>Constituency:</strong> <c:out value="${citizen.constituency}" /></p>
                    <p><strong>Email:</strong> <c:out value="${citizen.email}" /></p>
                </div>
            </div>
        </c:forEach>
    </div>
</div>

</html>
