package service;

import java.util.List;

import dto.CustomerVO;

public interface CustomerService {
		
	// 조회
	public List<CustomerVO> selectCustomer() throws Exception;
	
	// 행의 개수
	public int countCustomer() throws Exception;
	
	// 조회 (10개)
	public List<CustomerVO> selectTenCustomer(int page) throws Exception;
	
	// 조회 (customer_id)
	public CustomerVO selectCustById(int customer_id) throws Exception;
	
	// customer_company 조회
	public List<String> selectCustCompany() throws Exception;
	// customer_department 조회 (customer_company)
	public List<String> selectCustDepartByCompany(String customer_company);
	// customer_manager 조회 (customer_company, cuatomer_department)
	public List<CustomerVO> selectCustManagerByCompDepart (CustomerVO customerVO);
	// customer_id 조회 (customer_company, customer_department, customer_manager)
	public int selectCustIDByCompDprtMngr(CustomerVO customerVO);
	
	// 등록
	public int insertCustomer(CustomerVO customerVO) throws Exception;

	// 삭제
	public int deleteCustomer(int customer_id) throws Exception;
	
	// 수정
	public int updateCustomer(CustomerVO customerVO) throws Exception;
}