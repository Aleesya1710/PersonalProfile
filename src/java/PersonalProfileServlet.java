/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

import ProfileBean.ProfileBean;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Hp V
 */
public class PersonalProfileServlet extends HttpServlet {

    /**
     * Processes requests for both HTTP <code>GET</code> and <code>POST</code>
     * methods.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
                response.setContentType("text/html;charset=UTF-8");

                String name = request.getParameter("name");
                String studentId = request.getParameter("studentId");
                String program = request.getParameter("program");
                String email = request.getParameter("email");
                String hobbies = request.getParameter("hobbies");
                String intro = request.getParameter("intro");
                 
                int id = Integer.parseInt(studentId);
                
                ProfileBean profile = new ProfileBean();
                profile.setStudentID(id);
                profile.setName(name);
                profile.setProgram(program);
                profile.setEmail(email);
                profile.setHobbies(hobbies);
                profile.setIntro(intro);
                
                try{
                    Connection conn = DriverManager.getConnection("jdbc:derby://localhost:1527/studentProfiles", "app", "app");
                    String query =  "insert into profiles(studentId, name, program, email, introduction, hobbies) values (?,?,?,?,?,?)";
                    PreparedStatement ps = conn.prepareStatement(query);
                    ps.setInt(1,profile.getStudentID());
                    ps.setString(2, profile.getName());
                    ps.setString(3, profile.getProgram());
                    ps.setString(4, profile.getEmail());
                    ps.setString(5, profile.getIntro());
                    ps.setString(6, profile.getHobbies());
                    ps.executeUpdate();
                }catch(SQLException e){
                     e.printStackTrace();
                }
                request.setAttribute("profile", profile);
                 request.getRequestDispatcher("profile.jsp").forward(request, response);
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
