<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>SDP Project</title>
  <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">
   <style>
  
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Arial', sans-serif;
    }

    body {
      background-color: linear-gradient(135deg, #6c63ff, #2575fc);
      color: #333;
      overflow-x: hidden;
      line-height: 1.6;
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
       background: linear-gradient(135deg, #6c63ff, #2575fc); 
      padding: 12px 20px;
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
      transform: scale(1.1); 
    }

    .dropdown {
      position: relative;
      display: inline-block;
      margin-right: 70px;
    }

    .dropbtn {
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
       background: linear-gradient(135deg, #6c63ff, #2575fc);
    }

    .dropbtn:hover {
      transform: scale(1.05); 
    }

    .dropdown-content {
      display: none;
      position: absolute;
       background: linear-gradient(135deg, #6c63ff, #2575fc); /* Updated dropdown background */
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
      animation: fadeIn 0.3s ease-in-out;
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

    /* Home Section Styling */
    .home {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 50px 10%;
      background: linear-gradient(135deg, #6c63ff, #2575fc); /* Home color */
      color: white;
      min-height: 100vh;
      clip-path: ellipse(150% 100% at 50% 0%);
    }

    .home .content {
      max-width: 50%;
    }

    .home h1 {
      font-size: 3rem;
      margin-bottom: 20px;
      font-weight: bold;
    }

    .home p {
      font-size: 1.2rem;
      line-height: 1.8;
      margin-bottom: 20px;
    }

    .home .btn {
      background-color: #ff8a00;
      color: white;
      padding: 12px 25px;
      font-size: 1rem;
      border-radius: 25px;
      border: none;
      cursor: pointer;
      text-decoration: none;
      font-weight: bold;
      transition: background 0.3s ease;
    }

    .home .btn:hover {
      background-color: #e76b00;
    }

    .home .image {
      max-width: 70%;
      
    }
	
    .home .image img {
      width: 100%;
      border-radius: 15px;
    }
	.image img {
    width: 100%;
    max-width: 1200px;
    margin-right: 2px;
    display: block;
}
	
    /* Divider Styling */
    .divider {
      width: 80%;
      height: 2px;
      background-color: #ddd;
      margin: 40px auto;
    }

    /* About Section Styling */
    .about, .contact {
      display: flex;
      justify-content: space-between;
      align-items: center;
      padding: 60px 10%;
      background-color: linear-gradient(135deg, #00b4d8, #0077b6);
      margin-bottom: 40px;
      border-radius: 15px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    .about h2, .contact h2 {
      font-size: 2.5rem;
      color: black;
      margin-bottom: 20px;
    }

    .about p, .contact p {
      font-size: 1.1rem;
      line-height: 1.8;
      margin-bottom: 20px;
      color: black;
      max-width: 400px;
    }

    .section-card img {
      max-width: 100%;
      border-radius: 10px;
    }

    .image-left, .image-right {
      flex: 1;
      max-width: 40%;
    }

    .content-left, .content-right {
      flex: 2;
    }

    .content-left {
      margin-left: 200px;
    }

    /* Contact Section Image Styling */
    .image-right img {
      width: 120%;
      border-radius: 10px;
    }

    /* Footer */
    footer {
      text-align: center;
      padding: 15px;
      background-color: #333;
      color: white;
      font-size: 0.9rem;
    }

    .social-icons {
      margin-top: 15px;
    }

    .social-icons a {
      margin: 0 10px;
    }

    .social-icons img {
      width: 30px;
      height: 30px;
    }
  </style>
</head>
<body>
  <!-- Navbar -->
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

  <!-- Home Section -->
  <section class="home">
    <div class="content">
      <h1>Bridging the Gap Between Citizens and Representatives</h1>
      <p>Your voice matters - report concerns, provide feedback,<br> and stay engaged with your elected officials.</p>
      <a href="#about" class="btn">Learn More</a>
    </div>
    <div class="image">
      <img src="https://www.shutterstock.com/image-vector/flat-tiny-democracy-vector-illustration-600nw-1360488131.jpg" alt="Home Image">
    </div>
  </section>

  <!-- Divider -->
  <div class="divider"></div>

  <!-- About Section -->
  <section class="about" id="about">
    <div class="content-left">
      <h2>About Us</h2>
      <p>Connect4Change is a platform dedicated to enhancing transparency and communication between citizens and their elected representatives. It empowers citizens to voice their concerns, track progress, and stay informed about community affairs.</p>
    </div>
    <div class="image-left">
      <img src="https://media.istockphoto.com/id/816887384/photo/about-us.jpg?s=612x612&w=0&k=20&c=2X8lobqw8nUWHMshyfcExb7jmF73u9XzIBAsVMjLFv4=" alt="About Image">
    </div>
  </section>

  <!-- Contact Section -->
   <section class="contact">
    <div class="content-right">
      <h2>CONTACT US</h2>
      <p>We value your feedback and are here to help with any questions or concerns. Please feel free to reach out using the following contact details or submit an inquiry through the form below.</p>
      <p>Email: support@citizenrepconnect.com<br>
         Phone: +1-800-555-0123<br>
         Address: 123 Civic Engagement Lane, Governance City, State, ZIP</p>
      <p>For technical support or assistance navigating the platform, our team is available Monday to Friday, 9 AM - 5 PM. Thank you for helping us build a more transparent and responsive government.</p>
    </div>
    <div class="image-right">
      <img src="https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTNDuU4Buq0L-bPAhlTo-N9C-ILrht2A_VxSA&s" alt="Contact Us Image">
    </div>
  </section>

  <footer>
    <p>&copy; 2024 CitizenRepConnect. All Rights Reserved.</p>
    <div class="social-icons">
      <a href="https://facebook.com" target="_blank">
        <img src="https://upload.wikimedia.org/wikipedia/commons/5/51/Facebook_f_logo_%282019%29.svg" alt="Facebook">
      </a>
      <a href="https://instagram.com" target="_blank">
        <img src="https://upload.wikimedia.org/wikipedia/commons/a/a5/Instagram_icon.png" alt="Instagram">
      </a>
      <a href="https://linkedin.com" target="_blank">
        <img src="https://upload.wikimedia.org/wikipedia/commons/0/01/LinkedIn_Logo.svg" alt="LinkedIn">
      </a>
    </div>
  </footer>

</body>
</html>
