package dao.Impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dao.BoardDAO;
import dto.BoardVO;

@Repository("BoardDAO")
public class BoardDAOImpl implements BoardDAO{
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	// 조회
	@Override
	public List<BoardVO> selectBoard() throws Exception {
		return sqlSession.selectList("mapper.boardMapper.selectBoard");
	}
	
	// 행의 개수
	@Override
	public int countBoard() throws Exception {
		return sqlSession.selectOne("mapper.boardMapper.countBoard");
	}
	
	// 조회 (10개)
	@Override
	public List<BoardVO> selectTenBoard(int page) throws Exception {
		return sqlSession.selectList("mapper.boardMapper.selectTenBoard", page);
	}

	// 조회 (support_idx)
	@Override
	public BoardVO selectBrdBySprtIdx(int support_idx) throws Exception {
		return sqlSession.selectOne("mapper.boardMapper.selectBrdBySprtIdx", support_idx);
	}
	
	// 등록
	@Override
	public int insertBoard(BoardVO params) throws Exception {
		return sqlSession.insert("mapper.boardMapper.insertBoard", params);
	}

	// 삭제
	@Override
	public int deleteBoard(int support_idx) throws Exception {
		return sqlSession.delete("mapper.boardMapper.deleteBoard", support_idx);
	}

	// 수정
	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		return sqlSession.update("mapper.boardMapper.updateBoard", boardVO);
	}

}