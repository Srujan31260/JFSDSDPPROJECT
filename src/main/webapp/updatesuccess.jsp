<%@ taglib uri="jakarta.tags.core" prefix="c" %>
    
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Success</title>

   
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@400;500;700&display=swap" rel="stylesheet">
 
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        
        body {
            font-family: 'Roboto', sans-serif;
            background-color: #f7f7f7;
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }

        .container {
            width: 80%;
            max-width: 600px;
            margin: 50px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 12px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
        }

       
        h1 {
            font-size: 2.5em;
            color: #4CAF50;
            margin-bottom: 20px;
            font-weight: 700;
        }

        .message {
            font-size: 1.2em;
            color: #333;
            margin-bottom: 20px;
        }

        a {
            display: inline-block;
            padding: 12px 25px;
            margin-top: 20px;
            background-color: #4CAF50;
            color: #fff;
            text-decoration: none;
            font-size: 1.1em;
            border-radius: 8px;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        a:hover {
            background-color: #45a049;
            transform: scale(1.05);
        }

        .icon {
            font-size: 2.5em;
            color: #4CAF50;
            margin-bottom: 20px;
        }

      
        .message {
            animation: fadeIn 2s ease-in-out;
        }

        @keyframes fadeIn {
            0% {
                opacity: 0;
                transform: translateY(20px);
            }
            100% {
                opacity: 1;
                transform: translateY(0);
            }
        }

  
        @media (max-width: 768px) {
            .container {
                width: 90%;
                padding: 15px;
            }

            h1 {
                font-size: 2em;
            }

            .message {
                font-size: 1.1em;
            }
        }

    </style>
</head>
<body>
    <div class="container">
     
        <i class="fas fa-check-circle icon"></i>

        <div class="message">
            <c:out value="${message}"></c:out>
        </div>

        <a href="updatepoli"><i class="fas fa-arrow-left"></i> Go Back</a>
    </div>
</body>
</html>
