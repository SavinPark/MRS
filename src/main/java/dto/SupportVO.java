package dto;

import java.sql.Date;

public class SupportVO {
	
	private int support_idx;
	private String support_type;
	private String employee_id;
	private int customer_id;
	private Date support_date;
	private String support_purpose;
	private int support_number_of_files;
	
	
	public int getSupport_idx() {
		return support_idx;
	}
	public void setSupport_idx(int support_idx) {
		this.support_idx = support_idx;
	}
	public String getSupport_type() {
		return support_type;
	}
	public void setSupport_type(String support_type) {
		this.support_type = support_type;
	}
	public String getEmployee_id() {
		return employee_id;
	}
	public void setEmployee_id(String employee_id) {
		this.employee_id = employee_id;
	}
	public int getCustomer_id() {
		return customer_id;
	}
	public void setCustomer_id(int customer_id) {
		this.customer_id = customer_id;
	}
	public Date getSupport_date() {
		return support_date;
	}
	public void setSupport_date(Date support_date) {
		this.support_date = support_date;
	}
	public String getSupport_purpose() {
		return support_purpose;
	}
	public void setSupport_purpose(String support_purpose) {
		this.support_purpose = support_purpose;
	}
	public int getSupport_number_of_files() {
		return support_number_of_files;
	}
	public void setSupport_number_of_files(int support_number_of_files) {
		this.support_number_of_files = support_number_of_files;
	}
	

}
