package kr.co.hta.web.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import kr.co.hta.exception.OnlineApplicationException;
import kr.co.hta.service.UserService;
import kr.co.hta.vo.User;
import kr.co.hta.web.form.UserRegisterForm;

@Controller
@SessionAttributes("LOGIN_USER")
public class HomeController {
	
	@Autowired
	private UserService userService;
	
	
	@GetMapping(path = "/")
	public String home() {
		return "home";
	}
	
	@GetMapping(path = "/register")
	public String registerform(Model model) {
		model.addAttribute("userRegisterForm", new UserRegisterForm());
		return "registerform";
	}
	
	@PostMapping(path = "/register")
	public String register(@Valid UserRegisterForm userRegisterForm, BindingResult errors) throws Exception {
		
		if(errors.hasErrors()) {
			return "registerform";
		}
		try {
			userService.addNewUser(userRegisterForm);
		} catch(OnlineApplicationException e) {
			errors.rejectValue("email", null, e.getMessage());
			return "registerform";
		}
		
		return "redirect:/completed";
	}
	
	@GetMapping(path = "/completed")
	public String completed() {
		return "completed";
	}
	
	@GetMapping(path = "/login")
	public String loginform() {
		return "loginform";
	}
	
	@PostMapping(path = "/login")
	public String login(@RequestParam("email") String email, @RequestParam("password") String password, Model model) {
		
		try {
			User user = userService.login(email, password);
			model.addAttribute("LOGIN_USER", user);
			return "redirect:/";
		} catch (Exception e) {
			return "redirect:/login?fail=invalid";
		}
	}

	@GetMapping(path = "/logout")
	public String logout(SessionStatus sessionStatus) {		
		sessionStatus.setComplete();  
		
		return "redirect:/";
	}
}
