package service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import dao.FileDAO;
import dto.FileVO;
import service.FileService;

@Service("FileService")
public class FileServiceImpl implements FileService {
	
	@Resource(name = "FileDAO")
	private FileDAO fileDao;
	
	// 조회
	@Override
	public List<FileVO> selectFile() throws Exception {
		return fileDao.selectFile();
	}
	
	// file_idx, file_original_name 조회 (support_idx)
	@Override
	public List<FileVO> selectFileIdxOrinameBySprtIdx(int support_idx) throws Exception {
		return fileDao.selectFileIdxOrinameBySprtIdx(support_idx);
	}
	
	// 조회 (file_idx)
	@Override
	public FileVO selectFileByIdx(int file_idx) throws Exception {
		return fileDao.selectFileByIdx(file_idx);
	}
	
	// 등록
	@Override
	public int insertFile(FileVO fileVO) throws Exception {
		return fileDao.insertFile(fileVO);
	}
	
	// 삭제
	@Override
	public int deleteFile(int support_idx) throws Exception {
		return fileDao.deleteFile(support_idx);
	}

	// 삭제 (file_idx)
	@Override
	public int deleteFileByFileIdx(int file_idx) throws Exception {
		return fileDao.deleteFileByFileIdx(file_idx);
	}	

}
