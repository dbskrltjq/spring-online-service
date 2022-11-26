package kr.co.hta.web.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.hta.vo.User;

@Controller
@RequestMapping("/user")
public class UserController {

	@GetMapping(path = "dashboard")
	public String home(User user) {
		
		return "user/hone";
	}
}
