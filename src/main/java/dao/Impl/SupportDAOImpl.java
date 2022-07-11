package dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dao.SupportDAO;
import dto.SupportVO;


@Repository("SupportDAO")
public class SupportDAOImpl implements SupportDAO {
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	// 조회
	@Override
	public List<SupportVO> selectSupport() throws Exception {
		return sqlSession.selectList("mapper.supportMapper.selectSupport");
	}
	
	// support_idx 최댓값 조회
	@Override
	public int maxSupportIdx() throws Exception {
		return sqlSession.selectOne("mapper.supportMapper.maxSupportIdx");
	}
	
	// 조회 (10개)
	@Override
	public List<SupportVO> selectTenSupport(int page) throws Exception {
		return sqlSession.selectList("mapper.supportMapper.selectTenSupport", page);
	}
	
	// 조회 (support_idx)
	@Override
	public SupportVO selectSprtByIdx(int support_idx) throws Exception {
		return sqlSession.selectOne("mapper.supportMapper.selectSprtByIdx", support_idx);
	}
	
	// 등록
	public int insertSupport(SupportVO params) throws Exception {
		return sqlSession.insert("mapper.supportMapper.insertSupport", params);
	}

	// 삭제
	@Override
	public int deleteSupport(int support_idx) throws Exception {
		return sqlSession.delete("mapper.supportMapper.deleteSupport", support_idx);
	}

	// 수정
	@Override
	public int updateSupport(SupportVO supportVO) throws Exception {
		return sqlSession.update("mapper.supportMapper.updateSupport", supportVO);
	}

}
