<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Spring Boot MVC SDP Project</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">
    <style>
        body {
            background-color: #E3F2FD;
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        .navbar {
            display: flex;
            justify-content: space-between;
            align-items: center;
            background-color: #335C81;
            padding: 15px 20px;
            box-shadow: 0px 4px 10px rgba(0, 0, 0, 0.15);
        }

        .navbar .title {
            display: flex;
            align-items: center;
        }

        .navbar .title h3 {
            color: #FFFFFF;
            font-size: 1.8em;
            margin: 0;
        }

        .navbar-center {
            display: flex;
            align-items: center;
            margin-left: auto;
        }

        .navbar-center a {
            color: #FFFFFF;
            text-decoration: none;
            padding: 12px 20px;
            font-size: 1rem;
            font-weight: bold;
            text-transform: uppercase;
            display: flex;
            align-items: center;
            border-radius: 4px;
            transition: background-color 0.3s, transform 0.2s;
        }

        .navbar-center a i {
            margin-right: 8px;
        }

        .navbar-center a:hover {
            background-color: #5679A6;
            transform: scale(1.05);
        }

        .dropdown {
            position: relative;
            margin-left: 20px;
        }

        .profile-icon {
            color: #FFFFFF;
            font-size: 1.2rem;
            cursor: pointer;
            padding: 12px 20px;
            border-radius: 50%;
            background-color: #5679A6;
            transition: background-color 0.3s, transform 0.2s;
        }

        .profile-icon:hover {
            background-color: #7299C9;
            transform: scale(1.1);
        }

        .dropdown-content {
            display: none;
            position: absolute;
            right: 0;
            background-color: #335C81;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0px 8px 15px rgba(0, 0, 0, 0.2);
            z-index: 1000;
        }

        .dropdown-content a {
            color: #FFFFFF;
            padding: 12px 16px;
            text-decoration: none;
            font-size: 0.95rem;
            display: flex;
            align-items: center;
            border-bottom: 1px solid rgba(255, 255, 255, 0.2);
        }

        .dropdown-content a:last-child {
            border-bottom: none;
        }

        .dropdown-content a i {
            margin-right: 10px;
        }

        .dropdown-content a:hover {
            background-color: #5679A6;
        }

        .dropdown:hover .dropdown-content {
            display: block;
        }

        @media (max-width: 768px) {
            .navbar {
                flex-direction: column;
                align-items: flex-start;
            }

            .navbar-center {
                flex-direction: column;
                align-items: flex-start;
                margin-left: 0;
            }

            .navbar-center a {
                width: 100%;
                padding: 10px;
                font-size: 0.9rem;
            }

            .dropdown {
                margin-left: 0;
            }

            .dropdown-content a {
                font-size: 0.85rem;
            }
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div class="title">
            <h3>Connect4Change</h3>
        </div>

        <div class="navbar-center">
            <a href="polihome"><i class="fas fa-home"></i>Home</a>
            <a href="viewcitizenissuebycons"><i class="fas fa-exclamation-circle"></i>Issues</a>
        </div>

        <div class="dropdown">
            <div class="profile-icon">
                <i class="fas fa-user"></i>
            </div>
            <div class="dropdown-content">
                <a href="poliprofile"><i class="fas fa-user-circle"></i>Profile</a>
                <a href="viewallfeedbacks"><i class="fas fa-comments"></i>View Feedback</a>
                <a href="addevent"><i class="fas fa-calendar-plus"></i>Add Event</a>
                <a href="viewallevents"><i class="fas fa-calendar-alt"></i>View Events</a>
                <a href="viewallappliedevents"><i class="fas fa-check-circle"></i>View All Applied Events</a>
                <a href="polilogout"><i class="fas fa-sign-out-alt"></i>Logout</a>
            </div>
        </div>
    </div>
</body>
</html>
