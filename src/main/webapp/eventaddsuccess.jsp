<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<head>
    <meta charset="UTF-8">
    <title>Event Added Success</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }
        
        .container {
            background: #BBDEFB; 
            padding: 40px;
            border-radius: 15px;
            width: 80%;
            max-width: 600px;
            margin-top:200px;
            margin-left:400px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            animation: fadeIn 2s ease-in-out;
            text-align: center;
            border: 2px solid #90CAF9; 
        }

        .message {
            font-size: 2rem;
            font-weight: bold;
            color: #333333; 
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 12px 25px;
            background-color: #2196F3; 
            color: #fff;
            font-weight: bold;
            border-radius: 30px;
            text-decoration: none;
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
            transition: all 0.3s ease-in-out;
            font-size: 1.1rem;
        }

        a:hover {
            background-color: #1E88E5; 
            transform: translateY(-3px);
            box-shadow: 0 8px 16px rgba(0, 0, 0, 0.15);
        }

        @keyframes fadeIn {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .container {
                padding: 20px;
                width: 90%;
            }

            .message {
                font-size: 1.5rem;
            }

            a {
                padding: 10px 20px;
                font-size: 1rem;
            }
        }
    </style>
</head>
<body style="background:#E3F2FD;"> 
    <div class="container">
        <div class="message">
            <c:out value="${message}"></c:out>
        </div>
        <a href="polihome">Back</a>
    </div>
</body>
</html>
