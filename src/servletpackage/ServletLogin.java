package servletpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ServletLogin1")

public class ServletLogin extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        String un=request.getParameter("username");
        String pw=request.getParameter("password");

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb", "root", "");

            PreparedStatement ps = c.prepareStatement("select username,password from jdbc_connection where username=? and password=?");
            ps.setString(1, un);
            ps.setString(2, pw);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                HttpSession session = request.getSession(true);
                session.setAttribute("username", un);
                session.setMaxInactiveInterval(60*60*24*90);
                response.sendRedirect("welcome.jsp");
                return;
            }

            request.setAttribute("message", "Invalid Username / Password");
            request.getRequestDispatcher("index.jsp").forward(request,response);
            return;

            }

        catch (ClassNotFoundException | SQLException e)
                {
                 e.printStackTrace();
                }
    }

}