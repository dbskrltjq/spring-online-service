package kr.co.hta.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias("User")	
public class User {

	private String id;
	private String email;
	private String password;
	private String name;
	private String phone;
	private String profileImage;
	private String disabled;
	private String teacher;
	private Date createdDate;
	private Date updatedDate;
	
}
