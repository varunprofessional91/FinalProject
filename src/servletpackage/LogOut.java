package servletpackage;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LogOut1")

public class LogOut extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request,
                          HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        System.out.println("Your session was destroyed successfully!!");
        HttpSession session = request.getSession(false);
        // session.setAttribute("user", null);
        session.removeAttribute("username");
        session.getMaxInactiveInterval();
        request.getRequestDispatcher("index.jsp").forward(request, response);

    }
}
