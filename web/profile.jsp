<%-- 
    Document   : profile
    Created on : Dec 22, 2025, 10:39:27 PM
    Author     : Hp V
--%>

<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="ProfileBean.ProfileBean"%>
<!DOCTYPE html>
<html>
<head>
    <title>Profile</title>
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
            display: flex;
            justify-content: center;
            align-items: flex-start;
            padding: 40px 20px;
        }
        .wrapper {
            width: 100%;
            max-width: 750px;
        }
        .header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            margin-top: 10px;
            margin-bottom: 50px;
            background: #fff5f7 ;
            padding: 25px;
            border-radius: 25px;
            box-shadow: 0 30px 60px rgba(0, 0, 0, .15);
        }
        .back-link {
            color: black;
            text-decoration: none;
            font-weight: 500;
            font-size: 2.3em;
        }
        .title {
            color: black;
            font-size: 1.6em;
            font-weight: 700;
        }
        .profile-box {
            background: #fff5f7 ;
            padding: 35px;
            border-radius: 25px;
            box-shadow: 0 30px 60px rgba(0, 0, 0, .15);
        }
        .section-title {
            font-size: 1.8em;
            font-weight: 700;
            color: #333;
            margin-bottom: 20px;
        }
        .grid {
            display: grid;
            grid-template-columns: 1fr 1fr;
            gap: 20px;          
        }      
        .label {
            font-weight: 500;
            color: #667eea;
            margin-bottom: 6px;
        }
        .value {
            font-size: 1em;
            color: #333;
            font-weight: 400;           
        }
       .box {
            padding: 20px;
            background: #ffffff;
            border-radius: 15px;
            border-left: 4px solid #ED729E;
            margin-bottom: 15px;
        }
    </style>
</head>
<body>
    <% ProfileBean profile = (ProfileBean)request.getAttribute("profile"); %>
    <div class="wrapper">
        <div class="header">
            <a href="dashboard.jsp" class="back-link">⤺</a>
            <span class="title">Personal Profile</span>
            <span style="width:40px;"></span>
        </div>
        <div class="profile-box">
            <div class="section-title">👋🏻Hi, <%= profile.getName() %></div>
            <div class="grid">
                <div class="box">
                    <div class="label">🪪 Student ID</div>
                    <div class="value"><%= profile.getStudentID() %></div>
                </div>
                <div class="box">
                    <div class="label">🎓 Program</div>
                    <div class="value"><%= profile.getProgram() %></div>
                </div>
            </div>
                <div class="box">
                    <div class="label">📧 Email</div>
                    <div class="value"><%= profile.getEmail() %></div>
                </div>
            <div class="box">
                <div class="label">👤 Self Introduction</div>
                <div class="value" style="min-height:100px"><%= profile.getIntro() %></div>
            </div>
            <div class="box">
                <div class="label">⚽ Hobbies</div>
                <div class="value"><%= profile.getHobbies() %></div>
            </div>
        </div>
    </div>
</body>
</html>

