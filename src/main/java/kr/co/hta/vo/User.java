package kr.co.hta.vo;

import java.util.Date;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
/*
 * @Alias
 * 		- Mapper 파일에서 사용할 별칭을 지정
 * 		- mybatis의 Mapper설정파일에서 kr.co.hta.vo.User 대신 User로 사용할 수 있게한다.
 */		
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
