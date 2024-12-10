<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <title>Change Password</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        /* General Styling */
        body {
            font-family: 'Roboto', sans-serif;
            background: linear-gradient(135deg, #8e44ad, #3498db);
            color: #333;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }

        /* Card Container */
        form {
            background: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.2);
            max-width: 400px;
            width: 100%;
            animation: slideIn 0.5s ease-in-out;
        }

        /* Slide-In Animation */
        @keyframes slideIn {
            from {
                opacity: 0;
                transform: translateY(20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Form Heading */
        h2 {
            text-align: center;
            color: #8e44ad;
            font-size: 28px;
            margin-bottom: 20px;
        }

        /* Form Group */
        .form-group {
            margin-bottom: 20px;
            position: relative;
        }

        label {
            font-weight: bold;
            color: #555;
        }

        /* Input Fields */
        input[type="text"],
        input[type="password"] {
            width: 100%;
            padding: 12px 40px;
            border: 1px solid #ddd;
            border-radius: 5px;
            font-size: 14px;
            color: #333;
            background-color: #f9f9f9;
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus,
        input[type="password"]:focus {
            border-color: #8e44ad;
            outline: none;
            box-shadow: 0 0 5px rgba(142, 68, 173, 0.3);
        }

        
        .form-group i {
            position: absolute;
            top: 50%;
            left: 12px;
            transform: translateY(-50%);
            font-size: 18px;
            color: #8e44ad;
        }

       
        button[type="submit"] {
            background: #8e44ad;
            color: white;
            border: none;
            border-radius: 5px;
            padding: 12px;
            font-size: 16px;
            font-weight: bold;
            cursor: pointer;
            width: 100%;
            transition: background 0.3s ease;
        }

        button[type="submit"]:hover {
            background: #732d91;
        }

        /* Error Message */
        .error-message {
            color: #e74c3c;
            text-align: center;
            font-size: 14px;
            margin-top: 10px;
        }
    </style>
</head>
<body>
    <form action="changePassword" method="post">
        <h2><i class="fas fa-lock"></i> Change Password</h2>

        <div class="form-group">
            <label for="Aadhaarno">Aadhaar Number:</label>
            <input type="text" id="Aadhaarno" name="Aadhaarno" placeholder="Enter your Aadhaar number" required>
            <i class="fas fa-id-card"></i>
        </div>

        <div class="form-group">
            <label for="oldPassword">Old Password:</label>
            <input type="password" id="oldPassword" name="oldPassword" placeholder="Enter your old password" required>
            <i class="fas fa-key"></i>
        </div>

        <div class="form-group">
            <label for="newPassword">New Password:</label>
            <input type="password" id="newPassword" name="newPassword" placeholder="Enter your new password" required>
            <i class="fas fa-unlock-alt"></i>
        </div>

        <button type="submit"><i class="fas fa-save"></i> Change Password</button>

        <div>
            <c:if test="${not empty error}">
                <p class="error-message">${error}</p>
            </c:if>
        </div>
    </form>
</body>
</html>
