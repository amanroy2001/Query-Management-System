import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/auth")
public class AuthServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        String action = request.getParameter("action");

        if ("register".equals(action)) {
            
            String empId = request.getParameter("empId");
            String name = request.getParameter("name");
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            String dept = request.getParameter("dept");

            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement preparedStatement = conn.prepareStatement(
                     "INSERT INTO employees (emp_id, name, email, password, dept) VALUES (?, ?, ?, ?, ?)")) {

                preparedStatement.setString(1, empId);
                preparedStatement.setString(2, name);
                preparedStatement.setString(3, email);
                preparedStatement.setString(4, password);
                preparedStatement.setString(5, dept);

                preparedStatement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
                
            }

            response.sendRedirect("login.jsp");

        } else if ("login".equals(action)) {
            
            String empId = request.getParameter("empId");
            String password = request.getParameter("password");

            try (Connection conn = DBUtil.getConnection();
                 PreparedStatement preparedStatement = conn.prepareStatement("SELECT * FROM employees WHERE emp_id = ? AND password = ?")) {
                preparedStatement.setString(1, empId);
                preparedStatement.setString(2, password);
                ResultSet resultSet = preparedStatement.executeQuery();

                if (resultSet.next()) {
                    
                    HttpSession session = request.getSession();
                    session.setAttribute("empId", empId);
                    
                    

                    response.sendRedirect("dashboard.jsp");
                } else {
                    response.sendRedirect("login.jsp?error=1");
                }
            } catch (SQLException e) {
                e.printStackTrace();
            }

        }
    }
}
