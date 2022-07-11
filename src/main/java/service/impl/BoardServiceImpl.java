package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.BoardDAO;
import dto.BoardVO;
import service.BoardService;


@Service("BoardService")
public class BoardServiceImpl implements BoardService {

	@Resource(name = "BoardDAO")
	private BoardDAO boardDao;

	// 조회
	@Override
	public List<BoardVO> selectBoard() throws Exception {
		return boardDao.selectBoard();
	}
	
	// 행의 개수
	@Override
	public int countBoard() throws Exception {
		return boardDao.countBoard();
	}
	
	
	// 조회 (10개)
	@Override
	public List<BoardVO> selectTenBoard(int page) throws Exception {
		return boardDao.selectTenBoard(page);
	}
	
	// 조회 (support_idx)
	@Override
	public BoardVO selectBrdBySprtIdx(int support_idx) throws Exception {
		return boardDao.selectBrdBySprtIdx(support_idx);
	}

	// 등록
	@Override
	public int insertBoard(BoardVO params) throws Exception {
		return boardDao.insertBoard(params);
	}

	// 삭제
	@Override
	public int deleteBoard(int support_idx) throws Exception {
		return boardDao.deleteBoard(support_idx);
	}

	// 수정
	@Override
	public int updateBoard(BoardVO boardVO) throws Exception {
		return boardDao.updateBoard(boardVO);
	}
	
}
