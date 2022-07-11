package util;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;
import org.springframework.stereotype.Component;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import dto.SupportVO;

@Component("fileUtils")
public class FileUtils {

	private static final String filePath = "C:\\mrs\\file\\"; // 파일이 저장될 위치

	public List<Map<String, Object>> parseInsertFileInfo(SupportVO supportVO, MultipartHttpServletRequest mpRequest) throws Exception {

		Iterator<String> iterator = mpRequest.getFileNames();

		MultipartFile multipartFile = null;
		String file_original_name = null;
		String file_extension = null;
		String file_save_name = null;

		List<Map<String, Object>> list = new ArrayList<Map<String, Object>>();
		Map<String, Object> listMap = null;

		int support_idx = supportVO.getSupport_idx();

		File file = new File(filePath);
		if (file.exists() == false) {
			file.mkdirs();
		}

		while (iterator.hasNext()) {
			multipartFile = mpRequest.getFile(iterator.next());
			if (multipartFile.isEmpty() == false) {
				file_original_name = multipartFile.getOriginalFilename();
				file_extension = file_original_name.substring(file_original_name.lastIndexOf("."));
				file_save_name = getRandomString() + file_extension;

				file = new File(filePath + file_save_name);
				multipartFile.transferTo(file);
				listMap = new HashMap<String, Object>();
				listMap.put("support_idx", support_idx);
				listMap.put("file_original_name", file_original_name);
				listMap.put("file_save_name", file_save_name);
				listMap.put("file_extension", file_extension);
				listMap.put("file_size", multipartFile.getSize());
				list.add(listMap);
			}
		}
		return list;
	}

	public static String getRandomString() {
		return UUID.randomUUID().toString().replaceAll("-", "");
	}

}
