package kr.board.entity;

import lombok.Data;

@Data
public class Member {
	
	private int memId;
	private String memUserid;
	private String memPassword;
	private String memName;
	private int memAge;
	private String memGender;
	private String memEmail;
	private String memProfile;
}
