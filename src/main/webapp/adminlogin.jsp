<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Login</title>
    <style>
        h2 {
            text-align: center;
            color: #0056b3;
            font-weight: bold;
            margin-bottom: 8px;
        }

        h4 {
            text-align: center;
            color: red;
        }

        .container {
            display: flex;
            width: 80%;
            max-width: 1100px;
            margin: 0 auto;
            border-radius: 15px;
            overflow: hidden;
            box-shadow: 0 4px 20px rgba(0, 0, 0, 0.2);
            margin-top: 40px;
        }

        .form-card, .image-card {
            flex: 1;
            min-height: 400px; /* Adjusted height */
            padding: 30px;
        }

        .form-card {
            background-color: #ffffff;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            justify-content: center;
            align-items: center;
            text-align: center;
        }

        .form-card h1 {
            color: #333;
            font-size: 24px;
            margin-bottom: 20px;
        }

        .input-box {
            position: relative;
            width: 100%;
            margin-bottom: 20px;
        }

        .input-box label {
            font-weight: bold;
            display: block;
            margin-bottom: 8px;
        }

        .input-box input {
            width: 100%;
            padding: 12px;
            border: 2px solid #ccc;
            border-radius: 8px;
            transition: border-color 0.3s, box-shadow 0.3s;
        }

        .input-box input:focus {
            border-color: #0056b3;
            box-shadow: 0 0 5px rgba(0, 86, 179, 0.5);
            outline: none;
        }

        .btn {
            padding: 12px 20px;
            border: none;
            border-radius: 8px;
            background-color: #0056b3;
            color: white;
            font-weight: bold;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.2s;
        }

        .btn:hover {
            background-color: #003d80;
            transform: scale(1.05);
        }

        .image-card {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #f9f9f9;
            padding: 20px;
        }

        .image-card img {
            max-width: 100%;
            height: auto;
            border-radius: 10px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.2);
        }

        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }

            .image-card {
                margin-top: 20px;
            }
        }
    </style>
</head>
<body>
    <%@include file="mainnavbar.jsp" %>
    <h2><u>Admin Login</u></h2>
    <div class="container">
        <div class="form-card">
         
            <h1>Login</h1>
            <form method="post" action="checkadminlogin">
                <div class="input-box">
                    <label>Enter Username</label>
                    <input type="text" id="auname" name="auname" placeholder="Username" required>
                </div>
                <div class="input-box">
                    <label>Enter Password</label>
                    <input type="password" id="apwd" name="apwd" placeholder="Password" required>
                </div>
                <button type="submit" class="btn">Login</button>
            </form>
        </div>
        <div class="image-card">
            <img src="https://t4.ftcdn.net/jpg/04/75/00/99/360_F_475009987_zwsk4c77x3cTpcI3W1C1LU4pOSyPKaqi.jpg" alt="Login Image">
        </div>
    </div>
</body>
</html>
