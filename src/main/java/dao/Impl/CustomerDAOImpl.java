package dao.Impl;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dao.CustomerDAO;
import dto.CustomerVO;

@Repository("CustomerDAO")
public class CustomerDAOImpl implements CustomerDAO {

	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	// 조회
	@Override
	public List<CustomerVO> selectCustomer() throws Exception {
		return sqlSession.selectList("mapper.customerMapper.selectCustomer");
	}
	
	// 행의 개수
	@Override
	public int countCustomer() throws Exception {
		return sqlSession.selectOne("mapper.customerMapper.countCustomer");
	}
	
	// 조회 (10개)
	@Override
	public List<CustomerVO> selectTenCustomer(int page) throws Exception {
		return sqlSession.selectList("mapper.customerMapper.selectTenCustomer", page);
	}
	
	// 조회 (customer_id)
	@Override
	public CustomerVO selectCustById(int customer_id) throws Exception {
		return sqlSession.selectOne("mapper.customerMapper.selectCustById", customer_id);
	}
	
	// customer_company 조회
	@Override
	public List<String> selectCustCompany() throws Exception {
		return sqlSession.selectList("mapper.customerMapper.selectCustCompany");
	}
	// customer_department 조회 (customer_company)
	@Override
	public List<String> selectCustDepartByCompany(String customer_company) {
		return sqlSession.selectList("mapper.customerMapper.selectCustDepartByCompany", customer_company);
	}
	// customer_manager 조회 (customer_company, customer_department)
	@Override
	public List<CustomerVO> selectCustManagerByCompDepart(CustomerVO customerVO) {
		return sqlSession.selectList("mapper.customerMapper.selectCustManagerByCompDepart", customerVO);
	}
	// customer_id 조회 (customer_company, customer_department, customer_manager)
	@Override
	public int selectCustIDByCompDprtMngr(CustomerVO customerVO) {
		return sqlSession.selectOne("mapper.customerMapper.selectCustIDByCompDprtMngr", customerVO);
	}
	
	// 등록
	@Override
	public int insertCustomer(CustomerVO params) throws Exception {
		return sqlSession.insert("mapper.customerMapper.insertCustomer", params);
	}
	// 삭제
	@Override
	public int deleteCustomer(int customer_id) throws Exception {
		return sqlSession.delete("mapper.customerMapper.deleteCustomer", customer_id);
	}
	// 수정
	@Override
	public int updateCustomer(CustomerVO customerVO) throws Exception {
		return sqlSession.update("mapper.customerMapper.updateCustomer", customerVO);
	}


}