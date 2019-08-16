/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author Starixc
 */
public class getTabs extends HttpServlet {

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
            String link="";
            String cohortmonth="";
           
            cohortmonth=request.getParameter("cm");
               link=" <li class='nav-item btn btn-primary p-0  mr-1 mb-1'><a class='nav-link active'data-toggle='tab' data-target='#nav-home'>Add New</a></li>";
            if (cohortmonth.equals("3m")) {
                link+="<li class='nav-item btn btn-primary p-0  mr-1 mb-1' data-cohortmonth='3m'><a class='nav-link' data-toggle='tab' data-target='#nav-3months'>3m. Cohort</a></li>";
            } 
            if (cohortmonth.equals("6m")) {
                link+="<li class='nav-item btn btn-primary p-0  mr-1 mb-1' data-cohortmonth='3m'><a class='nav-link' data-toggle='tab' data-target='#nav-3months'>3m. Cohort</a></li>";
                link+="<li class='nav-item btn btn-primary p-0  mr-1 mb-1' data-cohortmonth='6m'><a class='nav-link' data-toggle='tab' data-target='#nav-6months'>6m. Cohort</a></li>";
            } 
            if (cohortmonth.equals("12m")) {
                link+="<li class='nav-item btn btn-primary p-0  mr-1 mb-1' data-cohortmonth='3m'><a class='nav-link' data-toggle='tab' data-target='#nav-3months'>3m. Cohort</a></li>";
                link+="<li class='nav-item btn btn-primary p-0  mr-1 mb-1' data-cohortmonth='6m'><a class='nav-link' data-toggle='tab' data-target='#nav-6months'>6m. Cohort</a></li>";
                link+="<li class='nav-item btn btn-primary p-0  mr-1 mb-1' data-cohortmonth='12m'><a class='nav-link' data-toggle='tab' data-target='#nav-12months'>12m. Cohort</a></li>";
            }
            out.println(link);
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
