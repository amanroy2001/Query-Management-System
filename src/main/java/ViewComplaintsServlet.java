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
import javax.servlet.http.HttpSession;

@WebServlet("/viewComplaints")
public class ViewComplaintsServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        HttpSession session = request.getSession();
        String empId = (String) session.getAttribute("empId");

        
        List<Complaint> complaints = fetchComplaintsForEmployee(empId);

       
        request.setAttribute("complaints", complaints);

        
        request.getRequestDispatcher("complaints.jsp").forward(request, response);
    }

    private List<Complaint> fetchComplaintsForEmployee(String empId) {
        List<Complaint> complaints = new ArrayList<>();
        try (Connection conn = DBUtil.getConnection();
             PreparedStatement preparedStatement = conn.prepareStatement(
                     "SELECT * FROM incidents_queries WHERE empId = ?")) {
            preparedStatement.setString(1, empId);
            ResultSet resultSet = preparedStatement.executeQuery();

            while (resultSet.next()) {
                Complaint complaint = new Complaint();
                complaint.setId(resultSet.getInt("id"));
                complaint.setDescription(resultSet.getString("description"));
                complaint.setSoftware(resultSet.getString("software"));
                complaint.setSeverity(resultSet.getString("severity"));
                complaint.setSubmissionDate(resultSet.getTimestamp("submission_date"));
                complaints.add(complaint);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return complaints;
    }
}
