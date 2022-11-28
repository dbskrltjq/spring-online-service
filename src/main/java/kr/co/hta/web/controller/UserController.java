package kr.co.hta.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hta.annotation.LoginUser;
import kr.co.hta.service.CourseService;
import kr.co.hta.service.UserService;
import kr.co.hta.vo.Course;
import kr.co.hta.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private CourseService courseService;
	
	@GetMapping("/dashboard")
	public String home(@LoginUser User loginUser, Model model) {	// 지식공유자로 신청후에 변경된 화면으로 갱신될 수 있도록
		User user = userService.getUserDetail(loginUser.getId());	// @LoginUser User loginUser : 최신의 정보를 가져오기 위해서
		model.addAttribute("user", user);
		
		List<Course> courses = courseService.getRecentAddedCourses(user.getId());
		model.addAttribute("courses", courses);
		
		return "user/home";
	}
	
	@GetMapping("/courses")	// 내가 등록한 강의들
	public String courses(@LoginUser User loginUser, Model model) {
		List<Course> courses = courseService.getMyCourses(loginUser.getId());
		model.addAttribute("courses", courses);
		
		return "user/courses";
	}
	
	
	@GetMapping(path="/confirmteacher")
	public String confirmTeacher(@LoginUser User loginUser, Model model) {	// 지금 로그인한 사람을 강사로 등록시켜야 하므로 
		userService.confirmTeacher(loginUser.getId());
		User user =  userService.getUserDetail(loginUser.getId());
		model.addAttribute("user", user); // 최신의 정보된 사용자 정보를 조회해서 Model에 저장한다.
		
		return "redirect:dashboard";
	}
	
	@GetMapping(path = "/profile")
	public String profile(@LoginUser User loginUser, Model model) {
		User user = userService.getUserDetail(loginUser.getId());
		model.addAttribute("user", user);
		
		return "user/profile";
	}
	
}
