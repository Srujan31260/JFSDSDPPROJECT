<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Citizen Dashboard</title>
<style>

body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f4f9;
    color: #333;
}

h2 {
    text-align: center;
    margin: 20px 0;
    color: #444;
}

.container {
    display: flex;
    justify-content: center;
    flex-wrap: wrap;
    gap: 20px;
    padding: 20px;
}

.card {
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    width: 250px;
    padding: 20px;
    text-align: center;
    transition: transform 0.3s ease, box-shadow 0.3s ease;
}

.card:hover {
    transform: translateY(-10px);
    box-shadow: 0 6px 12px rgba(0, 0, 0, 0.15);
}

.card i {
    font-size: 3rem;
    color: #007bff;
    margin-bottom: 10px;
}

.card p {
    font-size: 1.2rem;
    color: #666;
}

.card a {
    display: inline-block;
    margin-top: 10px;
    padding: 8px 15px;
    background-color: #007bff;
    color: #fff;
    text-decoration: none;
    border-radius: 5px;
    font-weight: bold;
    transition: background-color 0.3s ease;
}

.card a:hover {
    background-color: #0056b3;
}


.graph-container {
    margin: 40px auto;
    padding: 20px;
    max-width: 800px;
    background: #fff;
    border-radius: 10px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

.graph-container h3 {
    text-align: center;
    margin-bottom: 20px;
    color: #444;
}

canvas {
    width: 100%;
    height: 300px;
    margin-bottom: 20px;
}


@media (max-width: 768px) {
    .container {
        flex-direction: column;
        align-items: center;
    }

    .card {
        width: 90%;
    }
}
</style>

<script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
</head>
<body>
<%@include file="citinavbar.jsp" %>
<h2>Welcome to Citizen Dashboard</h2>

<div class="container">
   
    <div class="card">
        <i class="fas fa-exclamation-circle"></i>
        <p>Total Issues</p>
        <c:out value="${count1}"></c:out><br>
        <a href="viewallissues">View</a>
    </div>
    
    <div class="card">
        <i class="fas fa-calendar-alt"></i>
        <p>Total Events</p>
        <c:out value="${count2}"></c:out><br>
        <a href="viewevents">View</a>
    </div>
</div>


<div class="graph-container">
    <h3>Bar Chart: Issues vs. Events</h3>
    <canvas id="barChart"></canvas>
</div>

<div class="graph-container">
    <h3>Line Chart: Trends Over Time</h3>
    <canvas id="lineChart"></canvas>
</div>

<script>
    
    const count1 = <c:out value="${count1}"></c:out> || 0;
    const count2 = <c:out value="${count2}"></c:out> || 0;

  
    const labels = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun']; // Months
    const issueTrends = [5, 10, 15, 20, 18, 25]; // Example issue trends
    const eventTrends = [3, 7, 9, 12, 10, 14]; // Example event trends

  
    const barCtx = document.getElementById('barChart').getContext('2d');
    new Chart(barCtx, {
        type: 'bar',
        data: {
            labels: ['Total Issues', 'Total Events'],
            datasets: [{
                label: 'Citizen Data',
                data: [count1, count2],
                backgroundColor: [
                    'rgba(54, 162, 235, 0.6)', // Blue
                    'rgba(255, 99, 132, 0.6)'  // Red
                ],
                borderColor: [
                    'rgba(54, 162, 235, 1)',
                    'rgba(255, 99, 132, 1)'
                ],
                borderWidth: 1
            }]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });

   
    const lineCtx = document.getElementById('lineChart').getContext('2d');
    new Chart(lineCtx, {
        type: 'line',
        data: {
            labels: labels,
            datasets: [
                {
                    label: 'Issue Trends',
                    data: issueTrends,
                    borderColor: 'rgba(54, 162, 235, 1)',
                    backgroundColor: 'rgba(54, 162, 235, 0.2)',
                    fill: true
                },
                {
                    label: 'Event Trends',
                    data: eventTrends,
                    borderColor: 'rgba(255, 99, 132, 1)',
                    backgroundColor: 'rgba(255, 99, 132, 0.2)',
                    fill: true
                }
            ]
        },
        options: {
            responsive: true,
            scales: {
                y: {
                    beginAtZero: true
                }
            }
        }
    });
</script>
</body>
</html>
