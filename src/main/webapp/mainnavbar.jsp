<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SDP Project</title>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
<style>
body {
    background-color: #E3F2FD;
    font-family: Arial, sans-serif;
    margin: 0;
    padding: 0;
    box-sizing: border-box;
}

h3 {
    color: #ffffff; 
    margin-top: 10px;
    font-size: 1.5em;
}

.navbar1 {
    display: flex;
    align-items: center; 
    justify-content: space-between; 
    background-color: #335C81;
    padding: 12px 20px; 
    box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
}

.navbar1 .title {
    display: flex;
    align-items: center; 
}

.navbar1 .title img {
    height: 40px; 
    margin-right: 10px; 
}

.navbar1 a {
    color: #ffffff; 
    text-decoration: none;
    padding: 12px 20px;
    text-transform: uppercase;
    font-weight: bold;
    transition: background-color 0.3s, transform 0.3s;
    margin-right: 30px;
}

.navbar1 a:hover {
    background-color: #5679A6; 
    border-radius: 4px;
    transform: scale(1.1); /* Add hover effect for links */
}

.dropdown {
    position: relative;
    display: inline-block;
   margin-right:70px;
}

.dropbtn {
    background-color: #335C81;
    color: #ffffff; 
    padding: 12px 20px;
    border: none;
    cursor: pointer;
    font-weight: bold;
    text-transform: uppercase;
    font-size: 17px;
    transition: background-color 0.3s, transform 0.3s;
    border-radius: 5px;
    box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
     
}

.dropbtn:hover {
    /* background-color: #5679A6;  */
    transform: scale(1.05); /* Slightly enlarge on hover */
}

.dropdown-content {
    display: none;
    position: absolute;
    background: linear-gradient(135deg, #5679A6, #A0C1D1); /* Gradient background */
    box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
    border-radius: 8px;
    z-index: 1;
    overflow: hidden;
    animation: fadeIn 0.3s ease-in-out; /* Add fade-in animation */
    width: 170px;
    
}

@keyframes fadeIn {
    from {
        opacity: 0;
        transform: translateY(-10px);
    }
    to {
        opacity: 1;
        transform: translateY(0);
    }
}

.dropdown-content a {
    color: #ffffff; 
    padding: 12px 20px;
    text-decoration: none;
    display: flex;
    align-items: center;
    font-weight: normal;
    transition: background-color 0.3s, transform 0.3s;
    font-size: 16px;
}

.dropdown-content a i {
    margin-right: 10px; /* Spacing for the icon */
    font-size: 18px;
}

.dropdown-content a:hover {
    background-color: rgba(255, 255, 255, 0.2); 
    transform: translateX(10px); /* Slide effect on hover */
}

.dropdown:hover .dropdown-content {
    display: block; 
    animation: fadeIn 0.3s ease-in-out; /* Apply animation when displayed */
}

@media (max-width: 768px) {
    .navbar1 {
        flex-direction: column;
        align-items: center;
    }

    .navbar1 a, .dropdown .dropbtn {
        padding: 10px;
        margin: 5px;
        font-size: 14px; 
    }
}
</style>
</head>
<body>
    
    <div class="navbar1">
        <div class="title">
        
                    <h3>Connect4Change</h3>
        </div>
        <div style="margin-left: auto;"> 
            <a href="/">Home</a>
            <a href="citireg">Citizen SignUp</a>
            <div class="dropdown">
                <button class="dropbtn">Login</button>
                <div class="dropdown-content">
                    <a href="adminlogin"><i class="fas fa-user-shield"></i>Admin Login</a>
                    <a href="polilogin"><i class="fas fa-user-tie"></i>Politician Login</a>
                    <a href="citilogin"><i class="fas fa-user"></i>Citizen Login</a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
