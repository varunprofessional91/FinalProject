package servletpackage;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/Statements1")

public class Statements extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb", "root", "");

            HttpSession session = request.getSession();
            String usr = String.valueOf(session.getAttribute("username"));

            String fd = request.getParameter("fromdate");
            String td = request.getParameter("todate");

            if (!fd.isEmpty() && !td.isEmpty())
            {

                PreparedStatement ps = c.prepareStatement("select * from transactions where username=? and date between ? and ? order by date");
                ps.setString(1, usr);
                ps.setDate(2, Date.valueOf(fd));
                ps.setDate(3, Date.valueOf(td));

                ResultSet rs = ps.executeQuery();

                ArrayList<User> users = new ArrayList<User>();

                while (rs.next()) {
                    User user = new User();
                    user.setDate(rs.getString("date"));
                    user.setAccname(rs.getString("accname"));
                    user.setAccno(rs.getString("accno"));
                    user.setTransactions(rs.getString("transactions"));
                    user.setAmt(rs.getString("amt"));
                    user.setBalance(rs.getString("balance"));
                    users.add(user);
                }

                request.setAttribute("usersList", users);
                RequestDispatcher view = request.getRequestDispatcher("statements.jsp");
                view.forward(request, response);
            }
            else
            {
                request.setAttribute("message", "Invalid Input");
                request.getRequestDispatcher("statements.jsp").forward(request, response);

            }
        }


        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}