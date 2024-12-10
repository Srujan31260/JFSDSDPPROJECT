<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Registration Success</title>
<style>
  /* Reset default styling */
  body, h3, p, a {
    margin: 0;
    padding: 0;
    font-family: 'Arial', sans-serif;
  }

  /* Body styling */
  body {
    background-color: #f9fafb;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100vh;
    color: #333;
  }

  /* Container styling */
  .container {
    background-color: #fff;
    border-radius: 12px;
    padding: 40px 60px;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
    max-width: 600px;
    text-align: center;
    transition: transform 0.3s ease-in-out;
    width: 100%;
  }

  .container:hover {
    transform: translateY(-10px);
  }

  /* Heading styling */
  h3 {
    font-size: 30px;
    color: #4CAF50;
    font-weight: bold;
    margin-bottom: 20px;
  }

  /* Paragraph styling */
  p {
    font-size: 16px;
    color: #555;
    margin-bottom: 30px;
    line-height: 1.5;
  }

  /* Success message styling */
  .success-message {
    font-size: 18px;
    color: #333;
    font-weight: normal;
    margin-bottom: 20px;
    line-height: 1.6;
  }

  /* Button style for "Login Here" link */
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

  /* Responsive design for small screens */
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
    <h3>Registration Successful</h3>
    <p class="success-message"><c:out value="${message}"></c:out></p>
    <a href="/">Login Here</a>
  </div>
</body>
</html>
