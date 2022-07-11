package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.SupportDAO;
import dto.SupportVO;
import service.SupportService;

@Service("SupportService")
public class SupportServiceImpl implements SupportService{

	@Resource(name = "SupportDAO")
	private SupportDAO supportDao;
	
	// 조회 
	@Override
	public List<SupportVO> selectSupport() throws Exception {
		return supportDao.selectSupport();
	}
	
	// support_idx 최댓값 조회
	@Override
	public int maxSupportIdx() throws Exception {
		return supportDao.maxSupportIdx();
	}
	
	// 조회 (10개)
	@Override
	public List<SupportVO> selectTenSupport(int page) throws Exception {
		return supportDao.selectTenSupport(page);
	}
	
	// 조회 (support_idx)
	@Override
	public SupportVO selectSprtByIdx(int support_idx) throws Exception {
		return supportDao.selectSprtByIdx(support_idx);
	}

	// 등록
	@Override
	public int insertSupport(SupportVO params) throws Exception {
		return supportDao.insertSupport(params);
	}

	// 삭제
	@Override
	public int deleteSupport(int support_idx) throws Exception {
		return supportDao.deleteSupport(support_idx);
	}

	// 수정
	@Override
	public int updateSupport(SupportVO supportVO) throws Exception {
		return supportDao.updateSupport(supportVO);
	}
	
}
