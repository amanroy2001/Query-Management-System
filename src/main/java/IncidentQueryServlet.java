import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.UUID;

@WebServlet("/IncidentQueryServlet")
public class IncidentQueryServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        
        String type = request.getParameter("type");
        String description = request.getParameter("description");
        String software = request.getParameter("software");
        String severity = request.getParameter("severity");

        
        HttpSession session = request.getSession();
        String empId = (String) session.getAttribute("empId");

        
        String ticketNumber = generateTicketNumber();
      //  request.setAttribute("ticketNumber", ticketNumber);
		/*
		 * HttpSession session1 = request.getSession();
		 * session1.setAttribute("ticketNumber", ticketNumber)
		 */;
      //  request.setAttribute("ticketNumber", ticketNumber);
        System.out.println("Ticket Number in Servlet: " + ticketNumber);


       
        storeIncidentQueryInDatabase(empId, type, description, software, severity, ticketNumber);

        
       // response.sendRedirect("confirmation.jsp");
    
        request.setAttribute("ticketNumber", ticketNumber);

        
        try {
			request.getRequestDispatcher("confirmation.jsp").forward(request, response);
		} catch (ServletException | IOException e) {
			
			e.printStackTrace();
		}

    }

    private String generateTicketNumber() {
       
        String timestamp = String.valueOf(System.currentTimeMillis());
        String random = UUID.randomUUID().toString().substring(0, 8);
        
        return "TICKET-" + timestamp + "-" + random;
        
    }

    private void storeIncidentQueryInDatabase(String empId, String type, String description, String software, String severity, String ticketNumber) {
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(
                 "INSERT INTO incidents_queries (empId, ticketNumber, type, description, software, severity) VALUES (?, ?, ?, ?, ?, ?)")) {
            preparedStatement.setString(1, empId); 
            preparedStatement.setString(2, ticketNumber); 
            preparedStatement.setString(3, type);
            preparedStatement.setString(4, description);
            preparedStatement.setString(5, software);
            preparedStatement.setString(6, severity);

            preparedStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
           
        }
    }
}