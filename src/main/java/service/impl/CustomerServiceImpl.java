package service.impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.CustomerDAO;
import dto.CustomerVO;
import service.CustomerService;


//@Service
@Service("CustomerService")
public class CustomerServiceImpl implements CustomerService {
	
	@Resource(name = "CustomerDAO")
	private CustomerDAO customerDao;
	
	// 조회
	@Override
	public List<CustomerVO> selectCustomer() throws Exception {
		return customerDao.selectCustomer();
	}
	
	// 행의 개수
	@Override
	public int countCustomer() throws Exception {
		return customerDao.countCustomer();
	}
	
	// 조회 (10개)
	@Override
	public List<CustomerVO> selectTenCustomer(int page) throws Exception {
		return customerDao.selectTenCustomer(page);
	}
	
	// 조회 (customer_id)
	@Override
	public CustomerVO selectCustById(int customer_id) throws Exception {
		return customerDao.selectCustById(customer_id);
	}
	
	// customer_company 조회
	@Override
	public List<String> selectCustCompany() throws Exception {
		return customerDao.selectCustCompany();
	}
	// customer_department 조회 (customer_company)
	@Override
	public List<String> selectCustDepartByCompany(String customer_company) {
		return customerDao.selectCustDepartByCompany(customer_company);
	}
	// customer_manager 조회 (customer_company, customer_department)
	@Override
	public List<CustomerVO> selectCustManagerByCompDepart(CustomerVO customerVO) {
		return customerDao.selectCustManagerByCompDepart(customerVO);
	}
	// customer_id 조회 (customer_company, customer_department, customer_manager)
	@Override
	public int selectCustIDByCompDprtMngr(CustomerVO customerVO) {
		return customerDao.selectCustIDByCompDprtMngr(customerVO);
	}

	// 등록
	@Override
	public int insertCustomer(CustomerVO params) throws Exception {
		return customerDao.insertCustomer(params);
	}
	
	// 삭제
	@Override
	public int deleteCustomer(int customer_id) throws Exception {
		return customerDao.deleteCustomer(customer_id);
	}

	// 수정
	@Override
	public int updateCustomer(CustomerVO customerVO) throws Exception {
		return customerDao.updateCustomer(customerVO);
	}

}
