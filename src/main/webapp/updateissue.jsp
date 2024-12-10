<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Solution</title>

    <!-- Font Awesome for Icons -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css">

    <style>
        /* General Body Styles */
        body {
            font-family: 'Arial', sans-serif;
            background-color: #f4f7fc;
            margin: 0;
            padding: 0;
            color: #333;
            line-height: 1.6;
        }

        /* Header Styling */
        h2 {
            text-align: center;
            font-size: 2em;
            color: #4CAF50;
            margin-bottom: 20px;
        }

        /* Form Container */
        .form-container {
            width: 80%;
            max-width: 800px;
            margin: 20px auto;
            padding: 20px;
            background-color: #ffffff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        /* Labels */
        label {
            font-size: 1.1em;
            margin-bottom: 8px;
            display: block;
            color: #333;
        }

        /* Textarea Styling */
        textarea {
            width: 100%;
            padding: 12px;
            font-size: 1em;
            border: 2px solid #ddd;
            border-radius: 5px;
            box-sizing: border-box;
            resize: vertical;
        }

        textarea:focus {
            outline: none;
            border-color: #4CAF50;
        }

        /* Button Styling */
        button {
            padding: 12px 20px;
            background-color: #4CAF50;
            color: white;
            font-size: 1.1em;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 20px;
            transition: background-color 0.3s ease;
        }

        button:hover {
            background-color: #45a049;
        }

        /* Back Link Styling */
        a {
            display: block;
            text-align: center;
            margin-top: 20px;
            text-decoration: none;
            color: #4CAF50;
            font-size: 1.1em;
            transition: color 0.3s ease;
        }

        a:hover {
            color: #45a049;
        }

        /* Styling for Output Values (like Aadhaar No, Name, etc.) */
        .output-value {
            font-size: 1.1em;
            margin: 8px 0;
            padding: 8px;
            background-color: #f1f1f1;
            border-radius: 5px;
            border: 1px solid #ddd;
        }

        /* Icon Styling */
        .icon {
            width: 24px;
            height: 24px;
            vertical-align: middle;
            margin-right: 8px;
        }

        /* Input and Label Alignment */
        .input-group {
            margin-bottom: 15px;
        }

        /* Additional Styling for the Page Layout */
        .container {
            padding: 20px;
            max-width: 1000px;
            margin: auto;
        }

        /* Small Responsiveness */
        @media (max-width: 768px) {
            body {
                padding: 20px;
            }

            .form-container {
                width: 95%;
            }

            button {
                width: 100%;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h2>Updating Solution <i class="fas fa-check-circle" style="color: #4CAF50;"></i></h2>
        <div class="form-container">
            <p><strong>Message:</strong> <c:out value="${msg}"></c:out></p>
            
            <div class="input-group">
                <label for="adno">Aadhaar No:</label>
                <div class="output-value"><c:out value="${issue.adno}"></c:out></div>
            </div>

            <div class="input-group">
                <label for="name">Name:</label>
                <div class="output-value"><c:out value="${issue.name}"></c:out></div>
            </div>

            <div class="input-group">
                <label for="constituency">Constituency:</label>
                <div class="output-value"><c:out value="${issue.constituency}"></c:out></div>
            </div>

            <div class="input-group">
                <label for="address">Address:</label>
                <div class="output-value"><c:out value="${issue.address}"></c:out></div>
            </div>

            <div class="input-group">
                <label for="problem">Problem:</label>
                <div class="output-value"><c:out value="${issue.problem}"></c:out></div>
            </div>

            <form method="post" action="submitsolution">
                <input type="hidden" name="rid" value="${issue.rid}"/>
                <label for="solution">Solution:</label><br>
                <textarea id="solution" name="solution" rows="4" cols="50" required><c:out value="${issue.solution}"></c:out></textarea><br><br>
                <button type="submit"><i class="fas fa-paper-plane"></i> Submit</button>
            </form>

            <a href="polihome"><i class="fas fa-arrow-left"></i> Back</a>
        </div>
    </div>
</body>
</html>
