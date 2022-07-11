package dao;

import java.util.List;

import dto.FileVO;

public interface FileDAO {
	
	// 조회
	public List<FileVO> selectFile() throws Exception;
	
	// file_idx, file_original_name 조회 (support_idx)
	public List<FileVO> selectFileIdxOrinameBySprtIdx(int support_idx) throws Exception;
	
	// 조회 (file_idx)
	public FileVO selectFileByIdx(int file_idx) throws Exception; 

	// 등록
	public int insertFile(FileVO fileVO) throws Exception;
	
	// 삭제 (support_idx)
	public int deleteFile(int support_idx) throws Exception;

	// 삭제 (file_idx)
	public int deleteFileByFileIdx(int file_idx) throws Exception;
}
