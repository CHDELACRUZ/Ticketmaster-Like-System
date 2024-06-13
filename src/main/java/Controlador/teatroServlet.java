/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/Servlet.java to edit this template
 */
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

/**
 *
 * @author PC
 */
@WebServlet(name = "teatroServlet", urlPatterns = {"/teatroServlet"})
public class teatroServlet extends HttpServlet {

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
            out.println("<title>Servlet teatroServlet</title>");
            out.println("</head>");
            out.println("<body>");
            out.println("<h1>Servlet teatroServlet at " + request.getContextPath() + "</h1>");
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
    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        // Obtener parámetros del formulario
        String lugar = request.getParameter("lugar");
        String fecha = request.getParameter("fecha");
        String hora = request.getParameter("hora");
        int precioBoleto = Integer.parseInt(request.getParameter("precioBoleto"));
        String capacidadLugar = request.getParameter("capacidadLugar");
        int cantidadBoletos = Integer.parseInt(request.getParameter("cantidadBoletos"));
        String metodoPago = request.getParameter("metodoPago");
        String numeroTarjeta = request.getParameter("numeroTarjeta");
        String nombreTitular = request.getParameter("nombreTitular");
        int totalPago = cantidadBoletos * precioBoleto;
        //Crear el contenido del boleto
        String contenidoBoleto = "----- BOLETO DE TEATRO -----\n"
                + "Lugar: " + lugar + "\n"
                + "Fecha: " + fecha + "\n"
                + "Hora: " + hora + "\n"
                + "Precio del boleto: " + precioBoleto + "\n"
                + "Capacidad del lugar: " + capacidadLugar + "\n"
                + "Cantidad de boletos: " + cantidadBoletos + "\n"
                + "Total a pagar: " + totalPago + "\n"
                + "Método de pago: " + metodoPago + "\n"
                + "Número de tarjeta: " + numeroTarjeta + "\n"
                + "Nombre del titular: " + nombreTitular + "\n"
                + "-------------------------------";

        //Enviar el contenido del boleto como respuesta
        response.setContentType("text/plain");
        PrintWriter out = response.getWriter();
        out.print(contenidoBoleto);
        out.close();

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
