import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/viewAllTickets")
public class ViewAllTicketsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
       
        List<Complaint> tickets = fetchAllTickets();

       
        request.setAttribute("tickets", tickets);

        
        request.getRequestDispatcher("ViewAllTickets.jsp").forward(request, response);
    }

    private List<Complaint> fetchAllTickets() {
        List<Complaint> tickets = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(
            		 "SELECT i.id, i.description, i.software, i.severity, i.submission_date, e.emp_id " +
            				 "FROM incidents_queries i " +
            				 "JOIN employees e ON i.empId = e.emp_id"
)) {
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Complaint ticket = new Complaint();
                ticket.setId(resultSet.getInt("id"));
                ticket.setDescription(resultSet.getString("description"));
                ticket.setSoftware(resultSet.getString("software"));
                ticket.setSeverity(resultSet.getString("severity"));
                ticket.setSubmissionDate(resultSet.getTimestamp("submission_date"));
                ticket.setEmpId(resultSet.getString("emp_id")); // Set Employee ID
                tickets.add(ticket);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return tickets;
    }

}
