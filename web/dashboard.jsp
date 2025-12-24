<%-- 
    Document   : dashboard
    Created on : Dec 23, 2025, 12:20:50 AM
    Author     : Hp V
--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Student Profile Dashboard</title>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <style>
            * {
                box-sizing: border-box;
                margin: 0;
                padding: 0;
            }
            body {
                font-family: 'Segoe UI', sans-serif;
                background: linear-gradient(to bottom, #FFBFCB   0%, #FEE7E5  100%);
                min-height: 100vh;
                padding: 40px 20px;
                display: flex;
                justify-content: center;
                align-items: center;
            }
            .container {
                width: 100%;
                max-width: 900px;
            }
            .header-card {
                background: white;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
                text-align: center;
                margin-bottom: 30px;
            }
            .header-card h1 {
                font-size: 2.5em;
                color: #333;
                margin-bottom: 10px;
            }
            .header-card p {
                font-size: 1.1em;
                color: #666;
            }
            .dashboard-grid {
                display: grid;
                grid-template-columns: repeat(auto-fit, minmax(280px, 1fr));
                gap: 25px;
            }
            .card {
                background: white;
                padding: 35px;
                border-radius: 20px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
                text-decoration: none;
                transition: transform 0.3s, box-shadow 0.3s;
                cursor: pointer;
                border-left: 5px solid #ec4899;
            }
            .card:hover {
                transform: translateY(-10px);
                box-shadow: 0 15px 50px rgba(236, 72, 153, 0.3);
            }
            .card-icon {
                font-size: 3em;
                margin-bottom: 15px;
            }
            .card-title {
                font-size: 1.5em;
                font-weight: 700;
                color: #333;
                margin-bottom: 10px;
            }
            .card-description {
                font-size: 0.95em;
                color: #666;
                line-height: 1.5;
            }
            .card {
                border-left-color: #ec4899;
            }
            
            .card:hover {
                box-shadow: 0 15px 50px rgba(236, 72, 153, 0.3);
            }
            
            @media (max-width: 768px) {
                .header-card h1 {
                    font-size: 2em;
                }
                .dashboard-grid {
                    grid-template-columns: 1fr;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <!-- Header Card -->
            <div class="header-card">
                <h1>🎓 Student Profile System</h1>
                <p>Manage your student profiles with ease</p>
            </div>
            
            <!-- Dashboard Cards -->
            <div class="dashboard-grid">
                <!-- Create Profile Card -->
                <a href="index.html" class="card create">
                    <div class="card-icon">✏️</div>
                    <div class="card-title">Create Profile</div>
                    <div class="card-description">
                        Add a new student profile.
                    </div>
                </a>
                
                <!-- View Profiles Card -->
                <a href="viewProfiles.jsp" class="card view">
                    <div class="card-icon">👥</div>
                    <div class="card-title">View All Profiles</div>
                    <div class="card-description">
                        Browse, search, and filter through all student profiles in the database.
                    </div>
                </a>
            </div>
        </div>
    </body>
</html>