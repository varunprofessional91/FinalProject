package servletpackage;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/AccInfo1")

public class AccInfo extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb", "root", "");

            HttpSession session = request.getSession();
            String usr = String.valueOf(session.getAttribute("username"));

//            PreparedStatement ps=c.prepareStatement("select * from transactions where username = ?");
//            ps.setString(1,usr);
//
//            ResultSet rs = ps.executeQuery();
//
//            String date = "";
//            String accname = "";
//            String accno = "";
//            String dob = "";
//            String address = "";
//            String acctype  = "";
//            String balance = "";
//
//            while(rs.next())
//            {
//             date = rs.getString("date");
//             accname = rs.getString("accname");
//             accno = rs.getString("accno");
//             dob = rs.getString("dob");
//             address = rs.getString("address");
//             acctype = rs.getString("acctype");
//             balance = rs.getString("balance");
//            }

//            System.out.println(date+" | "+accname+" | "+accno+" | "+dob+" | "+address+" | "+acctype+" | "+balance);

            System.out.println("Servlet Working");



////            request.setAttribute("message", "View Statements");
//            request.setAttribute("users", users);
//            RequestDispatcher view = request.getRequestDispatcher("statements.jsp");
//            view.forward(request, response);

        }

        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}