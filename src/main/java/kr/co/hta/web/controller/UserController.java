package kr.co.hta.web.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hta.annotation.LoginUser;
import kr.co.hta.service.UserService;
import kr.co.hta.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@Autowired
	private UserService userService;
	
	@GetMapping(path = "dashboard")
	public String home(@LoginUser User loginUser, Model model) {
		User user = userService.getUserDetail(loginUser.getId());
		model.addAttribute("user", user);
		
		return "user/home";
	}
	
	@GetMapping(path = "/confirmteacher")
	public String confirmTeacher(@LoginUser User loginUser, Model model) {
		userService.confirmTeacher(loginUser.getId());
		model.addAttribute("user", userService.getUserDetail(loginUser.getId()));
		
		return "redirect:dashboard";
	}
}
