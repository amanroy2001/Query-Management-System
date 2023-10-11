import java.sql.Timestamp;

public class Complaint {
    private int id;
    private String description;
    private String software;
    private String empId;
    public int getId() {
		return id;
		
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getSoftware() {
		return software;
	}
	public void setSoftware(String software) {
		this.software = software;
	}
	public String getSeverity() {
		return severity;
	}
	public void setSeverity(String severity) {
		this.severity = severity;
	}
	public Timestamp getSubmissionDate() {
		return submissionDate;
	}
	public void setSubmissionDate(Timestamp submissionDate) {
		this.submissionDate = submissionDate;
	}
	public void setEmpId(String empId) {
        this.empId = empId;
    }

   
    public String getEmpId() {
        return empId;}
	private String severity;
    @Override
	public String toString() {
		return "Complaint [id=" + id + ", description=" + description + ", software=" + software + ", severity="
				+ severity + ", submissionDate=" + submissionDate + "]";
	}
	private Timestamp submissionDate;

   
}


