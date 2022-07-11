package dao;

import java.util.List;

import dto.EmployeeVO;

public interface EmployeeDAO {
	
	// 조회
	public List<EmployeeVO> selectEmployee() throws Exception;
	
	// 총 행의 개수
	public int countEmployee() throws Exception;
	
	// 조회 (한 페이지에 10건)
	public List<EmployeeVO> selectTenEmployee(int page) throws Exception;
	
	// 조회 (employee_id)
	public EmployeeVO selectEmpById(String employee_id) throws Exception;
		
	// 조회 (employee_id, employee_password)
	public EmployeeVO selectEmpByIdPw(EmployeeVO employeeVO) throws Exception;
	
	// employee_id, employee_manager 조회
	public List<EmployeeVO> selectEmpIdAndManager() throws Exception;
	
	// 등록(회원가입)
	public int insertEmployee(EmployeeVO employeeVO) throws Exception;
	
	// 삭제(계정 삭제, 탈퇴)
	public int deleteEmployee(EmployeeVO employeeVO) throws Exception;
	
	// 수정(내 정보 수정)
	public int updateEmployee(EmployeeVO employeeVO) throws Exception;
}
