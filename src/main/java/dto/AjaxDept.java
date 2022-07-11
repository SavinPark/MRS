package dto;

import java.util.List;

public class AjaxDept {
//{ "company" : "A컴퍼니" , "departmentList" : ["부서1", "부서A"]}
	private String company;
	private List<CustomerVO> departmentList;
	
	public String getCompany() {
		return company;
	}
	public void setCompany(String company) {
		this.company = company;
	}
	public List<CustomerVO> getDepartmentList() {
		return departmentList;
	}
	public void setDepartmentList(List<CustomerVO> departmentList) {
		this.departmentList = departmentList;
	}

}
