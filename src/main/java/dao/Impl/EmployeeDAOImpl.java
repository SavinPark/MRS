package dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dao.EmployeeDAO;
import dto.EmployeeVO;

@Repository("EmployeeDAO")
public class EmployeeDAOImpl implements EmployeeDAO{
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	// 조회
	@Override
	public List<EmployeeVO> selectEmployee() throws Exception {
		return sqlSession.selectList("mapper.employeeMapper.selectEmployee");
	}
	
	// 총 행의 개수
	@Override
	public int countEmployee() throws Exception {
		return sqlSession.selectOne("mapper.employeeMapper.countEmployee");
	}
	
	// 조회 (한 페이지에 10건)
	@Override
	public List<EmployeeVO> selectTenEmployee(int page) throws Exception {
		return sqlSession.selectList("mapper.employeeMapper.selectTenEmployee", page);
	}

	// 조회 (employee_id)
	@Override
	public EmployeeVO selectEmpById(String employee_id) throws Exception {
		return sqlSession.selectOne("mapper.employeeMapper.selectEmpById", employee_id);
	}
	
	// 조회 (employee_id, employee_password)
	@Override
	public EmployeeVO selectEmpByIdPw(EmployeeVO employeeVO) throws Exception {
		return sqlSession.selectOne("mapper.employeeMapper.selectEmpByIdPw", employeeVO);
	}
	
	// employee_id, employee_manager 조회
	@Override
	public List<EmployeeVO> selectEmpIdAndManager() throws Exception {
		return sqlSession.selectList("mapper.employeeMapper.selectEmpIdAndManager");
	}
	
	// 등록(회원가입)
	@Override
	public int insertEmployee(EmployeeVO params) throws Exception {
		return sqlSession.insert("mapper.employeeMapper.insertEmployee", params);
	}

	// 삭제(계정 삭제, 탈퇴)
	@Override
	public int deleteEmployee(EmployeeVO employeeVO) throws Exception {
		return sqlSession.delete("mapper.employeeMapper.deleteEmployee", employeeVO);
	}

	// 수정(내 정보 수정)
	@Override
	public int updateEmployee(EmployeeVO employeeVO) throws Exception {
		return sqlSession.update("mapper.employeeMapper.updateEmployee", employeeVO);
	}

}