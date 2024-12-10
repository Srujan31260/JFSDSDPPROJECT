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
            color: #fff;
            font-size: 19px;
        }

        .navbar1 {
            display: flex;
            align-items: center;
            justify-content: space-between;
            background-color: #335C81;
            padding: 6px 10px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.1);
        }

        .navbar-center {
            display: flex;
            justify-content: center;
            flex: 1;
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
            transition: all 0.3s ease-in-out;
            margin-right: 10px;
        }

        .navbar1 a:hover {
            background-color: #5679A6;
            border-radius: 4px;
            transform: scale(1.1);
        }

        .dropdown {
            position: relative;
            display: inline-block;
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
            display: flex;
            align-items: center;
            border-radius: 4px;
            transition: all 0.3s ease-in-out;
        }

        .dropbtn:hover {
            background-color: #5679A6;
            transform: scale(1.05);
            box-shadow: 0px 4px 8px rgba(0, 0, 0, 0.2);
        }

        .dropdown-content {
            display: none;
            position: absolute;
            background: linear-gradient(135deg, #5679A6, #A0C1D1);
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.3);
            border-radius: 8px;
            overflow: hidden;
            animation: fadeIn 0.3s ease-in-out;
            min-width: 200px;
            z-index: 1;
        }

        .dropdown-content a {
            color: #ffffff;
            padding: 12px 20px;
            text-decoration: none;
            display: flex;
            align-items: center;
            font-size: 16px;
            font-weight: normal;
            transition: all 0.3s ease-in-out;
        }

        .dropdown-content a i {
            margin-right: 10px;
            font-size: 18px;
        }

        .dropdown-content a:hover {
            background-color: rgba(255, 255, 255, 0.2);
            transform: translateX(10px);
        }

        .dropdown:hover .dropdown-content {
            display: block;
            animation: slideDown 0.3s ease-in-out;
        }

        .admin-info {
            display: flex;
            align-items: center;
            color: #ffffff;
            font-weight: bold;
            font-size: 18px;
            margin-right: 10px;
            cursor: pointer;
        }

        .admin-icon {
            height: 25px;
            width: 25px;
            margin-left: 5px;
        }

        .admin-dropdown:hover .dropdown-content {
            display: block;
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

        @keyframes slideDown {
            from {
                opacity: 0;
                transform: translateY(-20px);
            }
            to {
                opacity: 1;
                transform: translateY(0);
            }
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
        .navabr-right
        {
        	margin-right:50px;
        }
    </style>
</head>
<body>
    <div class="navbar1">
        <div class="title">
            <h3>Connect4Change</h3>
        </div>
        
        <div class="navbar-center">
            <a href="adminhome">Dashboard</a>
            <a href="polireg">Add Politician</a>
            <div class="dropdown">
                <button class="dropbtn">View</button>
                <div class="dropdown-content">
                    <a href="viewallpoli"><i class="fas fa-user-tie"></i>View Politician</a>
                    <a href="viewallciti"><i class="fas fa-users"></i>View Citizen</a>
                </div>
            </div>
        </div>

        <div class="navbar-right">
            <div class="admin-info admin-dropdown" style="margin-right: 90px;">
                <img src="https://t4.ftcdn.net/jpg/04/75/00/99/360_F_475009987_zwsk4c77x3cTpcI3W1C1LU4pOSyPKaqi.jpg" alt="Admin Icon" class="admin-icon" />
                <%-- <%=adm.getUsername() %> --%>
                <div class="dropdown-content">
                    <a href="adminlogout">
                        <i class="fas fa-sign-out-alt"></i>Logout
                    </a>
                </div>
            </div>
        </div>
    </div>
</body>
</html>
