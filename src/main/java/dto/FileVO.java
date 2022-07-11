package dto;

public class FileVO {

	private int file_idx;
	private int support_idx;
	private String file_original_name;
	private String file_save_name;
	private int file_size;
	private String file_extension;
	
	
	public int getFile_idx() {
		return file_idx;
	}
	public void setFile_idx(int file_idx) {
		this.file_idx = file_idx;
	}
	public int getSupport_idx() {
		return support_idx;
	}
	public void setSupport_idx(int support_idx) {
		this.support_idx = support_idx;
	}
	public String getFile_original_name() {
		return file_original_name;
	}
	public void setFile_original_name(String file_original_name) {
		this.file_original_name = file_original_name;
	}
	public String getFile_save_name() {
		return file_save_name;
	}
	public void setFile_save_name(String file_save_name) {
		this.file_save_name = file_save_name;
	}
	public int getFile_size() {
		return file_size;
	}
	public void setFile_size(int file_size) {
		this.file_size = file_size;
	}
	public String getFile_extension() {
		return file_extension;
	}
	public void setFile_extension(String file_extension) {
		this.file_extension = file_extension;
	}
	
	
}
