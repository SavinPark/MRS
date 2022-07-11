package dto;

import java.sql.Date;

public class BoardVO {

	private int board_idx;
	private int support_idx;
	private String board_title;
	private String board_comment;
	private Date board_date;
	
	
	public int getBoard_idx() {
		return board_idx;
	}
	public void setBoard_idx(int board_idx) {
		this.board_idx = board_idx;
	}
	public int getSupport_idx() {
		return support_idx;
	}
	public void setSupport_idx(int support_idx) {
		this.support_idx = support_idx;
	}
	public String getBoard_title() {
		return board_title;
	}
	public void setBoard_title(String board_title) {
		this.board_title = board_title;
	}
	public String getBoard_comment() {
		return board_comment;
	}
	public void setBoard_comment(String board_comment) {
		this.board_comment = board_comment;
	}
	public Date getBoard_date() {
		return board_date;
	}
	public void setBoard_date(Date board_date) {
		this.board_date = board_date;
	}
	
	
}
