package dao.Impl;

import java.util.List;
import javax.annotation.Resource;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import dao.FileDAO;
import dto.FileVO;


@Repository("FileDAO")
public class FileDAOImpl implements FileDAO {
	
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	// 조회
	@Override
	public List<FileVO> selectFile() throws Exception {
		return sqlSession.selectList("mapper.fileMapper.selectFile");
	}
	
	// file_idx, file_original_name 조회 (support_idx)
	@Override
	public List<FileVO> selectFileIdxOrinameBySprtIdx(int support_idx) throws Exception {
		return sqlSession.selectList("mapper.fileMapper.selectFileIdxOrinameBySprtIdx", support_idx);
	}

	// 조회 (file_idx)
	@Override
	public FileVO selectFileByIdx(int file_idx) throws Exception {
		return sqlSession.selectOne("mapper.fileMapper.selectFileByIdx", file_idx);
	}
		
	// 등록
	@Override
	public int insertFile(FileVO fileVO) {
		return sqlSession.insert("mapper.fileMapper.insertFile", fileVO);
	}

	// 삭제 (support_idx)
	@Override
	public int deleteFile(int support_idx) throws Exception {
		return sqlSession.delete("mapper.fileMapper.deleteFile", support_idx);
	}
	
	// 삭제 (file_idx)
	@Override
	public int deleteFileByFileIdx(int file_idx) throws Exception {
		return sqlSession.delete("mapper.fileMapper.deleteFileByFileIdx", file_idx);
	}

}
