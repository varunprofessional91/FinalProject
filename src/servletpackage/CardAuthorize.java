package servletpackage;

import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CardAuthorize1")

public class CardAuthorize extends HttpServlet
{
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {

        try {
            Class.forName("com.mysql.jdbc.Driver");

            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb", "root", "");

            HttpSession session = request.getSession();
            String usr = String.valueOf(session.getAttribute("username"));

            String accname = request.getParameter("accname");
            String cardno2 = request.getParameter("cardno");
            String amt2 = request.getParameter("amt");

            if(!accname.isEmpty() && !cardno2.isEmpty() && !amt2.isEmpty()) {
                long cardno = Long.valueOf(request.getParameter("cardno"));
                int cvvno = Integer.valueOf(request.getParameter("cvvno"));
                float amt = Float.valueOf(request.getParameter("amt"));

                String accname1 = "";
                long cardno1 = 0;
                int cvvno1 = 0;

                PreparedStatement ps = c.prepareStatement("select acc_created.accname, cardno.cardno, cvvno.cvvno from acc_created, cardno, cvvno where acc_created.username = ? and cardno.username = ? and cvvno.username = ?");
                ps.setString(1, usr);
                ps.setString(2, usr);
                ps.setString(3, usr);

                ResultSet rs = ps.executeQuery();

                System.out.println("ResultSet Successfully");

                while (rs.next()) {
                    accname1 = rs.getString("accname");
                    cardno1 = rs.getLong("cardno");
                    cvvno1 = rs.getInt("cvvno");

                }

                if (cardno == cardno1 && cvvno == cvvno1 && accname.equals(accname1)) {
                    if (amt < 100000.0) {
                        System.out.println("successful");
                        request.setAttribute("message", "Card Authorized Successfully");
                    } else {
                        request.setAttribute("message", "Amount Should Be Below One Lakh");
                    }

                } else {
                    System.out.println("not successful");
                    request.setAttribute("message", "Input Did Not Match");
                }

                request.getRequestDispatcher("cardauthorize.jsp").forward(request, response);

                rs.close();
                c.close();
                return;
            }
            else
            {
                request.setAttribute("message", "Invalid Input");
                request.getRequestDispatcher("cardauthorize.jsp").forward(request, response);
            }
        }

        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}
