<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Feedback Submitted Successfully</title>
<style>
  body, h3, p {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
  }

  
  body {
    background-color: #f4f7fb;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #333;
  }

  .container {
    background-color: #fff;
    border-radius: 12px;
    padding: 40px 60px;
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.1);
    max-width: 550px;
    text-align: center;
    transition: transform 0.3s ease-in-out;
  }

  .container:hover {
    transform: translateY(-10px);
  }

  
  h3 {
    font-size: 28px;
    color: #4CAF50;
    font-weight: bold;
    margin-bottom: 20px;
  }

  
  p {
    font-size: 16px;
    color: #555;
    margin-bottom: 30px;
    line-height: 1.5;
  }

 
  a {
    display: inline-block;
    background-color: #4CAF50;
    color: #fff;
    font-size: 16px;
    padding: 12px 24px;
    text-decoration: none;
    border-radius: 5px;
    transition: background-color 0.3s ease, transform 0.2s ease;
  }

  a:hover {
    background-color: #45a049;
    transform: translateY(-2px);
  }

  
  @media (max-width: 600px) {
    .container {
      padding: 30px;
      width: 90%;
    }

    h3 {
      font-size: 24px;
    }

    p {
      font-size: 14px;
    }

    a {
      font-size: 14px;
      padding: 10px 20px;
    }
  }
</style>
</head>
<body>
  <div class="container">
    <h3>Feedback Submitted Successfully</h3>
    <p>Your feedback is important to us. Thank you for your input!</p>
    <a href="citihome">Go to Home</a>
  </div>
</body>
</html>
