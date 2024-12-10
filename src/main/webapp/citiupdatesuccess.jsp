<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Issue Successfully Posted</title>

<link href="https://fonts.googleapis.com/css2?family=Nunito:wght@400;600;800&display=swap" rel="stylesheet">
<style>
   
    body
    {
    	background:#E3F2FD;
    }
    .container {
        max-width: 500px;
        margin: 50px auto;
        padding: 20px 30px;
        text-align: center;
        background: linear-gradient(135deg, #ff9a9e, #fad0c4, #fbc2eb);
        border: 2px solid rgba(255, 182, 193, 0.4);
        border-radius: 15px;
        box-shadow: 4px 4px 10px rgba(0, 0, 0, 0.1), -4px -4px 10px rgba(255, 255, 255, 0.7);
    }

   
    .container h3 {
        font-size: 28px;
        font-weight: 800;
        font-family: 'Nunito', sans-serif;
        color: #5a189a;
        margin-bottom: 20px;
        text-transform: uppercase;
        letter-spacing: 1px;
        position: relative;
    }

    .container h3::after {
        content: '';
        display: block;
        width: 60px;
        height: 3px;
        background: linear-gradient(to right, #ffafbd, #ffc3a0);
        margin: 10px auto 0;
        border-radius: 2px;
    }

    .container a {
        display: inline-block;
        padding: 12px 25px;
        font-size: 16px;
        font-family: 'Nunito', sans-serif;
        font-weight: 600;
        color: #fff;
        background: linear-gradient(135deg, #43cea2, #185a9d);
        text-decoration: none;
        border-radius: 30px;
        transition: all 0.3s ease;
        box-shadow: 0 5px 15px rgba(0, 0, 0, 0.1);
    }

    .container a:hover {
        background: linear-gradient(135deg, #185a9d, #43cea2);
        transform: translateY(-3px);
        box-shadow: 0 10px 20px rgba(0, 0, 0, 0.2);
    }

    @keyframes fadeIn {
        from {
            opacity: 0;
            transform: scale(0.95);
        }
        to {
            opacity: 1;
            transform: scale(1);
        }
    }
    .container {
        animation: fadeIn 0.8s ease-in-out;
    }
</style>
</head>
<body>
<div class="container">
    <h3>Issue Successfully Posted</h3>
    <a href="citihome">Home</a>
</div>
</body>
</html>
