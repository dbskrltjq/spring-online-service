package kr.co.hta.web.form;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.Pattern;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class UserRegisterForm {
	
	@NotBlank(message = "이메일을 입력해주세요!")
	@Email(message = "유효한 이메일 형식이 아닙니다!")
	private String email;
	
	@NotBlank(message = "비밀번호를 입력해주세요!")
	@Pattern(regexp = "^(?=.*[A-Za-z])(?=.*\\d)(?=.*[~!@#$%^&*()+|=])[A-Za-z\\d~!@#$%^&*()+|=]{8,16}$", message = "비밀번호는 숫자, 영어대소문자, 특수문자가 1개 이상, 8글자 ~ 16글자까지 허용됩니다.")
	private String password;
	
	@NotBlank(message = "성명을 입력해주세요!")
	@Pattern(regexp = "^[가-힣]{2,}$", message = "이름은 한글로 2글자 이상만 허용됩니다.")
	private String name;
	
	@NotBlank(message = "전화번호를 입력해주세요!")
	@Pattern(regexp = "^\\d{2,3}-\\d{3,4}-\\d{4}$", message = "유효한 전화번호 형식이 아닙니다.")
	private String phone;
	
	private MultipartFile profileFile;
}
