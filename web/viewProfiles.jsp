<%-- 
    Document   : viewProfiles
    Created on : Dec 22, 2025, 10:23:14 PM
    Author     : Hp V
--%>

<%@page contentType="text/html" pageEncoding="UTF-8" import="java.sql.*" %>
<!DOCTYPE html>
<html>
    <head>
        <title>View All Profiles</title>
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
                align-items: flex-start;
            }
            .container {
                width: 100%;
                max-width: 1200px;
            }
            .header-card {
                background: white;
                padding: 25px 40px;
                border-radius: 20px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
                margin-bottom: 30px;
                display: flex;
                align-items: center;
                position: relative;
            }
            .back-arrow {
                font-size: 1.8em;
                color: #333;
                text-decoration: none;
                margin-right: 20px;
                cursor: pointer;
            }
            .back-arrow:hover {
                color: #ec4899;
            }
            .header-card h1 {
                font-size: 1.8em;
                color: #333;
                flex: 1;
                text-align: center;
            }
            .spacer {
                width: 40px;
            }
            .content-card {
                background: white;
                padding: 40px;
                border-radius: 20px;
                box-shadow: 0 10px 40px rgba(0, 0, 0, 0.1);
            }
            .search-filter-bar {
                display: flex;
                gap: 15px;
                margin-bottom: 25px;
                flex-wrap: wrap;
            }
            .search-box, .filter-box {
                flex: 1;
                min-width: 200px;
            }
            .search-box input, .filter-box select {
                width: 100%;
                padding: 12px 15px;
                border: 2px solid #f3f4f6;
                border-radius: 10px;
                font-size: 0.95em;
                font-family: 'Segoe UI', sans-serif;
                transition: border-color 0.3s;
            }
            .search-box input:focus, .filter-box select:focus {
                outline: none;
                border-color: #ec4899;
            }
            .search-box input::placeholder {
                color: #9ca3af;
            }
            .clear-btn {
                padding: 12px 25px;
                background: linear-gradient(135deg, #ec4899 0%, #f472b6 100%);
                color: white;
                border: none;
                border-radius: 10px;
                font-weight: 600;
                cursor: pointer;
                transition: transform 0.2s;
            }
            .clear-btn:hover {
                transform: translateY(-2px);
            }
            .no-results {
                text-align: center;
                padding: 40px;
                color: #666;
                font-size: 1.1em;
            }
            .table-wrapper {
                overflow-x: auto;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            thead tr {
                background: transparent;
            }
            th {
                padding: 15px;
                text-align: left;
                font-weight: 600;
                font-size: 1em;
                color: #6366f1;
                border-bottom: 2px solid #f3f4f6;
            }
            tbody tr {
                border-bottom: 1px solid #f3f4f6;
            }
            tbody tr:last-child {
                border-bottom: none;
            }
            td {
                padding: 18px 15px;
                color: #333;
                font-size: 0.95em;
                background: #fef9fb;
                position: relative;
            }
            td:first-child {
                border-left: 4px solid #ec4899;
                border-top-left-radius: 8px;
                border-bottom-left-radius: 8px;
                font-weight: 600;
                color: #333;
            }
            td:last-child {
                border-top-right-radius: 8px;
                border-bottom-right-radius: 8px;
            }
            tbody tr:hover td {
                background: #fef3f7;
            }
            .error-message {
                background: #fee;
                color: #dc2626;
                padding: 20px;
                border-radius: 10px;
                margin-top: 20px;
                text-align: center;
                border-left: 4px solid #dc2626;
            }
            .no-data {
                text-align: center;
                padding: 40px;
                color: #666;
                font-size: 1.1em;
            }
            @media (max-width: 768px) {
                .content-card {
                    padding: 20px;
 
                }
                th, td {
                    padding: 10px;
                    font-size: 0.85em;
                }
                .header-card h1 {
                    font-size: 1.4em;
                }
            }
        </style>
    </head>
    <body>
        <div class="container">
            <div class="header-card">
                <a href="dashboard.jsp" class="back-arrow">↩</a>
                <h1>Personal Profile</h1>
                <div class="spacer"></div>
            </div>
            
            <!-- Content Card with Table -->
            <div class="content-card" style="padding-bottom: 10px; margin-bottom: 20px; ">
                <div class="search-filter-bar">
                    <div class="search-box">
                        <input type="text" id="searchInput" placeholder="🔍 Search by name, email, or hobbies..." onkeyup="filterTable()">
                    </div>
                    <div class="filter-box">
                        <select id="programFilter" onchange="filterTable()">
                            <option value="">All Programs</option>
                            <%
                                Connection connFilter = null;
                                PreparedStatement psFilter = null;
                                ResultSet rsFilter = null;
                                try {
                                    connFilter = DriverManager.getConnection("jdbc:derby://localhost:1527/studentProfiles", "app", "app");
                                    psFilter = connFilter.prepareStatement("SELECT DISTINCT program FROM profiles ORDER BY program");
                                    rsFilter = psFilter.executeQuery();
                                    while(rsFilter.next()) {
                                        String prog = rsFilter.getString("program");
                                        if(prog != null && !prog.trim().isEmpty()) {
                            %>
                            <option value="<%= prog %>"><%= prog %></option>
                            <%
                                        }
                                    }
                                } catch(Exception e) {
                                } finally {
                                    if(rsFilter != null) try { rsFilter.close(); } catch(SQLException ex) {}
                                    if(psFilter != null) try { psFilter.close(); } catch(SQLException ex) {}
                                    if(connFilter != null) try { connFilter.close(); } catch(SQLException ex) {}
                                }
                            %>
                        </select>
                    </div>
                    <button class="clear-btn" onclick="clearFilters()">Clear</button>
                </div>
            </div>
                <div class="content-card">
                <div class="table-wrapper">
                    <table>
                        <thead>
                            <tr>
                                <th>Student ID</th>
                                <th>Name</th>
                                <th>Program</th>
                                <th>Email</th>
                                <th>Self Introduction</th>
                                <th>Hobbies</th>
                            </tr>
                        </thead>
                        <tbody>
                        <% 
                            Connection conn = null;
                            PreparedStatement ps = null;
                            ResultSet rs = null;
                            boolean hasData = false;
                            
                            try{
                                Class.forName("org.apache.derby.jdbc.ClientDriver");
                                conn = DriverManager.getConnection("jdbc:derby://localhost:1527/studentProfiles", "app", "app");
                                String query = "SELECT * FROM profiles";
                                ps = conn.prepareStatement(query);
                                rs = ps.executeQuery();
                                
                                while(rs.next()){
                                    hasData = true;
                         %>
                         <tr>
                             <td><%= rs.getInt("studentId") %></td>
                             <td><%= rs.getString("name") %></td>
                             <td><%= rs.getString("program") %></td>
                             <td><%= rs.getString("email") %></td>
                             <td><%= rs.getString("introduction") %></td>
                             <td><%= rs.getString("hobbies") %></td>
                         </tr>                                           
                       
                        <%
                                }
                                
                            } catch(Exception e) {
                        %>
                      
                    <div class="error-message">
                        <strong>Error:</strong> <%= e.getMessage() %>
                    </div>
                        <%
                            } finally {
                               if(rs != null) try { rs.close(); } catch(SQLException ex) {}
                               if(ps != null) try { ps.close(); } catch(SQLException ex) {}
                               if(conn != null) try { conn.close(); } catch(SQLException ex) {}
                            }
                            
                            if(hasData) {
                        %>
                        </tbody>
                    </table>
                        <%
                            }
                        %>
                </div>
            </div>
        </div>
        
        <script>
            function filterTable() {
                const searchInput = document.getElementById('searchInput').value.toLowerCase();
                const programFilter = document.getElementById('programFilter').value.toLowerCase();
                const table = document.querySelector('tbody');
                const rows = table.getElementsByTagName('tr');
                let visibleCount = 0;
                
                for (let i = 0; i < rows.length; i++) {
                    const cells = rows[i].getElementsByTagName('td');
                    if (cells.length > 0) {
                        const id = cells[0].textContent.toLowerCase();
                        const name = cells[1].textContent.toLowerCase();
                        const program = cells[2].textContent.toLowerCase();
                        const email = cells[3].textContent.toLowerCase();
                        const intro = cells[4].textContent.toLowerCase();
                        const hobbies = cells[5].textContent.toLowerCase();
                        
                        const matchesSearch = searchInput === '' || 
                            name.includes(searchInput) || 
                            email.includes(searchInput) || 
                            intro.includes(searchInput) ||
                            hobbies.includes(searchInput) ||
                            id.includes(searchInput);
                        
                        const matchesProgram = programFilter === '' || program.includes(programFilter);
                        
                        if (matchesSearch && matchesProgram) {
                            rows[i].style.display = '';
                            visibleCount++;
                        } else {
                            rows[i].style.display = 'none';
                        }
                    }
                }
                
                const noResults = document.getElementById('noResults');
                if (visibleCount === 0) {
                    noResults.style.display = 'block';
                } else {
                    noResults.style.display = 'none';
                }
            }          
            function clearFilters() {
                document.getElementById('searchInput').value = '';
                document.getElementById('programFilter').value = '';
                filterTable();
            }
        </script>
    </body>
</html>