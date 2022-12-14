package kr.co.hta.service;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.util.UUID;

import org.springframework.beans.BeanUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.multipart.MultipartFile;

import kr.co.hta.exception.OnlineApplicationException;
import kr.co.hta.mapper.UserMapper;
import kr.co.hta.vo.User;
import kr.co.hta.web.form.UserRegisterForm;

@Service
public class UserService {

	@Value("${online.profile.image.save-directory}")
	private String profileImageSaveDirectory;
	
	@Autowired
	private UserMapper userMapper;
	
	public void addNewUser(UserRegisterForm userRegisterForm) throws Exception {
		
		User user = userMapper.getUserByEmail(userRegisterForm.getEmail());
		if(user != null) {
			throw new RuntimeException("이미 사용중인 이메일입니다.");
		}
		
		user = new User();
		BeanUtils.copyProperties(userRegisterForm, user); 	// email, password, name, phone 값이 User로 복사됨
		
		user.setId(UUID.randomUUID().toString());
		
		MultipartFile upfile = userRegisterForm.getProfileFile();
		if(!upfile.isEmpty()) {
			String filename = upfile.getOriginalFilename();
			user.setProfileImage(filename);
			
			InputStream in = upfile.getInputStream();
			FileOutputStream out = new FileOutputStream(new File(profileImageSaveDirectory, filename));
			FileCopyUtils.copy(in, out);
		}
		
		userMapper.insertUser(user);
	}

	public User login(String email, String password) {
		User user = userMapper.getUserByEmail(email);
		if(user == null) {
			throw new OnlineApplicationException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		
		if(!password.equals(user.getPassword())) {
			throw new OnlineApplicationException("아이디 혹은 비밀번호가 올바르지 않습니다.");
		}
		
		return user;
	}
	
	public void confirmTeacher(String userId) {
		User user = userMapper.getUserById(userId);
		if(user == null) {
			throw new OnlineApplicationException("사용자 정보가 존재하지 않습니다.");
		}
		if("Y".equals(user.getDisabled())) {
			throw new OnlineApplicationException("탈퇴한 사용자는 서비스를 이용할 수 없습니다.");
		}
		if("Y".equals(user.getTeacher())) {
			throw new OnlineApplicationException("이미 지식 공유자로 등록되어 있습니다.");
		}
		
		user.setTeacher("Y");
		userMapper.updateUser(user);
	}

	// 사용자의 최신 정보를 반환
	public User getUserDetail(String userId) {
		return userMapper.getUserById(userId);
	}
}
