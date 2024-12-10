<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">
    <title>Citizen Details</title>
    <link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;700&display=swap" rel="stylesheet">
    
    <style>
        body {
            font-family: 'Nunito', sans-serif;
            background-color: #f9f9f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        .card {
            background: #fff;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            max-width: 600px;
            width: 90%;
            margin: 20px;
            padding: 20px 30px;
            overflow: hidden;
            border: 1px solid #ddd;
        }

        .card h2 {
            font-size: 24px;
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
            text-align: center;
            text-transform: uppercase;
            letter-spacing: 1px;
        }

        table {
            width: 100%;
            border-collapse: collapse;
        }

        th, td {
            padding: 12px 15px;
            text-align: left;
            vertical-align: middle;
        }

        th {
            background-color: #6c5ce7;
            color: #fff;
            font-weight: 600;
            text-transform: uppercase;
            border-bottom: 3px solid #4c4a9d;
        }

        td {
            border-bottom: 1px solid #eaeaea;
            color: #555;
        }

        td img {
            border-radius: 50%;
            border: 2px solid #ddd;
            object-fit: cover;
        }

        tr:last-child td {
            border-bottom: none;
        }

        tr:hover {
            background-color: #f4f6ff;
            transition: background-color 0.3s ease-in-out;
        }

        @media (max-width: 768px) {
            th, td {
                padding: 10px 8px;
                font-size: 14px;
            }

            .card {
                padding: 15px;
            }

            .card h2 {
                font-size: 20px;
            }
        }
    </style>
</head>
<body>
    <div class="card">
        <h2>Citizen Details</h2>
        <table>
            <tr>
                <th>Aadhaar No</th>
                <td><c:out value="${citizen.aadhaarno}"/></td>
            </tr>
            <tr>
                <th>Name</th>
                <td><c:out value="${citizen.name}"/></td>
            </tr>
            <tr>
                <th>Gender</th>
                <td><c:out value="${citizen.gender}"/></td>
            </tr>
            <tr>
                <th>Address</th>
                <td><c:out value="${citizen.address}"/></td>
            </tr>
            <tr>
                <th>Phone Number</th>
                <td><c:out value="${citizen.phno}"/></td>
            </tr>
            <tr>
                <th>Constituency</th>
                <td><c:out value="${citizen.constituency}"/></td>
            </tr>
            <tr>
                <th>Email</th>
                <td><c:out value="${citizen.email}"/></td>
            </tr>
            <tr>
                <th>Password</th>
                <td><c:out value="${citizen.password}"/></td>
            </tr>
            <tr>
                <th>Image</th>
                <td><img src="data:image/jpeg;base64,<c:out value='${citizen.image}' />" width="100px" height="100px"/></td>
            </tr>
        </table>
    </div>
</body>
</html>
