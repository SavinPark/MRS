package dao;

import java.util.List;

import dto.BoardVO;

public interface BoardDAO {
	
	// 조회 
	public List<BoardVO> selectBoard() throws Exception;
	
	// 행의 개수
	public int countBoard() throws Exception;
	
	// 조회 (10개)
	public List<BoardVO> selectTenBoard(int page) throws Exception;
	
	// 조회 (support_idx)
	public BoardVO selectBrdBySprtIdx(int support_idx) throws Exception;
	
	// 등록
	public int insertBoard(BoardVO boardVO) throws Exception;
	
	// 삭제
	public int deleteBoard(int support_idx) throws Exception;
	
	// 수정
	public int updateBoard(BoardVO boardVO) throws Exception;

}
