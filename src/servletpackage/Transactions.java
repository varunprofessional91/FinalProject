package servletpackage;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.sql.Timestamp;
import java.sql.Date;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;


@WebServlet("/Transactions1")

public class Transactions extends HttpServlet
{
    private static final long serialVersionUID = 1L;
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NumberFormatException
    {

        try {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb", "root", "");

            HttpSession session = request.getSession();
            String usr = String.valueOf(session.getAttribute("username"));

            Date date2 = new Date(new java.util.Date().getTime());

            Timestamp date = new Timestamp(new java.util.Date().getTime());

            String accno = request.getParameter("accno");

            String transactions = request.getParameter("transactions");

            String amt1 = request.getParameter("amt");

            if(!accno.isEmpty() && !amt1.isEmpty())
            {
                float balance = 0;
                String accname="";
                String accno1 ="";
                float amt = Float.valueOf(request.getParameter("amt"));

                PreparedStatement ps = c.prepareStatement("select accname, accno, balance from acc_created where username=? and accno= ?");
                ps.setString(1, usr);
                ps.setString(2, accno);

                ResultSet rs = ps.executeQuery();

                while (rs.next())
                {
                    accname = rs.getString("accname");
                    accno1 = rs.getString("accno");
                    balance = rs.getFloat("balance");
                }

                if (accno.equals(accno1))
                {
                    if (transactions.equals("credit") && accno.equals(accno1))
                    {
                        balance = balance + amt;
                    }
                    else if (transactions.equals("debit") && accno.equals(accno1))
                    {
                        balance = balance - amt;
                    }
                    else
                        {
                        rs.close();
                        c.close();
                        }

                    PreparedStatement up = c.prepareStatement("update acc_created set balance = ? where username = ?");
                    PreparedStatement ins = c.prepareStatement("insert into transactions values(?,?,?,?,?,?,?)");

                    up.setFloat(1, balance);
                    up.setString(2, usr);


                    ins.setDate(1, date2);
                    ins.setString(2, usr);
                    ins.setString(3, accname);
                    ins.setString(4, accno1);
                    ins.setString(5, transactions);
                    ins.setFloat(6, amt);
                    ins.setFloat(7, balance);

                    up.executeUpdate();
                    ins.executeUpdate();

                    request.setAttribute("message", "Transaction Successful");
                    request.getRequestDispatcher("transactions.jsp").forward(request, response);

                    up.close();
                    ins.close();
                    c.close();

                } else {
                    request.setAttribute("message", "Wrong Account No");
                    request.getRequestDispatcher("transactions.jsp").forward(request, response);
                }
                return;
            }

            else
            {
                request.setAttribute("message", "Invalid Input");
                request.getRequestDispatcher("transactions.jsp").forward(request, response);

            }
        }

        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}