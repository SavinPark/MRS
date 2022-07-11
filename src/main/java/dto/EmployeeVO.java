package dto;

import java.sql.Date;

public class EmployeeVO {
	
	private String employee_id;
	private String employee_password;
	private String employee_department;
	private String employee_manager;
	private String employee_email;
	private String employee_contact;
	private Date employee_last_access_date;
	
	
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public String getEmployee_password() {
		return employee_password;
	}
	public void setEmployee_password(String employee_password) {
		this.employee_password = employee_password;
	}
	public String getEmployee_department() {
		return employee_department;
	}
	public void setEmployee_department(String employee_department) {
		this.employee_department = employee_department;
	}
	public String getEmployee_manager() {
		return employee_manager;
	}
	public void setEmployee_manager(String employee_manager) {
		this.employee_manager = employee_manager;
	}
	public String getEmployee_email() {
		return employee_email;
	}
	public void setEmployee_email(String employee_email) {
		this.employee_email = employee_email;
	}
	public String getEmployee_contact() {
		return employee_contact;
	}
	public void setEmployee_contact(String employee_contact) {
		this.employee_contact = employee_contact;
	}
	public Date getEmployee_last_access_date() {
		return employee_last_access_date;
	}
	public void setEmployee_last_access_date(Date employee_last_access_date) {
		this.employee_last_access_date = employee_last_access_date;
	}
	
	
}
