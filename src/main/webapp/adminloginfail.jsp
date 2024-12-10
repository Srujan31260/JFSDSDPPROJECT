<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Login Failed</title>
<%@ include file="adminnavbar.jsp" %>
<style>

.container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    min-height: 35vh;
    background-color: #f9f9f9;
    padding: 50px 30px;
    border: 1px solid #ddd;
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
    border-radius: 10px;
    max-width: 370px;
    margin-top:140px;
    margin-left:505px;
    text-align: center;
    transition: all 0.3s ease-in-out;
}


.container .icon {
    font-size: 50px;
    color: #d9534f;
    margin-bottom: 20px;
    animation: shake 0.5s ease-in-out;
}

@keyframes shake {
    0%, 100% { transform: translateX(0); }
    25% { transform: translateX(-5px); }
    50% { transform: translateX(5px); }
    75% { transform: translateX(-5px); }
}

.container .message {
    font-size: 24px;
    color: #d9534f;
    margin-bottom: 20px;
    font-weight: bold;
}

.container a {
    text-decoration: none;
    color: #ffffff;
    background-color: #335C81;
    padding: 12px 28px;
    border-radius: 6px;
    font-size: 16px;
    font-weight: bold;
    transition: background-color 0.3s ease, transform 0.2s ease, box-shadow 0.3s ease;
    display: inline-block;
    margin-top: 20px;
}

.container a:hover {
    background-color: #27486b;
    transform: translateY(-3px);
    box-shadow: 0 8px 16px rgba(0, 0, 0, 0.2);
}
</style>
</head>
<body>
    <div class="container">
        <div class="icon">&#9888;</div> 
        <div class="message">
            <c:out value="${message}"></c:out>
        </div>
        <a href="adminlogin">Try Again</a>
    </div>
</body>
</html>
