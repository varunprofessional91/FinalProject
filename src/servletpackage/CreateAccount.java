package servletpackage;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/CreateAccount1")

public class CreateAccount extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException, NullPointerException {

        try
        {
            Class.forName("com.mysql.jdbc.Driver");
            Connection c = DriverManager.getConnection("jdbc:mysql://localhost:3306/jspweb", "root", "");

            HttpSession session = request.getSession();
            String usr = String.valueOf(session.getAttribute("username"));

            String accname = request.getParameter("accname");
            String dob = request.getParameter("dob");
            String address = request.getParameter("address");
            String amt = request.getParameter("transaction");

            if(!accname.isEmpty() && !dob.isEmpty() && !address.isEmpty() && !amt.isEmpty())
            {
                String acctype = request.getParameter("acctype");

                PreparedStatement ck = c.prepareStatement("select username from acc_created where username = ?");
                ck.setString(1, usr);

                ResultSet uc = ck.executeQuery();

                String str = "";

                while (uc.next())
                {
                    str = uc.getString("username");
                }

                System.out.println(str + " " + usr);

                if (!str.equals(usr))
                {

                    PreparedStatement st = c.prepareStatement("insert into acc_created values(?,?,?,?,?,?,?,?,?,?)");
                    PreparedStatement sst = c.prepareStatement("insert into cardno values(?,?)");
                    PreparedStatement ssst = c.prepareStatement("insert into cvvno values(?,?)");

                    java.sql.Timestamp date = new java.sql.Timestamp(new java.util.Date().getTime());

                    st.setTimestamp(1, date);
                    st.setString(2, request.getParameter("accno"));
                    st.setString(3, String.valueOf(session.getAttribute("username")));
                    st.setString(4, request.getParameter("accname"));
                    st.setString(5, request.getParameter("dob"));
                    st.setString(6, request.getParameter("acctype"));
                    st.setString(7, "credit");
                    st.setFloat(8, Float.valueOf(request.getParameter("transaction")));
                    st.setFloat(9, Float.valueOf(request.getParameter("transaction")));
                    st.setString(10, request.getParameter("address"));

                    sst.setString(1, String.valueOf(session.getAttribute("username")));
                    sst.setString(2, request.getParameter("cardno"));

                    ssst.setString(1, String.valueOf(session.getAttribute("username")));
                    ssst.setString(2, request.getParameter("cvvno"));

                    st.executeUpdate();
                    sst.executeUpdate();
                    ssst.executeUpdate();

                    st.close();
                    sst.close();
                    ssst.close();
                    c.close();

                    request.setAttribute("message", "Account Created Successfully");
                    request.getRequestDispatcher("accinfo.jsp").forward(request, response);
                }

                else
                    {
                    request.setAttribute("message", "Account Already Exist");
                    request.getRequestDispatcher("welcome.jsp").forward(request, response);
                    }
            }

            else
                {
                    request.setAttribute("message", "Invalid Input");
                    request.getRequestDispatcher("create_account.jsp").forward(request, response);
                }
        }

        catch (Exception e)
        {
            e.printStackTrace();
        }
    }

}