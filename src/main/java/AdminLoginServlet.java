import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/adminLogin")
public class AdminLoginServlet extends HttpServlet {
    private static final String ADMIN_ID = "admin"; 
    private static final String ADMIN_PASSWORD = "admin123";

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String adminId = request.getParameter("adminId");
        String password = request.getParameter("password");

        if (ADMIN_ID.equals(adminId) && ADMIN_PASSWORD.equals(password)) {
            
            HttpSession session = request.getSession();
            session.setAttribute("adminId", adminId);
            response.sendRedirect("admindashboard.jsp");
        } else {
            
            response.sendRedirect("adminLogin.jsp?error=1");
        }
    }
}
