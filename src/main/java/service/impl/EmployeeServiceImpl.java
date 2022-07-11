package service.impl;

import java.util.List;
import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.EmployeeDAO;
import dto.EmployeeVO;
import service.EmployeeService;


@Service("EmployeeService")
public class EmployeeServiceImpl implements EmployeeService {

	@Resource(name = "EmployeeDAO")
	private EmployeeDAO employeeDao;
	
	// 조회
	@Override
	public List<EmployeeVO> selectEmployee() throws Exception {
		return employeeDao.selectEmployee();
	}
	
	// 총 행의 개수
	@Override
	public int countEmployee() throws Exception {
		return employeeDao.countEmployee();
	}
	
	// 조회 (한 페이지에 10건)
	@Override
	public List<EmployeeVO> selectTenEmployee(int page) throws Exception {
		return employeeDao.selectTenEmployee(page);
	}

	// 조회 (employee_id)
	@Override
	public EmployeeVO selectEmpById(String employee_id) throws Exception {
		return employeeDao.selectEmpById(employee_id);
	}
	
	// 조회 (employee_id, employee_password)
	@Override
	public EmployeeVO selectEmpByIdPw(EmployeeVO employeeVO) throws Exception {
		return employeeDao.selectEmpByIdPw(employeeVO);
	}
	
	// employee_id, employee_manager 조회
	@Override
	public List<EmployeeVO> selectEmpIdAndManager() throws Exception {
		return employeeDao.selectEmpIdAndManager();
	}
	
	// 등록 (회원가입)
	@Override
	public int insertEmployee(EmployeeVO params) throws Exception {
		return employeeDao.insertEmployee(params);
	}
		
	// 삭제(계정 삭제, 탈퇴)
	@Override
	public int deleteEmployee(EmployeeVO employeeVO) throws Exception {
		return employeeDao.deleteEmployee(employeeVO);
	}

	// 수정(내 정보 수정)
	@Override
	public int updateEmployee(EmployeeVO employeeVO) throws Exception {
		return employeeDao.updateEmployee(employeeVO);
	}

}
