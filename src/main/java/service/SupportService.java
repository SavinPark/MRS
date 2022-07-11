package service;

import java.util.List;

import dto.SupportVO;

public interface SupportService {
	
	// 조회 
	public List<SupportVO> selectSupport() throws Exception;
	
	// support_idx 최댓값 조회
	public int maxSupportIdx() throws Exception;
	
	// 조회 (10개)
	public List<SupportVO> selectTenSupport(int page) throws Exception;
	
	// 조회 (support_idx)
	public SupportVO selectSprtByIdx(int support_idx) throws Exception;
		
	// 등록
	public int insertSupport(SupportVO supportVO) throws Exception;
	
	// 삭제
	public int deleteSupport(int support_idx) throws Exception;
	
	// 수정
	public int updateSupport(SupportVO supportVO) throws Exception;
}
