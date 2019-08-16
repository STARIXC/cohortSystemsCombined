/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package data;

import static com.db.OSValidator.isUnix;
import com.db.dbConn;
import java.io.*;
import static java.lang.System.in;
import java.net.URL;
import java.sql.*;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author starixc
 */
public class databasesave extends HttpServlet {

    String host, dbase, user, password;
    static String dbsetup;
    String url, dbconnpath;
    String status;

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException, ClassNotFoundException, InstantiationException, IllegalAccessException {
        response.setContentType("text/html;charset=UTF-8");
        try {
            PrintWriter out = response.getWriter();
            status = "";
            if (request.getParameter("hostname") == null) {
                host = "localhost:3306";
            } else {
                host = request.getParameter("hostname");
            }

            if (request.getParameter("database") == null) {
                dbase = "pmtct_art_cohort";
            } else {
                dbase = request.getParameter("database");
            }
            if (request.getParameter("user") == null) {
                user = "root";
            } else {
                user = request.getParameter("user");
            }
            if (request.getParameter("password") == null) {

                password = "admin";
            } else {
                password = request.getParameter("password");
            }
            System.out.println("pass entered is : " + password);
            //CREATE A PATH IN THE COMPUTER FOR STORING TEXT FILES
            String allpath = getServletContext().getRealPath("/dbase.txt");
            String mydrive = allpath.substring(0, 1);
            dbconnpath = mydrive + ":\\TB_REGISTER\\_\\_\\";
            dbsetup = dbconnpath + "\\dbase.txt";
            if (isUnix()) {
                dbconnpath = "//TB_REGISTER/_/_";
                dbsetup = dbconnpath + "/dbase.txt";
            }
            //CREATE A DIRECTORY
            new File(dbconnpath).mkdirs();
            //write into the File
            try {
                FileWriter fw = new FileWriter(dbsetup);
                BufferedWriter bw = new BufferedWriter(fw);
                bw.write(host + "\n" + dbase + "\n" + user + "\n" + password.trim());
                bw.close();
            } catch (IOException e) {
            }
            //get line count
            getLineCount(dbsetup);
            response.setContentType("text/html;charset=UTF-8");
             url = "jdbc:mysql://" + host + "/" + dbase + "";
            
            status = "failed to connect";
            try {
                Connection connection = null;
                System.out.println("Connecting databse ...");
                Class.forName("com.mysql.jdbc.Driver").newInstance();
                connection = DriverManager.getConnection(url, user, password);
                System.out.println("Database Connected!");
                status = "success";
                } catch (SQLException e) {
                status = "failed";
                System.out.println("status : " + status + " error " + e);
            }
            System.out.println("status : "+status);
            out.println(status);
            
            
        } catch (FileNotFoundException notfound) {
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(databasesave.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(databasesave.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(databasesave.class.getName()).log(Level.SEVERE, null, ex);
        }
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
        try {
            processRequest(request, response);
        } catch (ClassNotFoundException ex) {
            Logger.getLogger(databasesave.class.getName()).log(Level.SEVERE, null, ex);
        } catch (InstantiationException ex) {
            Logger.getLogger(databasesave.class.getName()).log(Level.SEVERE, null, ex);
        } catch (IllegalAccessException ex) {
            Logger.getLogger(databasesave.class.getName()).log(Level.SEVERE, null, ex);
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

    private void getLineCount(String dbsetup) throws FileNotFoundException, IOException{
      File file = new File(dbsetup);
      // Open the file
    FileInputStream fstream = new FileInputStream(file);
    BufferedReader br = new BufferedReader(new InputStreamReader(fstream));
        String strLine;

//Read File Line By Line
while ((strLine = br.readLine()) != null)   {
  // Print the content on the console
  System.out.println (strLine);
}

//Close the input stream
fstream.close();
      //get the objects of the Input Stream
      /**  DataInputStream din = new DataInputStream(fin);
        BufferedReader  br = new BufferedReader(new InputStreamReader(in));
        String strLine;
        //reading file line by line
        while ((strLine = br.readLine()) !=null) {   
            System.out.println("=="+strLine);
        }
        in.close();**/
    }
    public void createbd(){
        try {
            URL location = dbConn.class.getProtectionDomain().getCodeSource().getLocation();
            String mydrive = location.getFile().substring(1,2);
            String command =mydrive+":/xampp/mysql/bin mysql -u -p"+password+""+dbase+" FILE.sql";
            if (isUnix()) {
                command="mydql --u root -p"+password+""+dbase+" File.sqql";
           }
            Runtime.getRuntime().exec(command);
        } catch (IOException ex) {
            Logger.getLogger(databasesave.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

}
