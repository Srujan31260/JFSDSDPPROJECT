<!DOCTYPE html>
<html>
<head>
    <title>Event Registration</title>

   
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">

    <style>
        h3 {
            font-size: 32px;
            color: #2c3e50;
            font-weight: bold;
            text-align: center;
            margin-top: 20px;
            margin-bottom: 40px;
            text-transform: uppercase;
            letter-spacing: 2px;
        }

        h3 u {
            text-decoration-color: #3498db;
            text-decoration-thickness: 3px;
        }

        .form-container {
            width: 80%;
            max-width: 1000px;
            background-color: white;
            border-radius: 12px;
            box-shadow: 0 10px 30px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: row;
            overflow: hidden;
            margin: 20px auto;
        }

        /* Form Section */
        form {
            flex: 2;
            padding: 20px 30px;
        }

        table {
            width: 100%;
            border-spacing: 10px;
        }

        label {
            font-size: 18px;
            color: #34495e;
            font-weight: 600;
            
        }

        input[type="text"], input[type="date"], textarea {
            width: 100%;
            padding: 10px;
            font-size: 16px;
            border: 1px solid #ddd;
            border-radius: 6px;
            box-shadow: inset 0 1px 3px rgba(0, 0, 0, 0.1);
            transition: border-color 0.3s ease;
        }

        input[type="text"]:focus, input[type="date"]:focus, textarea:focus {
            border-color: #3498db;
            outline: none;
        }

        textarea {
            resize: none;
            height: 80px;
        }

        .button-container {
            text-align: center;
            margin-top: 20px;
        }

        input[type="submit"], input[type="reset"] {
            background-color: #2980b9;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            font-weight: bold;
            border-radius: 6px;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        input[type="submit"]:hover, input[type="reset"]:hover {
            background-color: #1abc9c;
            transform: translateY(-2px);
        }

        .image-container {
            flex: 1;
            background-image: url('https://banner2.cleanpng.com/20180523/xro/kisspng-computer-icons-organization-logo-coventry-high-sch-sensory-lab-5b0572943a7b33.3930669015270836682396.jpg');
            background-size: contain;
            background-position: center;
            background-repeat: no-repeat;
            border-left: 1px solid #ddd;
        }

        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
            }

            .image-container {
                height: 200px;
                border-left: none;
                border-top: 1px solid #ddd;
            }
        }
    </style>
</head>
<body>
    <%@include file="polinavbar.jsp" %>
    <h3><u>Event Registration</u></h3>

 
    <div class="form-container">
     
        <form method="post" action="insertevent">
            <table>
                <tr>
                    <td><label for="etitle"><i class="fas fa-pen"></i> Enter Event Title</label></td>
                    <td><input type="text" id="etitle" name="etitle" required/></td>
                </tr>
                <tr>
                    <td><label for="edescription"><i class="fas fa-info-circle"></i> Enter Event Description</label></td>
                    <td><textarea id="edescription" name="edescription" required></textarea></td>
                </tr>
                <tr>
                    <td><label for="econstituency"><i class="fas fa-map-marker-alt"></i> Enter Constituency</label></td>
                    <td><textarea id="econstituency" name="econstituency" required></textarea></td>
                </tr>
                <tr>
                    <td><label for="elocation"><i class="fas fa-map-pin"></i> Enter Event Location</label></td>
                    <td><input type="text" id="elocation" name="elocation" required/></td>
                </tr>
                <tr>
                    <td><label for="edate"><i class="fas fa-calendar-alt"></i> Enter Event Date</label></td>
                    <td><input type="date" id="edate" name="edate" required/></td>
                </tr>
                <tr>
                    <td colspan="2" class="button-container">
                        <input type="submit" value="Register Event"/>
                        <input type="reset" value="Clear"/>
                    </td>
                </tr>
            </table>
        </form>

      
        <div class="image-container"></div>
    </div>
</body>
</html>
