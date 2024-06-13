/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import Modelo.DataBaseConnection;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

/**
 *
 * @author PC
 */
@WebServlet(name = "menuPrincipal", urlPatterns = {"/menuPrincipal"})
public class menuPrincipal extends HttpServlet {

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
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet menuPrincipal</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet menuPrincipal at " + request.getContextPath() + "</h1>");
            out.println("</body>");
            out.println("</html>");
        }
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
    String nombre = request.getParameter("txtUsuario");
    String contrasena = request.getParameter("txtContrasena");
    String accion = request.getParameter("accion");

    try {
        Connection con = DataBaseConnection.initializeDatabase();
        PreparedStatement st = con.prepareStatement("SELECT * FROM usuario WHERE nombre = ? AND contrasena = ?");
        st.setString(1, nombre);
        st.setString(2, contrasena);

        ResultSet rs = st.executeQuery();
        if (rs.next()) {
            HttpSession sesion = request.getSession();
            sesion.setAttribute("nombre", nombre);
            response.sendRedirect("menuPrincipal.jsp");
        } else if (nombre.isEmpty()) {
            request.setAttribute("mensaje", "<font color=red>Usuario y/o Contraseña incorrectos</font>");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        } else {
            request.setAttribute("mensaje", "<font color=red>Usuario y/o Contraseña incorrectos</font>");
            request.getRequestDispatcher("Login.jsp").forward(request, response);
        }
        rs.close();
        st.close();
        con.close();
    } catch (Exception e) {
        e.printStackTrace();
    }

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
